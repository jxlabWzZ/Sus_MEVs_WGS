EDP<-read.table("/Users/tmp/Desktop/ven.edp",header=F)
CEC<-read.table("/Users/tmp/Desktop/ven.cec",header=F)
ADP<-read.table("/Users/tmp/Desktop/ven.adp",header=F)
AWP<-read.table("/Users/tmp/Desktop/ven.awp",header=F)

mydata<-list(EDP=EDP$V1,CEC=CEC$V1,ADP=ADP$V1,AWP=AWP$V1)

library(VennDiagram)
library(ggvenn)
library(ggplot2)
#ggvenn(mydata, c("BMX01", "BMX03","DRC01","DRC03"),show_percentage = FALSE)

p=ggvenn(mydata,c("EDP", "CEC","ADP","AWP"),
  show_elements=FALSE,
  show_percentage=FALSE,
  digits=1,
  fill_color=c("#ffb2b2","#b2e7cb","#F0E442", "#0072B2"),
  fill_alpha= 0.5,
  stroke_color="white",
  stroke_alpha =1,
  stroke_size = 1,
  stroke_linetype="solid",
  set_name_color=c("#ffb2b2","#b2e7cb","#F0E442", "#0072B2"),
  set_name_size=7,
  text_color="black",
  text_size=5)
#画图
p
##保存为pdf
pdf(file="/Users/tmp/Desktop/ven.plot.pdf",width=6,height=6)
print(p)
dev.off()
##保存为png、jpg
png(filename="/Users/tmp/Desktop/ven.plot.png",width=1700,height=1700,res=300)
print(p)
dev.off()


