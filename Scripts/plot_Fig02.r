####
library(ggplot2)
a<-read.table("/Users/tmp/Desktop/maf.txt",header=F)
ggplot(a,aes(x=V1,y=V3,fill=V2))+
  geom_bar(stat = 'identity', 
           #柱状图位置并排:
           position = 'dodge', #使用position=position_dodge(width=0.9),可使组内柱子间隔,自行试一下。
           width = 0.8,      #设置柱子宽度,使变量之间分开
           color='black')+        
  #geom_text(aes(label=Value),size=4,
  #          position = position_dodge(width = 0.8), #相应的注释宽度也调整
   #         vjust=-0.3)+    #调节注释高度    
  labs(x=NULL)+ 
  theme_bw(base_size = 18)+  
  theme(axis.text = element_text(colour = 'black'))


####
####
library(ggplot2)
a<-read.table("/Users/tmp/Desktop/te_gene.txt",header=F)
#ggplot(a,aes(x=factor(V2,levels=c("MEV","LL","HH","tRNA","L1","ERV")),y=V3,fill=factor(V1,levels=c("up5kb","utr5","cds","utr3","down5kb","ncgene","int"))))+
ggplot(a,aes(x=factor(V1,levels=c("up5kb","utr5","cds","utr3","down5kb","ncgene","int")),y=V4,fill=factor(V2,levels=c("GG","MEV","LL","HH","tRNA","L1","ERV"))))+
  geom_bar(stat = 'identity', 
           #柱状图位置并排:
           position = 'dodge', #使用position=position_dodge(width=0.9),可使组内柱子间隔,自行试一下。
           width = 0.8,      #设置柱子宽度,使变量之间分开
           color='black')+        
  #geom_text(aes(label=Value),size=4,
  #          position = position_dodge(width = 0.8), #相应的注释宽度也调整
  #         vjust=-0.3)+    #调节注释高度    
  labs(x=NULL)+ 
  theme_bw(base_size = 18)+  
  theme(axis.text = element_text(colour = 'black'))


####
####
library(ggplot2)
a<-read.table("/Users/tmp/Desktop/pp3.txt",header=F)
#ggplot(a,aes(x=factor(V2,levels=c("MEV","LL","HH","tRNA","L1","ERV")),y=V3,fill=factor(V1,levels=c("up5kb","utr5","cds","utr3","down5kb","ncgene","int"))))+
ggplot(a,aes(x=factor(V1,levels=c("E1","E2","E3","E4","E5","E6","E7","E8","E9","E10","E11","E12","E13","E14","E15")),y=V3,fill=factor(V2,levels=c("MEV","LL","HH","tRNA","L1","ERV"))))+
#ggplot(a,aes(x=V1,y=V3,fill=factor(V2,levels=c("MEV","LL","HH","tRNA","L1","ERV"))))+
  geom_bar(stat = 'identity', 
           #柱状图位置并排:
           position = 'dodge', #使用position=position_dodge(width=0.9),可使组内柱子间隔,自行试一下。
           width = 0.8,      #设置柱子宽度,使变量之间分开
           color='black')+        
  #geom_text(aes(label=Value),size=4,
  #          position = position_dodge(width = 0.8), #相应的注释宽度也调整
  #         vjust=-0.3)+    #调节注释高度    
  labs(x=NULL)+ 
  theme_bw(base_size = 18)+  
  theme(axis.text = element_text(colour = 'black'))