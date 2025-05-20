#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 48:00:00
#SBATCH -J braker_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.hamback.7619@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools HISAT2/2.2.1 samtools/1.19 braker/2.1.6

#Files
GENOMFIL=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/Maskeroutputs/Maskeroutput/pilon.fasta.masked
BAMFILER=Sample1_control.bam,Sample2_control.bam,Sample3_control.bam,Sample4_heat_treated.bam,Sample5_heat_treated.bam,Sample6_heat_treated.bam
BAMREPO=/home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/code/hisat_analysis

#Commands
#chmod a+w -R /home/loha7619/GenomAnalys/Genome_Analysis_Master_Course/code/BRAKER_analysis/augustus_config/species
cp -vf /sw/bioinfo/GeneMark/keyfile/gm_key $HOME/.gm_key
source $AUGUSTUS_CONFIG_COPY
braker.pl --species=n_japonicum \
--genome=$GENOMFIL \
--bam=Sample1_control.sorted.bam,Sample2_control.sorted.bam,Sample3_control.sorted.bam,Sample4_heat_treated.sorted.bam,Sample5_heat_treated.sorted.bam,Sample6_heat_treated.sorted.bam
--AUGUSTUS_CONFIG_PATH=/home/loha7619/augustus_config \ 
--AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin \
--AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts \
--GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy

