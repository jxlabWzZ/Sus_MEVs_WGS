##
library(CMplot)
a<-read.table("/Users/tmp/Desktop/zfst2b.txt",header=T)
## 选择SNP和基因进行展示

#SNPs <- a[a[,5] > (3), 1]
#genes <- paste("GENE", 1:length(SNPs), sep="_")

## 绘图
set.seed(666666)
setwd("/Users/tmp/Desktop/")

CMplot(a[,c(1:3,4)], plot.type="m",LOG10=F,lab.cex = 3, axis.cex = 1.22,legend.cex = 3, threshold=0.418,threshold.lty=1, 
       threshold.lwd=c(1,1),amplify=TRUE,
       chr.den.col=NULL, signal.cex=1, ylim=c(0,2),
       file="pdf",file.name="",dpi=300,file.output=TRUE,verbose=TRUE,
       points.alpha=225,legend.ncol=3, legend.pos="right",height=6,width=20)

