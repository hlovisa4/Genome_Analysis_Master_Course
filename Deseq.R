if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("DESeq2")
browseVignettes("DESeq2")

library(DESeq2)

# Load the featureCounts output
fc <- read.delim("counts.txt", comment.char="#", stringsAsFactors=FALSE)

# Remove the first 5 annotation columns
countdata <- fc[, 7:ncol(fc)]
rownames(countdata) <- fc$Geneid
condition <- factor(c("control", "control", "control", "heat", "heat", "heat"))
coldata <- data.frame(condition=condition)
rownames(coldata) <- colnames(countdata)

# Create DESeq2 object
dds <- DESeqDataSetFromMatrix(countData = countdata,
                              colData = coldata,
                              design = ~ condition)

# Run DESeq2
dds <- DESeq(dds)

# Get results (heat vs control)
res <- results(dds)

vsd <- vst(dds, blind=FALSE)
plotPCA(vsd, intgroup="condition")


# View top genes
head(res[order(res$padj), ])
# Save full results
write.csv(as.data.frame(res), file="DESeq2_results.csv")

# MA plot
plotMA(res, ylim=c(-5, 5))

# Histogram of adjusted p-values
hist(res$padj, breaks=50, col="grey")
