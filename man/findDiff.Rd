\name{findDiff}
\alias{findDiff}
\title{findDiff}
\usage{
findDiff(rawCounts, group = c(rep(0, ncol(rawCounts)/2), rep(1,
  ncol(rawCounts)/2)), seed = NULL, paired = NULL)
}
\arguments{
  \item{rawCounts}{the count data used in analysis, which
  should be a matrix or a data.frame.}

  \item{group}{the group of count data, which should be 0
  or 1. The samples labeled as 1 will be compared with
  samples labeled as 0.}

  \item{seed}{the random seed for bayseq. The user can set
  it so that the bayseq result can be reproduced.}

  \item{paired}{the pairs of count data. Will be NULL if no
  pair. For example, if sample 1 and 2 are one pair, sample
  3 and 4 are another pair, the paired should be
  c(1,1,2,2).}
}
\value{
A matrix with log2 fold change, p value, adjusted p value,
and rank of DESeq, edgeR, and baySeq analysis.
}
\description{
The function will perform DESeq, edgeR, and baySeq
analysis.
}
\examples{
set.seed(123456789) #generate data
ngenes <- 500 #1000
q0 <- rexp(ngenes, rate = 1/250)
is_DE <- runif(ngenes) < 0.3
lfc <- rnorm(ngenes, sd = 2)
q0A <- ifelse(is_DE, q0 * 2^(lfc/2), q0)
q0B <- ifelse(is_DE, q0 * 2^(-lfc/2), q0)
true_sf <- c(1, 1.3, 0.7, 0.9, 1.6,1.5)
conds <- c("A", "A", "A","B", "B", "B")
exampleCounts <- t(sapply(seq_len(ngenes), function(i) sapply(1:6, function(j) rnbinom(1,mu = true_sf[j] * ifelse(conds[j] == "A", q0A[i], q0B[i]),	size = 1/0.2))))
colnames(exampleCounts)<-c(paste("Control",1:3,sep=""),paste("Disease",1:3,sep=""))
row.names(exampleCounts)<-paste("Gene",1:ngenes,sep="")
#this code may take two minutes, because performing baySeq, DESeq2, and edgeR may be slow.
exampleCountsDiff<-findDiff(exampleCounts) #find diff result
}

