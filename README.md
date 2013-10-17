MultiRankSeq
============
* [Introduction](#Introduction)
* [Download](#download)
* [Example](#example)

<a name="Introduction"/>
# Introduction #
RNAseq technology is rapidly replacing microarray technology as the tool of choice for gene expression profiling. While providing more quantitative information than microarray, the analysis of RNAseq has been particularly difficult compare to microarray analysis. To date, many RNAseq analysis packages have been developed, and many evaluation studies have been performed on these packages.  Not surprisingly, different evaluation study produced different opinion on which packages is the most ideal.  We found that often using different package will generate complete different results.  To solve this solve this dilemma, we propose a rank sum approach using multiple RNAseq analysis package (MultiRankSeq) to combine the results from multiple RNAseq package analysis. In addition to differential expression analysis, MultiRankSeq also performs quality control and give detailed graphical post analysis report.    

<a name="download"/>
# Download #
You can download the zip file of MultiRankSeq package from [windows version](https://github.com/slzhao/MultiRankSeq/releases/download/Release/MultiRankSeq_1.0.0.zip) or [linux and mac version](https://github.com/slzhao/MultiRankSeq/releases/download/Release/MultiRankSeq_1.0.0.tar.gz). And then you can use the "Install packages from local zip file" menu in R to install it.

Or you can directly download the source codes of MultiRankSeq package from [github](https://github.com/slzhao/MultiRankSeq) by the following commands (If git has already been installed in your computer). And then you need to built the source codes into a package.

	#The source codes of MultiRankSeq software will be downloaded to your current directory
	git clone https://github.com/slzhao/MultiRankSeq.git
	#Built the source codes into a package
	R CMD build MultiRankSeq

<a name="example"/>
# Example #
After you have installed MultiRankSeq package. You can use following R codes to see the examples for it.

	library(MultiRankSeq)
	##view help files
	?MultiRankSeqReport
	##a simple example
	example(MultiRankSeqReport)