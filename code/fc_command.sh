#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 36:00:00
#SBATCH -J fc_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools
module load subread

#Files
GTFFILE=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/code/BRAKER_analysis/braker/braker.gtf
#Commands
featureCounts -T 4 -t exon -g gene_id -a $GTFFILE -o counts.txt Sample1_control.sorted.bam Sample2_control.sorted.bam Sample3_control.sorted.bam Sample4_heat_treated.sorted.bam Sample5_heat_treated.sorted.bam Sample6_heat_treated.sorted.bam -p
