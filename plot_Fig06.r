# fig 6a
df<-read.table("/Users/tmp/Desktop/bb.txt",header=F)
df$new_col02<-factor(df$V2,levels = c("T1S","E1S","E1SL1","E1SSI","E1STR","T50S","E50S","E50SL1","E50SSI","E50STR"))

ggplot(data=df,aes(x=V1,y=new_col02))+
  geom_density_ridges(aes(fill=new_col02,color=new_col02),
                      alpha=0.4,
                      bandwidth=0.04,
                      quantile_lines=TRUE, 
                      quantile_fun=function(x,...)mean(x),
                      #linetype="dashed",
                      scale=1.4,
                      vline_linetype="dashed")+
  scale_fill_manual(values = c("graph"="#ca612d",
                               "linear"="#2772a7"))+
  scale_color_manual(values = c("graph"="#ca612d",
                                "linear"="#2772a7"))+
  theme_classic() +
  guides(fill="none",color="none") -> p1
p1

#fig6b
a<-read.table("/Users/tmp/Desktop/pp.txt",header=F)
ggplot(a,aes(factor(V1,levels=c("All","EUP","ADP","AWP","MIX")),V2))+
  geom_violin(aes(fill=V1),cex=0.5,width=1.5)+  #根据Ancestry的不同因子使用不同颜色，其实用R默认颜色也不错，这里只是展示一下如何提取喜欢的图片颜色。
  scale_fill_manual(values = c('#FB5554','#868B31','#42F203','#579ABB','#B978AE'))+
  geom_boxplot(width=0.1,cex=0.5)+
  theme_classic(base_size = 16)+
  theme(axis.text = element_text(color = 'black'),
        legend.position = 'none')+ylim(0.9,1)

#fig6d
##
library(CMplot)
a<-read.table("/Users/tmp/Desktop/gwas.txt",header=T)
## 选择SNP和基因进行展示

SNPs <- a[a[,5] < (0.05 / nrow(a)), 1]
genes <- paste("GENE", 1:length(SNPs), sep="_")

## 绘图
set.seed(666666)
CMplot(a[,c(1:3,5)], plot.type="m",LOG10=TRUE,col=c("grey30","grey60"),highlight=SNPs,
       highlight.col=rep(c("green","blue"),length=length(SNPs)),highlight.cex=1, highlight.text=genes,      
       highlight.text.col=rep("red",length(SNPs)),threshold=0.05/nrow(pig60K),threshold.lty=2,   
       amplify=FALSE,file="jpg",file.name="",dpi=300,file.output=F,verbose=TRUE,width=14,height=6)


SNPs <- list(
  a$SNP[a$LMP< 1e-5],
  a$SNP[a$LMD< 1e-5],
  a$SNP[a$TTN< 1e-5],
  a$SNP[a$RTN< 1e-5],
  a$SNP[a$TPD< 1e-5],
  a$SNP[a$LTN< 1e-5],
  a$SNP[a$BF< 1e-5])
setwd("/Users/tmp/Desktop/")
CMplot(a, plot.type="m",col="grey",multraits=TRUE,lab.cex = 3.5, axis.cex = 2.5,legend.cex = 3, threshold=0.05/nrow(a),threshold.lty=1, 
       threshold.lwd=c(1,1), threshold.col=c("black","grey"),amplify=TRUE,
       chr.den.col=NULL, signal.col=c("red","yellow","orange","green","blue","purple","black"),signal.cex=2, 
       file="png",file.name="",dpi=300,file.output=TRUE,verbose=TRUE,
       points.alpha=225,legend.ncol=3, legend.pos="right",height=6,width=18)



