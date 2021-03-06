% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MultiRankSeqFunctions.R
\name{diffReport}
\alias{diffReport}
\title{diffReport}
\usage{
diffReport(input = system.file("extdata", "report.Rhtml", package =
  "MultiRankSeq"), output, diffResult, rawCounts, group = c(0, 0, 0, 1, 1, 1),
  paired = NULL, exportCounts = F, useVStCount = T, useAllInHeatmap = F,
  percent = 0.05)
}
\arguments{
\item{input}{The templet file. You don't need to specify it in most cases. A file in MultiRankSeq package will be used.}

\item{output}{the path and name for report file.}

\item{diffResult}{The result generated by \code{\link{findDiff}} function.}

\item{rawCounts}{the count data used in analysis, which should be a matrix or a data.frame.}

\item{group}{the group of count data, which should be 0 or 1. The samples labeled as 1 will be compared with samples labeled as 0.}

\item{paired}{the pairs of count data. Will be NULL if no pair. For example, if sample 1 and 2 are one pair, sample 3 and 4 are another pair, the paired should be c(1,1,2,2).}

\item{exportCounts}{Logical. Indicate if the raw counts will be exported in result table.}

\item{useVStCount}{Logical. The DESeq2 package can apply a variance stabilizing transformation (VST) to count data, which can be used in checking outliers or clustering. This parameter indicates if the transformed counts will be used in heatmap, boxplot, and correlation in reports.}

\item{useAllInHeatmap}{Logical.}

\item{percent}{The percent of genes with highest SD, to be used in heatmap.}
}
\description{
The function will generate a report based on the result of DESeq, edgeR, and baySeq analysis.
}
\examples{
data(exampleCounts)
data(exampleCountsDiff)
diffReport(output="MultiRankSeq.html",diffResult=exampleCountsDiff,rawCounts=exampleCounts)
}

