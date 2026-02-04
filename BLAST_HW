#!/bin/bash

#SBATCH --job-name=Zebrafish_blast                      #Job name
#SBATCH --partition=batch                               #Partition name (batch, highmem_p, gpu_p)
#SBATCH --ntasks=1                                      #1 task (process) for below commands
#SBATCH --cpus-per-task=4                               #CPU core count per task, 1 CPU default
#SBATCH --mem=10G                                      #Memeory per node (4GB); default using M as unit
#SBATCH --time=04:00:00                               #time limit in hrs:min:sec or days-hours:minutes:seconds
#SBATCH --output=logs/%x_%j.out                         #Standard output log
#SBATCH --error=logs/%x_%j.err
#SBATCH --mail-user=dck52764@uga.edu                    #Where mail is sent
#SBATCH --mail-type=END,FAIL                            #get mail events for (BEGIN, END, FAIL, ALL)

# in working directory /scratch/dck52764/BLAST_HW/
# load modules to be used
ml BLAST+/2.16.0-gompi-2024a
ml DIAMOND/2.1.15-GCC-13.3.0

# download Zebrafish  protein sequences
curl -o zebrafish.1.protein.faa.gz -L https://osf.io/68mgf/download
gunzip zebrafish.1.protein.faa.gz

# make BLAST directory
makeblastdb -in zebrafish.1.protein.faa -dbtype prot -parse_seqids -out zebrafish_db

# get protein sequences from class data
cp /work/pbgg8900/instructor_data/mgProteome.fasta .

blastp -num_threads 4 -query mgProteome.fasta -out blast.zebrafish.out -db zebrafish_db

# use program Diamond instead
# create diamond-formatted database file 
diamond makedb --in zebrafish.1.protein.faa -d zebrafish_diamond_db

# run diamond search
diamond blastp -p 4 -d zebrafish_diamond_db -q mgProteome.fasta -o diamond.zebrafish.matches.tsv
