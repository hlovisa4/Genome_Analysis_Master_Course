#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 48:00:00
#SBATCH -J canu_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out
# Load modules
module load bioinfo-tools
module load canu

FASTAFILE=/proj/uppmax2025-3-3/Genome_Analysis/4_Zhou_2023/reads/chr3_clean_nanopore.fq.gz 
# Your commands
echo "Performing canu on $FASTAFILE"
canu \
   -p canu_assembly_N_Japonicum \
   -d /home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/Canu_files \
   genomeSize=13.6m \
   -nanopore $FASTAFILE

