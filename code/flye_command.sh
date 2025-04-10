#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 26:00:00
#SBATCH -J canu_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out
# Load modules
git clone https://github.com/fenderglass/Flye
cd Flye
python setup.py install

FASTAFILE=/proj/uppmax2025-3-3/Genome_Analysis/4_Zhou_2023/reads/chr3_clean_nanopore.fq.gz 
# Your commands
echo "Performing flye on $FASTAFILE"
flye --nano-raw $FASTAFILE --out_dir /home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/flye_files --genome-size 15m --threads 8
