#!/bin/bash

# Train model for each dataset
# for DATA_TYPE in 'CELL_LINE' 'CELL_TYPE' 'DISEASE' 'EXP_ASSAY' 'SUBCELLULAR' 'TISSUE' 'SMALL_MOLECULE' #'GENEPROD' 'ORGANISM'
for DATA_TYPE in  'ORGANISM' #'EXP_ASSAY' 'TISSUE' 'GENEPROD' 'CELL_LINE' 'CELL_TYPE' 'DISEASE' 'SMALL_MOLECULE' 'SUBCELLULAR'
do
    bash pretrain.sh 2 ../sourcedata_training_data/${DATA_TYPE}_positive_example_pairs.txt ../trained_models/soda/${DATA_TYPE}/
done

# bash pretrain.sh 1 ../sourcedata_training_data/GENEPROD_positive_example_pairs.txt ../trained_models/soda/GENEPROD/