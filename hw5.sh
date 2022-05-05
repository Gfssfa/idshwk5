#!/bin/bash
#BSUB -J idshw5
#BSUB -q QUEUE_YOU_USE
#BSUB -n NUMBER_OF_CPUS
#BSUB -o %J.out
#BSUB -e %J.err
module load anaconda3
source activate hw5
python3 MY_PATH/test.py

