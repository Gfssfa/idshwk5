# idshw5
## task description
test.py will read train.txt and test.txt, then labeled the domains in test.txt and output them to result.txt
Python3 Preferred 
### Hint 
* domain name length 
* numbers in the domain name 
* entropy of letteres 
* segmentation

## run code at a HPC cluster
Running code at my little cloude server needs too much time. Luckily, I have an account of a HPC cluster.
### build environment
To run python scripts, firstly, we need to build environment. Most people may add side-packages at their base environment. A more graceful method is using environment tools like conda to build a special environment for a job. Activate the job's nevironment, add packages and run python scripts. The HPC cluster's job management system is powerd by IBM, if you use other system please follow your job system.
``` bash
# use module anaconda3 or you can install by yourself
module load anaconda3
# create a environment named as hw5 with python's version 3.8 
conda create -n hw5 python=3.8
# acitvate the environment
conda activate hw5
# install scikit-learn
# you may use -c to change channel like 
# use Intel's scikit-learn: conda install scikit-learn -c intel
conda install scikit-learn
```
### how to write a job script
We need to submit job scripts to run our programs.
Since scikit-learn does not support GPU, I choose CPU queues to run my python script. 
A sample of my job script written by shell scripts is as follw.
``` shell
#!/bin/bash
#BSUB -J idshw5
#BSUB -q QUEUE_YOU_USE
#BSUB -n NUMBER_OF_CPUS
#BSUB -o %J.out
#BSUB -e %J.err
module load anaconda3
source activate hw5
python3 MY_PATH/test.py
```
**Notice: use environment in job script by command `source` not `activate`**
### submit job to queues and check job's states
``` bash
#submit job script
bsub < hw5.sh
#if submition is successful, you will get a job ID
#check the state of your job
bjobs -l NUMBER_of_JOBID
```
