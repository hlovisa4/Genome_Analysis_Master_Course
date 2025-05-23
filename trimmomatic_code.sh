#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 48:00:00
#SBATCH -J trimm
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out

module load bioinfo-tools
module load trimmomatic
 java -jar $TRIMMOMATIC_ROOT/trimmomatic.jar PE   -trimlog trimmomatic_ren.log -summary trimmomatic_summary.txt /proj/uppmax2025-3-3/Genome_Analysis/4_Zhou_2023/reads/chr3_illumina_R1.fastq.gz /proj/uppmax2025-3-3/Genome_Analysis/4_Zhou_2023/reads/chr3_illumina_R2.fastq.gz  trimmed_1P.fq.gz trimmed_1U.fq.gz trimmed_2P.fq.gz trimmed_unpaired_2U.fq.gz ILLUMINACLIP:$TRIMMOMATIC_ROOT/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 
