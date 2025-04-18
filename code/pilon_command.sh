#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J pilon_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools
module load pilon
module load java 

#Files
ASSEMBLY=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/flye_files/assembly.fasta
BAMFILE=

#Commands
pilon --genome $ASSEMBLY --bam $BAMFILE --outdir /home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/Pilon_analysis
