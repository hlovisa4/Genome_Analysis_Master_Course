#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J canu_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out
# Load modules
module load bioinfo-tools
module load fastqc

ILLUMINAFILE=/proj/uppmax2025-3-3/Genome_Analysis/4_Zhou_2023/reads/chr3_clean_nanopore.fq.gz 
# Your commands
