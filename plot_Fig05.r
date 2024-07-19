
library(ggplot2)
a<-read.table("/Users/tmp/Desktop/p0d.txt",header=F)
ggplot(a,aes(x = V1/1000000, 
             y = -log(V3,10), # 按照富集度大小排序
             size = 0.5,
             colour=V2)) +
  geom_point(shape = 16,cex=1) +                    # 设置点的形状
  labs(x = "Position (Mb)", y = "-log10(Pvalue)")+           # 设置x，y轴的名称
  scale_colour_continuous(                    # 设置颜色图例
    name="LD score",                        # 图例名称
    low="blue",                              # 设置颜色范围
    high="red")+
  scale_radius(                               # 设置点大小图例
    range=c(2,4),                             # 设置点大小的范围
    name="Size")+                             # 图例名称
  guides(   
    color = guide_colorbar(order = 1),        # 决定图例的位置顺序
    size = guide_legend(order = 2)
  )+ylim(0,18)+
  theme_bw()   


library(ggplot2)
library(beeswarm)
b<-read.table("/Users/tmp/Desktop/p1d.txt",header=F)
beeswarm(V2 ~ factor(V1,levels=c("0_0","0_1","1_1")), data = b,
         method = 'swarm',
         pch = 16,cex=0.6,col="darkgreen",
         xlab = '', ylab = 'gene expression',
         labels = c('0/0','0/1',"1/1"))

boxplot(V2 ~ V1, data = b, add = T, names = c("","",""), col="#0000ff22",cex=0.1)
