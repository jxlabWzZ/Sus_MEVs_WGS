####
library(ggplot2)
a<-read.table("/Users/tmp/Desktop/pp1.txt",header=F)

ggplot(a,aes(fill=factor(V1,levels=c("ALL","SINE/tRNA","LINE/L1","LTR/ERV")),y=V3,x=factor(V2,levels=c("eQTL","FMeQTL","sQTL","FMsQTL"))))+
  geom_bar(stat = 'identity', 
           #柱状图位置并排:
           position = 'dodge', #使用position=position_dodge(width=0.9),可使组内柱子间隔,自行试一下。
           width = 0.8,      #设置柱子宽度,使变量之间分开
           color='black')+        
  #geom_text(aes(label=Value),size=4,
  #          position = position_dodge(width = 0.8), #相应的注释宽度也调整
   #         vjust=-0.3)+    #调节注释高度    
  labs(x=NULL)+ 
  #scale_y_continuous(
  #  trans = 'log10', 
  #  breaks = c(1,10, 100,1000,10000),
  #  labels = function(x) ifelse(x == floor(x), as.integer(x), x)
  #) +
  theme_bw(base_size = 18)+  
  theme(axis.text = element_text(colour = 'black'))


###p4b.pdf
b<-read.table("/Users/tmp/Desktop/pp2.txt",header=F)
d<-read.table("/Users/tmp/Desktop/pp3.txt",header=F)
hist(b$V1,breaks=100,col="darkgreen",border="green")
hist(d$V1,breaks=100,col="darkblue",border="blue")

####
####
#install.packages("ggpointdensity")
library(ggpointdensity)
library(viridis)
library(ggplot2)
library(cowplot)  #用于图例截取，以及多图组合
mydata<-read.table("/Users/tmp/Desktop/pp4.txt",header=F)
#密度散点图
p1 <- ggplot(mydata, aes(V3, V2)) +
  theme(panel.grid.major = element_blank(), panel.background = element_rect(color = 'gray30', fill = 'transparent')) +
  geom_pointdensity(cex=0.5) +
  scale_color_viridis() +xlim(0,1)+ylim(0,1)
   #scale_color_gradientn(colors = c('#555AA6', '#74C5A2', '#FCF8B5', '#F57948', '#AA1246'))

#获取上述图例
p1_legend <- get_legend(p1)

#X 轴数据的频数分布直方图
p2 <- ggplot(mydata, aes(V3)) +
  theme(panel.grid.major = element_blank(), panel.background = element_rect(color = 'gray30', fill = 'transparent')) +
  geom_histogram(binwidth = (max(mydata$V2) - min(mydata$V2))/50,col="grey30",fill="grey") +
  labs(x = '')

#Y 轴数据的密度曲线图
p3 <- ggplot(mydata, aes(V2)) +
  theme(panel.grid.major = element_blank(), panel.background = element_rect(color = 'gray30', fill = 'transparent')) +
  #geom_line(stat = 'density') +
  geom_histogram(binwidth = (max(mydata$V3) - min(mydata$V3))/50,col="grey30",fill="grey") +
  coord_flip() +
  labs(x = '')

#组合
ggdraw(plot_grid( plot_grid(p2, p1+theme(legend.position = 'none'), ncol = 1, rel_heights = c(1, 2)),
  plot_grid(p1_legend, p3, ncol = 1, rel_heights = c(1, 2)), rel_widths = c(2, 1)))
  
  

  