import pandas as pd
import numpy as np
import random
import sys
import argparse

from tqdm.auto import tqdm
from itertools import combinations


def generate_positive_pairs(example_dict, max_pairs_per_curie=50):
    """
    Generate positive pairs for SapBERT contrastive training
    """
    positive_pairs = []
    for curie, names in tqdm(example_dict.items()):
        pairs = list(combinations(names, r=2))
        if len(pairs) > max_pairs_per_curie:
            pairs = random.sample(pairs, k=max_pairs_per_curie)

        for p in pairs:
            line = str(curie) + "||" + p[0] + "||" + p[1]
            positive_pairs.append(line)

    return positive_pairs


def write_positive_pairs(positive_pairs, outfile):
    with open(outfile, "w") as f:
        f.write("\n".join(positive_pairs))


def read_examples(filepath):
    # Read file
    with open(filepath, "r") as f:
        lines = f.read().split("\n")

    # Construct dict mapping each CURIE to a list of aliases
    umls_dict = {}
    for line in tqdm(lines):
        cui, name = line.split("||")
        name = name.lower()
        if cui in umls_dict:
            umls_dict[cui].add(name)
        else:
            umls_dict[cui] = set([name])

    for key, val in umls_dict.items():
        umls_dict[key] = list(val)

    return umls_dict


def main(args):
    curie_dict = read_examples(args.input_dict_path)
    positive_pairs = generate_positive_pairs(curie_dict)
    write_positive_pairs(positive_pairs, args.output_filepath)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--input_dict_path", type=str, required=True)
    parser.add_argument("--output_filepath", type=str, required=True)
    args = parser.parse_args()
    main(args)
