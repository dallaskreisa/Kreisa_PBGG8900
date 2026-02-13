#!/bin/bash

#SBATCH --job-name=fastqc                              #Job name
#SBATCH --partition=batch                              #Partition name (batch, highmem_p, gpu_p)
#SBATCH --ntasks=1                                     #1 task (process) for below commands
#SBATCH --cpus-per-task=4                              #CPU core count per task, 1 CPU default
#SBATCH --mem=10G                                      #Memeory per node (4GB); default using M as unit
#SBATCH --time=04:00:00                                #time limit in hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=logs/%x_%j.out                        #Standard output log
#SBATCH --error=logs/%x_%j.err
#SBATCH --mail-user=dck52764@uga.edu                   #Where mail is sent
#SBATCH --mail-type=END,FAIL                           #get mail events for (BEGIN, END, FAIL, ALL)

ml FastQC/0.12.1-Java-11

fastqc -o results SRR7774156_2.fastq
