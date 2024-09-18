library(ggplot2)
a<-read.table("/Users/tmp/Desktop/gg.txt",header=T)
barp <-  ggplot( a, aes( x = id, weight = value, fill = factor(type)))+
  geom_bar( position = "stack", width=0.75)+
  scale_y_continuous(expand = c(0,0))+ # 调整y轴属性，使柱子与X轴坐标接触
  facet_wrap(~group, scales = 'free_x', nrow = 3)+
  labs(x = 'Sample type', y = 'Relative Abundance(%)')+theme_minimal()+
  theme(legend.position = "none")
barp