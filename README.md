MultiRankSeq
============
* [Introduction](#Introduction)
* [Download and install](#download)
* [Example](#example)
* [Usage](#usage)

<a name="Introduction"/>
# Introduction #
RNAseq technology is rapidly replacing microarray technology as the tool of choice for gene expression profiling. While providing more quantitative information than microarray, the analysis of RNAseq has been particularly difficult compare to microarray analysis. To date, many RNAseq analysis packages have been developed, and many evaluation studies have been performed on these packages.  Not surprisingly, different evaluation study produced different opinion on which packages is the most ideal.  We found that often using different package will generate complete different results.  To solve this solve this dilemma, we propose a rank sum approach using multiple RNAseq analysis package (MultiRankSeq) to combine the results from multiple RNAseq package analysis. In addition to differential expression analysis, MultiRankSeq also performs quality control and give detailed graphical post analysis report.    

<a name="download"/>
# Download and install #
You can download the zip file of MultiRankSeq package from [windows version](https://github.com/slzhao/MultiRankSeq/releases/download/Release/MultiRankSeq_1.0.0.zip) or [linux and mac version](https://github.com/slzhao/MultiRankSeq/releases/download/Release/MultiRankSeq_1.0.0.tar.gz).

Or you can directly download the source codes of MultiRankSeq package from [github](https://github.com/slzhao/MultiRankSeq) by the following commands (If git has already been installed in your computer). And then you need to built the source codes into a package.

	#The source codes of MultiRankSeq software will be downloaded to your current directory
	git clone https://github.com/slzhao/MultiRankSeq.git
	#Built the source codes into a package
	R CMD build MultiRankSeq
	#The file of MultiRankSeq package will be generated in current folder

MultiRankSeq package requires some other R packages, including RColorBrewer, VennDiagram, knitr, DESeq, edgeR and baySeq. You can enter R and use following R codes to install them. 

	#Install CRAN packages
	install.packages("RColorBrewer")
	install.packages("VennDiagram")
	install.packages("knitr")
	#Install Bioconductor packages
	source("http://bioconductor.org/biocLite.R")
	biocLite("DESeq")
	biocLite("edgeR")
	biocLite("baySeq")

In Windows system, you can use the "Install packages from local zip file" menu in R to install MultiRankSeq. In Linux system, you can enter R and use following R codes to install MultiRankSeq.
	
	#Install MultiRankSeq in linux system, assume MultiRankSeq_1.1.1.tar.gz file was in current directory
	install.packages("MultiRankSeq_1.1.1.tar.gz")

<a name="example"/>
# Example #
After you have installed MultiRankSeq package. You can enter R and use following R codes to see the examples for it.
	
	#Load MultiRankSeq package
	library(MultiRankSeq)
	#View help files
	?MultiRankSeqReport
	#A simple example
	example(MultiRankSeqReport)

<a name="usage"/>
# Usage #

In MultiRankSeq package, MultiRankSeqReport is the primary function to generate MultiRankSeq report based on counts data.

	#Assume the counts data was loaded into R as a matrix or data frame. Its name was countsData
	str(countsData)
	#Assume the experiment has 4 normal samples and 4 disease samples. We used 0 to represent normal samples and 1 to represent disease samples. MultiRankSeq will compare disease samples versus normal samples.
	group=c(0,0,0,0,1,1,1,1)
	#Load MultiRankSeq package
	library(MultiRankSeq)
	#Generate MultiRankSeq report
	MultiRankSeqReport(output="MultiRankSeqReport.html", rawCounts=countsData, group=group)