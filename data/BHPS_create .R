#Creating data frame BHPS for data-analysis 

if (!require("pacman")) install.packages("pacman")
pacman::p_load(haven, ggplot2,knitr, pander,descr,foreign,dplyr,Hmisc,psych,GPArotation,plyr, dplyr, rmarkdown)
library(tidyverse)
jindresp <- read_sav("/Applications/IODS-project/data/jindresp.sav")
jhhresp <- read_sav("/Applications/IODS-project/data/jhhresp.sav")

BHPS2000 <- merge(jindresp, jhhresp, by="JHID")

# Keeping only the variables that are needed

keep_columns <- c("JHLLT","JLKMOVE","JHSPRBQ", "JGHQD","JGHQF", "JGHQH", "JHSCANB", "JHSCNTB", "JHSCAND", "JHSCNTD","JHSCANF", "JGHQC", "JVOTE7", "JLFSATO")

BHPS <- dplyr::select(BHPS2000, one_of(keep_columns))
dim(BHPS)
describe(BHPS)



# removing the "Value = -9	Label = Missing or wild; Value = -8	Label = Inapplicable; Value = -7	Label = Proxy and or phone; Value = -2	Label = Refused; Value = -1	Label = Don't know" 

BHPS$JHLLT[BHPS$JHLLT< 0]<-NA
BHPS$JLKMOVE[BHPS$JLKMOVE< 0]<-NA
BHPS$JHSPRBQ[BHPS$JHSPRBQ< 0]<-NA
BHPS$JGHQD[BHPS$JGHQD< 0]<-NA
BHPS$JGHQF[BHPS$JGHQF< 0]<-NA
BHPS$JGHQH[BHPS$JGHQH< 0]<-NA
BHPS$JHSCANB[BHPS$JHSCANB< 0]<-NA
BHPS$JHSCNTB[BHPS$JHSCNTB< 0]<-NA
BHPS$JHSCAND[BHPS$JHSCAND< 0]<-NA
BHPS$JHSCNTD[BHPS$JHSCNTD< 0]<-NA
BHPS$JHSCANF[BHPS$JHSCANF< 0]<-NA
BHPS$JGHQC[BHPS$JGHQC< 0]<-NA
BHPS$JVOTE7[BHPS$JVOTE7< 0]<-NA
BHPS$JLFSATO[BHPS$JLFSATO< 0]<-NA
BHPS$JHLLT[BHPS$JHLLT< 0]<-NA
BHPS$JLKMOVE[BHPS$JLKMOVE< 0]<-NA
BHPS$JHSCAND[BHPS$JHSCAND< 0]<-NA

#Removing NAs
complete.cases(BHPS)
BHPS <- filter(BHPS, complete.cases(BHPS))
dim(BHPS)
describe(BHPS)



write.csv(BHPS, file = "/Applications/IODS-project/data/BHPS.csv")
BHPS <- read.csv(file = "/Applications/IODS-project/data/BHPS.csv", sep=",", header =TRUE)
BHPS
dim(BHPS)


