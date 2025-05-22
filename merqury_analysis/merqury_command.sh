#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 24:00:00
#SBATCH -J merqury_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools

#Files
KTABFIL=/proj/uppmax2025-3-3/Genome_Analysis/4_Zhou_2023/reads/chr3_nanopore_15mers.ktab
ASSEMBLY=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/flye_files/assembly.fasta
#Command
singularity exec /proj/uppmax2025-3-3/Genome_Analysis/tools.sif MerquryFK $KTABFIL $ASSEMBLY merqury_results
