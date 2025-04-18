#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J bwa_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

#Files
ASSEMBLY=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/flye_files/assembly.fasta
ILLUMINAR1=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/Trimmed_illumina_DNA/trimmed_1P.fq.gz
ILLUMINAR2=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/Trimmed_illumina_DNA/trimmed_2P.fq.gz
#commands
bwa index $ASSEMBLY
bwa mem -t 4 $ASSEMBLY $ILLUMINAR1 $ILLUMINAR2 | \
samtools sort -@ 4 -o aligned_reads.sorted.bam
