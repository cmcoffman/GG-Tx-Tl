#import data
#read in just the nesisary rows from the original files
fpath = file.path(getwd(), "raw_data", "golden_gate_TxTl.csv");
gg.txtl <- read.csv(fpath, nrows=37, skip=111, header=FALSE)

#organizes data
gg=gg.txtl
gg.txtl.blank=data.frame(Time=gg[,2], Temp=gg[,3], GFP=gg[,4], Sample=c("Blank"))

gg.txtl.rep1=data.frame(Time=gg[,2], Temp=gg[,3], GFP=gg[,5], Sample=c("GG Rep 1"))

gg.txtl.rep2=data.frame(Time=gg[,2], Temp=gg[,3], GFP=gg[,6], Sample=c("GG Rep 2"))

#merge data
gg.txtl=rbind(gg.txtl.blank, gg.txtl.rep1, gg.txtl.rep2)

#load plotting library
require(ggplot2)
#make ggplot2 draw tings bigger
#theme_set(theme_gray(base_size = 24))
theme(axis.text.x = element_text(angle = 45, hjust = 1))
#draw plot
gg.txtl.plot=ggplot(gg.txtl,aes(x=Time,y=GFP,colour=Sample,group=Sample)) + 
  geom_line() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Direct Tx-Tl of Golden-Gate Product")

