#!/bin/bash
#BSUB -J idshw5
#BSUB -q normal_test
#BSUB -n 24
#BSUB -o %J.out
#BSUB -e %J.err
module load anaconda3
source activate hw5
python3 MY_PATH/test.py

