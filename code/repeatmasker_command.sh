#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 24:00:00
#SBATCH -J repeatmasker_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools
module load miniconda3/4.3.30-qdauveb
source activate repeatmodeler
module load RepeatModeler/2.0.4
module load RepeatMasker/4.1.5

#Files
ALIGNMENT=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/Pilon_analysis/pilon.fasta

#Commands
BuildDatabase -name N.japonicum $ALIGNMENT
RepeatModeler -database N.japonicum -threads 16 -LTRStruct > out.file
RepeatMasker -threads 16 -gff -lib consensi.fa.classified -dir Maskeroutput $ALIGNMENT


