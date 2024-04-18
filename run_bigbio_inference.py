import logging
import sys
import ujson


from bigbio_loader import sapbert_collate_fn, SapBertBigBioDataset
from evaluation.bigbio_eval import (
    sapbert_predict,
    parse_args_bigbio,
    init_logging,
    load_dictionary,
)
from torch.utils.data import DataLoader

# from src.data_loader import DictionaryDataset
from src.model_wrapper import Model_Wrapper


sys.path.insert(0, "..")
from utils import make_unique_model_savepath


LOGGER = logging.getLogger()


def main(args):

    # Load dictionary of aliases
    eval_dictionary = load_dictionary(dictionary_path=args.dictionary_path)

    if args.abbreviations_path is None:
        resolve_abbreviations = False
    else:
        resolve_abbreviations = True

    # Load data
    data = SapBertBigBioDataset(
        args.dataset_name,
        splits_to_include=[args.split],
        path_to_abbreviation_dict=args.abbreviations_path,
        resolve_abbreviations=resolve_abbreviations,
        data_type=args.data_type
    )
    LOGGER.info(f"{len(data)=}")
    loader = DataLoader(data, collate_fn=sapbert_collate_fn, batch_size=args.batch_size)
    LOGGER.info(f"{len(loader)=}")
    # DataLoader(dataset, collate_fn=sapbert_collate_fn, batch_size=64)

    # Load Model
    model_wrapper = Model_Wrapper().load_model(
        path=args.model_dir,
        max_length=args.max_length,
        use_cuda=args.use_cuda,
    )

    # Get unique save path
    preds_save_path = make_unique_model_savepath(
        dir=args.output_dir,
        model="sapbert",
        dataset=args.dataset_name,
        file_ext="json",
    )

    dict_cache_filepath = args.dict_cache_path
    LOGGER.info(f"Dict CACHE Path: {dict_cache_filepath}")
    LOGGER.info(f"Debugging mode? {args.debug}")

    results = sapbert_predict(
        model_wrapper=model_wrapper,
        eval_dictionary=eval_dictionary,
        dataloader=loader,
        batch_size=args.batch_size,
        topk=args.topk,
        dict_cache_filepath=dict_cache_filepath,
        debug=args.debug,
    )

    LOGGER.info(f"Saving results to {preds_save_path}")
    with open(preds_save_path, "w") as f:
        f.write(ujson.dumps(results, indent=2))


if __name__ == "__main__":
    init_logging()
    args = parse_args_bigbio()

    main(args)
