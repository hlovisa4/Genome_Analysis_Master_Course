#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH -J eggnog_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools
module load eggNOG-mapper/2.1.9

#Files
PROTEINFROMBRAKER=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/code/BRAKER_analysis/braker/braker.aa
BRAKERGFF=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/code/BRAKER_analysis/braker/braker.gff

#Commands
emapper.py -i $PROTEINFROMBRAKER -o eggnog_analysis --decorate_gff $BRAKERGFF --decorate_gff_ID_field ID --cpu 8
