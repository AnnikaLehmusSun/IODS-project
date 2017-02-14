hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
               
str(hd)
dim(hd)
summary(hd)
hd$HDI.Rank <- hd$RankHDI
hd$Human.Development.Index..HDI. <- hd$HDI
hd$Life.Expectancy.at.Birth <- hd$LifeExp
hd$Expected.Years.of.Education <- hd$educationExp
hd$Mean.Years.of.Education <- hd$educationMean
hd$Gross.National.Income..GNI..per.Capita <- hd$GNI
hd$GNI.per.Capita.Rank.Minus.HDI.Rank <- hd$GNIandHDI

str(gii)
dim(gii)
summary(gii)

#Mutate the “Gender inequality” data and create two new variables. 
#The first one should be the ratio of Female and Male populations with secondary education in each country. 
#(i.e. edu2F / edu2M). The second new variable should be the ratio of labour force participation of 
#females and males in each country (i.e. labF / labM). (1 point)
#Join together the two datasets using the variable Country as the identifier. Keep only the 
#countries in both data sets (Hint: inner join). Call the new joined data human and save it in your data folder. (1 point)

