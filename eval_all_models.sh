#!/bin/bash
DEVICE=$1

# With abbreviation resolution
for DATASET in  "ncbi_disease" "bc5cdr" "nlmchem" "medmentions_st21pv" "nlm_gene" "gnormplus" "medmentions_full" 
do
	MODEL_DIR="trained_models/${DATASET}"
	DICT_PATH="../data/alias_mappings/${DATASET}_aliases.txt"
	CUDA_VISIBLE_DEVICES=$DEVICE python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET \
	--output_dir ./output/ \
	--dict_cache_path cached_dicts/${DATASET}_dict.pt \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \
	--abbreviations_path ../data/abbreviations.json \
	# --debug

done

# Without abbreviation resolution
for DATASET in "ncbi_disease" "bc5cdr" "nlmchem" "nlm_gene" "gnormplus" "medmentions_st21pv" "medmentions_full" 
# for DATASET in "medmentions_full"
do
	MODEL_DIR="trained_models/${DATASET}"
	DICT_PATH="../data/alias_mappings/${DATASET}_aliases.txt"
	CUDA_VISIBLE_DEVICES=$DEVICE python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET \
	--output_dir ./output/ \
	--dict_cache_path cached_dicts/${DATASET}_dict.pt \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \

done

# # BC5CDR
# # MODEL_DIR="trained_models/mesh/" 
# MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
# DICT_PATH=../data/mesh_to_alias.txt
# DATASET_NAME=bc5cdr

# CUDA_VISIBLE_DEVICES=0 python3 run_bigbio_inference.py \
# 	--model_dir $MODEL_DIR \
# 	--dictionary_path $DICT_PATH \
# 	--dataset_name $DATASET_NAME \
# 	--output_dir ./output/ \
# 	--use_cuda \
# 	--max_length 25 \
# 	--batch_size 32 \
# 	--abbreviations_path ../data/abbreviations.json


# # NLM Chem
# # MODEL_DIR="trained_models/mesh/" 
# MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
# DICT_PATH=../data/mesh_to_alias.txt
# DATASET_NAME=nlmchem

# CUDA_VISIBLE_DEVICES=1 python3 run_bigbio_inference.py \
# 	--model_dir $MODEL_DIR \
# 	--dictionary_path $DICT_PATH \
# 	--dataset_name $DATASET_NAME \
# 	--output_dir ./output/ \
# 	--use_cuda \
# 	--max_length 25 \
# 	--batch_size 32 \
# 	--abbreviations_path ../data/abbreviations.json


# # NLM Gene
# # MODEL_DIR="trained_models/entrez/" 
# MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
# DICT_PATH=../data/entrez_to_alias.txt
# DATASET_NAME=nlm_gene

# CUDA_VISIBLE_DEVICES=2 python3 run_bigbio_inference.py \
# 	--model_dir $MODEL_DIR \
# 	--dictionary_path $DICT_PATH \
# 	--dataset_name $DATASET_NAME \
# 	--output_dir ./output/ \
# 	--use_cuda \
# 	--max_length 25 \
# 	--batch_size 32 \
# 	--abbreviations_path ../data/abbreviations.json


# # GNormPlus
# # MODEL_DIR="trained_models/entrez/" 
# MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
# DICT_PATH=../data/entrez_to_alias.txt
# DATASET_NAME=gnormplus

# CUDA_VISIBLE_DEVICES=3 python3 run_bigbio_inference.py \
# 	--model_dir $MODEL_DIR \
# 	--dictionary_path $DICT_PATH \
# 	--dataset_name $DATASET_NAME \
# 	--output_dir ./output/ \
# 	--use_cuda \
# 	--max_length 25 \
# 	--batch_size 32 \
# 	--abbreviations_path ../data/abbreviations.json



# # Medmentions Full
# MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext" 
# DICT_PATH=./data/medmentions/umls_dict_uncased.txt
# DATASET_NAME=medmentions_full

# CUDA_VISIBLE_DEVICES=0 python3 run_bigbio_inference.py \
# 	--model_dir $MODEL_DIR \
# 	--dictionary_path $DICT_PATH \
# 	--dataset_name $DATASET_NAME \
# 	--output_dir ./output/ \
# 	--use_cuda \
# 	--max_length 25 \
# 	--batch_size 32 \
# 	--abbreviations_path ../data/abbreviations.json
# 	# --debug \



# # MedMentions ST21PV
# MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext" 
# DICT_PATH=../data/st21pv_to_alias.txt 
# DATASET_NAME=medmentions_st21pv

# CUDA_VISIBLE_DEVICES=1 python3 run_bigbio_inference.py \
# 	--model_dir $MODEL_DIR \
# 	--dictionary_path $DICT_PATH \
# 	--dataset_name $DATASET_NAME \
# 	--output_dir ./output/ \
# 	--use_cuda \
# 	--max_length 25 \
# 	--batch_size 32 \
# 	--abbreviations_path ../data/abbreviations.json \



# # NCBI Disease
# MODEL_DIR="trained_models/mesh_and_omim_disease_only/" 
# # MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
# DICT_PATH=../data/mesh_and_omim_to_alias_disease_only.txt
# DATASET_NAME=ncbi_disease

# CUDA_VISIBLE_DEVICES=2 python3 run_bigbio_inference.py \
# 	--model_dir $MODEL_DIR \
# 	--dictionary_path $DICT_PATH \
# 	--dataset_name $DATASET_NAME \
# 	--output_dir ./output/ \
# 	--use_cuda \
# 	--max_length 25 \
# 	--batch_size 32 \
# 	--abbreviations_path ../data/abbreviations.json



# # NCBI Disease
# # MODEL_DIR="trained_models/mesh_omim_disease/" 
# MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
# DICT_PATH=../data/mesh_and_omim_to_alias_disease_only.txt
# DATASET_NAME=ncbi_disease

# CUDA_VISIBLE_DEVICES=3 python3 run_bigbio_inference.py \
# 	--model_dir $MODEL_DIR \
# 	--dictionary_path $DICT_PATH \
# 	--dataset_name $DATASET_NAME \
# 	--output_dir ./output/ \
# 	--use_cuda \
# 	--max_length 25 \
# 	--batch_size 32 \
# 	--abbreviations_path ../data/abbreviations.json