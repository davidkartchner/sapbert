#!/bin/bash

# # MeSH
# python generate_pretrain_data.py --input_dict_path /efs/davidkartchner/el-robustness-comparison/data/mesh_to_alias.txt --output_filepath training_data/mesh_positive_example_pairs.txt

# # MeSH + OMIM
# python generate_pretrain_data.py --input_dict_path /efs/davidkartchner/el-robustness-comparison/data/mesh_and_omim_to_alias.txt --output_filepath training_data/mesh_and_omim_positive_example_pairs.txt

# # ST21PV
# python generate_pretrain_data.py --input_dict_path /efs/davidkartchner/el-robustness-comparison/data/st21pv_to_alias.txt --output_filepath training_data/st21pv_positive_example_pairs.txt

# # NCBI Gene
# python generate_pretrain_data.py --input_dict_path /efs/davidkartchner/el-robustness-comparison/data/entrez_to_alias.txt --output_filepath training_data/entrez_positive_example_pairs.txt

# # MeSH + OMIM Disease Only
# python generate_pretrain_data.py --input_dict_path /efs/davidkartchner/el-robustness-comparison/data/mesh_and_omim_to_alias_disease_only.txt --output_filepath training_data/mesh_and_omim_disease_only_positive_example_pairs.txt

# # MeSH Chem Only
# python generate_pretrain_data.py --input_dict_path /efs/davidkartchner/el-robustness-comparison/data/mesh_to_alias_chem_only.txt --output_filepath training_data/mesh_chem_only_positive_example_pairs.txt

for DATASET in "bc5cdr" "medmentions_full" "medmentions_st21pv" "gnormplus" "nlmchem" "nlm_gene" "ncbi_disease"
do
    python generate_pretrain_data.py --input_dict_path ../data/alias_mappings/${DATASET}_aliases.txt --output_filepath training_data/${DATASET}_positive_example_pairs.txt
done