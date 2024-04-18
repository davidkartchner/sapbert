#!/bin/bash
DEVICE=$1
DATASET="sourcedata_nlp"

# for DATASET in "ncbi_disease" "bc5cdr" "nlmchem" "nlm_gene" "gnormplus" "medmentions_st21pv" "medmentions_full" 
# for DATASET in "medmentions_full"
for DATA_TYPE in 'CELL_LINE' 'CELL_TYPE' 'DISEASE' 'EXP_ASSAY' 'SUBCELLULAR' 'TISSUE' 'SMALL_MOLECULE' #'GENEPROD' 'ORGANISM'
do
	MODEL_DIR="trained_models/soda/${DATA_TYPE}"
	DICT_PATH="../data/soda_aliases/${DATA_TYPE}.txt"
	CUDA_VISIBLE_DEVICES=$DEVICE python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET \
    --data_type $DATA_TYPE \
	--output_dir "./output/${DATA_TYPE}" \
	--dict_cache_path cached_dicts/soda/${DATA_TYPE}_dict.pt \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \

done