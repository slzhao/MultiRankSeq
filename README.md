MultiRankSeq
============
* [Introduction](#Introduction)
* [Download and install](#download)
* [Example](#example)
* [Usage](#usage)
* [Report](#report)
* [Reproduce the report](#reproduce)

<a name="Introduction"/>

# Introduction #

RNAseq technology is rapidly replacing microarray technology as the tool of choice for gene expression profiling. While providing more quantitative information than microarray, the analysis of RNAseq has been particularly difficult compare to microarray analysis. To date, many RNAseq analysis packages have been developed, and many evaluation studies have been performed on these packages.  Not surprisingly, different evaluation study produced different opinion on which packages is the most ideal.  We found that often using different package will generate complete different results.  To solve this solve this dilemma, we propose a rank sum approach using multiple RNAseq analysis package (MultiRankSeq) to combine the results from multiple RNAseq package analysis. In addition to differential expression analysis, MultiRankSeq also performs quality control and give detailed graphical post analysis report.    

<a name="download"/>

# Download and install

You can install MultiRankSeq package in R from [github](https://github.com/slzhao/MultiRankSeq/) by following codes:

	install.packages("devtools") #If you havn't installed devtools package, install it first
	library(devtools)
	install_github("slzhao/MultiRankSeq")

<a name="example"/>

# Example

After you have installed MultiRankSeq package. You can enter R and use following R codes to see the examples for it.
	
	#Load MultiRankSeq package
	library(MultiRankSeq)
	#View help files
	?MultiRankSeqReport
	#A simple example
	example(MultiRankSeqReport)

<a name="usage"/>

# Usage

In MultiRankSeq package, MultiRankSeqReport is the primary function to generate MultiRankSeq report based on counts data.

	#Assume the counts data was loaded into R as a matrix or data frame. Its name was countsData
	str(countsData)
	#Assume the experiment has 4 normal samples and 4 disease samples. We used 0 to represent normal samples and 1 to represent disease samples. MultiRankSeq will compare disease samples versus normal samples.
	group<-c(0,0,0,0,1,1,1,1)
	#Load MultiRankSeq package
	library(MultiRankSeq)
	#Generate MultiRankSeq report
	result1<-MultiRankSeqReport(output="MultiRankSeqReport1.html", rawCounts=countsData, group=group)
	#Assume the experiment has 4 pairs of normal/disease samples.
	paired<-c(1:4,1:4)
	result2<-MultiRankSeqReport(output="MultiRankSeqReport2.html",rawCounts=countsData,group=group,paired=paired)

<a name="report"/>

# Report

The MultiRankSeq report contains four parts. The "Command" part records the command to generate the report. So that the user can reproduce the report easily. The "Overview" part displays the raw counts data and groups for samples. The "Distribution" part displays the hierarchical clustering results for samples, by all genes, genes with top 5% SD and genes with top 5% CV. And it also shows boxplot and correlations between samples. The "Difference" displays the results of differential analysis, including the integrated results from three methods, volcano plot and venn plot.

Here are two example reports based on the TCGA data, which were used in our paper.

[Report for figure 1 and figure 2](http://htmlpreview.github.io/?https://github.com/slzhao/MultiRankSeq/blob/master/example/reportFigure1.html)

	#The TCGA sample names for this report
	TCGA-A7-A0D9-NT
	TCGA-BH-A0B3-NT
	TCGA-BH-A0BJ-NT
	TCGA-A7-A0D9-TP
	TCGA-BH-A0B3-TP
	TCGA-BH-A0BJ-TP
 
[Report for figure 3](http://htmlpreview.github.io/?https://github.com/slzhao/MultiRankSeq/blob/master/example/reportFigure3.html)

	#The TCGA sample names for this report
	TCGA-BH-A0BM-NT
	TCGA-BH-A0C0-NT
	TCGA-BH-A0DK-NT
	TCGA-BH-A0BM-TP
	TCGA-BH-A0C0-TP
	TCGA-BH-A0DK-TP
	
<a name="reproduce"/>

# Reproduce the report

First you will need to download the count data. We generate the count data based on the TCGA samples listed before. You can use the following codes in Linux system to download the count data. Or you can download it in [github release page](https://github.com/slzhao/MultiRankSeq/releases/tag/exampleData).

	wget https://github.com/slzhao/MultiRankSeq/releases/download/exampleData/TcgaFigure1.csv
	wget https://github.com/slzhao/MultiRankSeq/releases/download/exampleData/TcgaFigure3.csv

Here are the R codes to generate the report.

	#Assume you have already installed MultiRankSeq package. You can use the following codes in R to generate the reports.
    library(MultiRankSeq)
    #Load the downloaded data into R, and generate group definition.
    TcgaFigure1<-read.csv("TcgaFigure1.csv",header=T,row.names=1,check.names=F)
    TcgaFigure3<-read.csv("TcgaFigure3.csv",header=T,row.names=1,check.names=F)
    group=c(0,0,0,1,1,1)
    #Generate report
    reportF1<-MultiRankSeqReport(output="reportFigure1.html",rawCounts=TcgaFigure1, group=group)
    reportF3<-MultiRankSeqReport(output="reportFigure3.html",rawCounts=TcgaFigure3, group=group)

Here is the environment (including the version of packages) of example reports.

    sessionInfo()

    R version 3.0.0 (2013-04-03)
    Platform: x86_64-unknown-linux-gnu (64-bit)

    locale:
     [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C
     [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8
     [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8
     [7] LC_PAPER=C                 LC_NAME=C
     [9] LC_ADDRESS=C               LC_TELEPHONE=C
    [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C

    attached base packages:
    [1] grid      parallel  stats     graphics  grDevices utils     datasets
    [8] methods   base

    other attached packages:
     [1] MultiRankSeq_1.1.2   knitr_1.5            VennDiagram_1.6.5
     [4] baySeq_1.16.0        GenomicRanges_1.14.4 XVector_0.2.0
     [7] IRanges_1.20.7       edgeR_3.4.2          limma_3.18.13
    [10] DESeq_1.14.0         lattice_0.20-15      locfit_1.5-9.1
    [13] Biobase_2.22.0       BiocGenerics_0.8.0

    loaded via a namespace (and not attached):
     [1] annotate_1.40.1      AnnotationDbi_1.24.0 DBI_0.2-7
     [4] evaluate_0.5.1       formatR_0.10         genefilter_1.44.0
     [7] geneplotter_1.40.0   RColorBrewer_1.0-5   RSQLite_0.11.3
    [10] splines_3.0.0        stats4_3.0.0         stringr_0.6.2
    [13] survival_2.37-4      tools_3.0.0          XML_3.98-1.1
    [16] xtable_1.7-1