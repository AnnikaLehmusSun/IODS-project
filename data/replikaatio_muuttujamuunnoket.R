#Replikoidaan Anand et al. muuttujamuunnokset
#Creating data frame BHPS for data-analysis 

if (!require("pacman")) install.packages("pacman")
pacman::p_load(haven, ggplot2,knitr, pander,descr,foreign,dplyr,Hmisc,psych,GPArotation,plyr, dplyr, rmarkdown)
library(tidyverse)
jindresp <- read_sav("/Users/annikalehmus-sun/Documents/jindresp.sav")
jhhresp <- read_sav("/Users/annikalehmus-sun/Documents/jhhresp.sav")

BHPS2000 <- merge(jindresp, jhhresp, by="JHID")

# Keeping only the variables that are needed

keep_columns <- c("JHLLT","JHSCANE","JHSCNTE","JLKMOVE", "JCARUSE", "JHSPRBQ","JQFEDHI","JGHQA","JGHQB", "JGHQE", "JGHQI", "JGHQJ", "JGHQD","JGHQF", "JGHQH", "JHSCANB", "JHSCNTB", "JHSCAND", "JHSCNTD","JHSCANF","JHSCNTF","JGHQK", "JGHQC", "JGHQL", "JGHQG", "JVOTE7", "JHLENDW", "JHLLTWA", "JLFSATO", "JLFSAT1", "JLFSAT2", "JLFSAT3", "JLFSAT4", "JLFSAT5", "JLFSAT6", "JLFSAT7", "JLFSAT8")

BHPS <- dplyr::select(BHPS2000, one_of(keep_columns))
dim(BHPS)
describe(BHPS)



# removing the "Value = -9	Label = Missing or wild; Value = -8	Label = Inapplicable; Value = -7	Label = Proxy and or phone; Value = -2	Label = Refused; Value = -1	Label = Don't know" 
```{r}
BHPS$JHLLT[BHPS$JHLLT< 0]<-NA
BHPS$JHSCANE[BHPS$JHSCANE< 0]<-NA
BHPS$JHSCNTE[BHPS$JHSCNTE< 0]<-NA
BHPS$JLKMOVE[BHPS$JLKMOVE< 0]<-NA
BHPS$JCARUSE[BHPS$JCARUSE< 0]<-NA
BHPS$JHSPRBQ[BHPS$JHSPRBQ< 0]<-NA
BHPS$JQFEDHI[BHPS$JQFEDHI< 0]<-NA
BHPS$JGHQA[BHPS$JGHQA< 0]<-NA
BHPS$JGHQB[BHPS$JGHQB< 0]<-NA
BHPS$JGHQE[BHPS$JGHQE< 0]<-NA
BHPS$JGHQI[BHPS$JGHQI< 0]<-NA
BHPS$JGHQJ[BHPS$JGHQJ< 0]<-NA
BHPS$JGHQD[BHPS$JGHQD< 0]<-NA
BHPS$JGHQF[BHPS$JGHQF< 0]<-NA
BHPS$JGHQH[BHPS$JGHQH< 0]<-NA
BHPS$JHSCANB[BHPS$JHSCANB< 0]<-NA
BHPS$JHSCNTB[BHPS$JHSCNTB< 0]<-NA
BHPS$JHSCAND[BHPS$JHSCAND< 0]<-NA
BHPS$JHSCNTD[BHPS$JHSCNTD< 0]<-NA
BHPS$JHSCANF[BHPS$JHSCANF< 0]<-NA
BHPS$JHSCNTF[BHPS$JHSCNTF< 0]<-NA
BHPS$JGHQK[BHPS$JGHQK< 0]<-NA
BHPS$JGHQC[BHPS$JGHQC< 0]<-NA
BHPS$JGHQL[BHPS$JGHQL< 0]<-NA
BHPS$JGHQG[BHPS$JGHQG< 0]<-NA
BHPS$JVOTE7[BHPS$JVOTE7< 0]<-NA
BHPS$JHLENDW[BHPS$JHLENDW< 0]<-NA
BHPS$JHLLTWA[BHPS$JHLLTWA< 0]<-NA
BHPS$JLFSATO[BHPS$JLFSATO< 0]<-NA
BHPS$JLFSAT1[BHPS$JLFSAT1< 0]<-NA
BHPS$JLFSAT2[BHPS$JLFSAT2< 0]<-NA
BHPS$JLFSAT3[BHPS$JLFSAT3< 0]<-NA
BHPS$JLFSAT4[BHPS$JLFSAT4< 0]<-NA
BHPS$JLFSAT5[BHPS$JLFSAT5< 0]<-NA
BHPS$JLFSAT6[BHPS$JLFSAT6< 0]<-NA
BHPS$JLFSAT7[BHPS$JLFSAT7< 0]<-NA
BHPS$JLFSAT8[BHPS$JLFSAT8< 0]<-NA
BHPS$JHLLT[BHPS$JHLLT< 0]<-NA
BHPS$JHSCANE[BHPS$JHSCANE< 0]<-NA
BHPS$JHSCNTE[BHPS$JHSCNTE< 0]<-NA
BHPS$JLKMOVE[BHPS$JLKMOVE< 0]<-NA
BHPS$JHSCAND[BHPS$JHSCAND< 0]<-NA


summary(BHPS)
```
#Removing NAs
```{r}
complete.cases(BHPS)
data.frame(BHPS[-1], comp = complete.cases(BHPS))
BHPS1 <- filter(BHPS, TRUE, complete.cases(BHPS))
BHPS1
```

```{r}
write.csv(BHPS1, file = "/Applications/IODS-project/data/BHPS1.csv")
BHPS <- read.csv(file = "/Applications/IODS-project/data/BHPS1.csv", sep=",", header =TRUE)
BHPS
```


