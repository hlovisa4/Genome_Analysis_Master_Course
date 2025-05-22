# Genome_Analysis_Master_Course
Collection of the work for the master course "Genome Analysis", spring 2025. 

This project will be a recreation of the paper "Chromosome-level genome assembly of Niphotrichum japonicum provides new insights into heat stress responses in mosses" by Zhou et al. (2023). My goal is to assemble chromosome 3 and to examine which genes regulate the heat stress resilience in Niphotrichum japonicum. 

Project description:
Step 1. Preprocessing
I started with checking the quality of my illumina reads using FASTQC before and after trimming using trimmomatic. The quality was good before with positions with quality score below 20, as shown with the high retention rate of the trimming (98.8%). AFTERWARDS

Step 2. Genome assembly
The Nanopore long-read DNA data was assembled using two different assemblers, Canu and Flye. Quast analysis was performed to determine which assembly to move forward with and the Flye assembly was selected due to lower amounts of contigs (48 vs 107), higher N50 (2069003 vs 864513) and lower L50 (3 vs 6). These results are shown in the repositories quast_analysis and quast_analysis_canu. 
The assembly was also evaluated using BUSCO with the command "busco -i assembly.fasta -m genome --auto-lineage-euk --out busco_results -f", which showed 
For an extra analysis, I also ran Merqury to assess the assembly which showed that 
To polish the flye assembly, the Illumina was first aligned to the Nanopore assembly using BWA, and the polishing was performed using Pilon. Lastly, the repeats in the pilon fasta-file were masked using RepeatMasker. 

Step 3. Annotation
Structural annotation was performed using BRAKER2 by comparing the reference genome against all RNA samples, and functional annotation was performed on the braker.aa using EggNog-mapper. 

Step 4. Expression Analysis
Each RNA sample was firstly aligned to the reference genome before using featureCounts to extract the expression levels. These were then anlysed using an R-script for DESeq ("Deseq.R") and the results showed that the most differently expressed genes were ....

