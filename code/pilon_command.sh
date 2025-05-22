#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH -J pilon_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools
module load java 
module load Pilon/1.24

#Files
ASSEMBLY=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/flye_files/assembly.fasta
BAMFILE=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/code/aligned_reads.sorted.bam

#Commands
java -jar $PILON_HOME/pilon.jar --genome $ASSEMBLY --bam $BAMFILE --outdir /home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/Pilon_analysis
