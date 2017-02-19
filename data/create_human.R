# PART 1
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

str(hd)
dim(hd)
summary(hd)

hd$HDIrank <- hd$HDI.Rank
hd$HDI.Rank <- NULL
hd$HDI <- hd$Human.Development.Index..HDI.
hd$Human.Development.Index..HDI. <- NULL
hd$lifeExp <- hd$Life.Expectancy.at.Birth 
hd$Life.Expectancy.at.Birth <- NULL
hd$educationExp <- hd$Expected.Years.of.Education 
hd$Expected.Years.of.Education <- NULL
hd$educationMean <- hd$Mean.Years.of.Education  
hd$Mean.Years.of.Education <- NULL
hd$GNI <- hd$Gross.National.Income..GNI..per.Capita 
hd$Gross.National.Income..GNI..per.Capita <- NULL
hd$GNIandHDI <- hd$GNI.per.Capita.Rank.Minus.HDI.Rank  
hd$GNI.per.Capita.Rank.Minus.HDI.Rank <- NULL
str(hd)
dim(hd)

str(gii)
dim(gii)
summary(gii)
gii$Giirank <- gii$GII.Rank 
gii$GII.Rank <- NULL
gii$GII  <- gii$Gender.Inequality.Index..GII.
gii$Gender.Inequality.Index..GII. <- NULL
gii$mortality <- gii$Maternal.Mortality.Ratio 
gii$Maternal.Mortality.Ratio <- NULL
gii$birthRate <- gii$Adolescent.Birth.Rate 
gii$Adolescent.Birth.Rate <- NULL
gii$repr.parliament <- gii$Percent.Representation.in.Parliament
gii$Percent.Representation.in.Parliament <- NULL
gii$labourM <- gii$Labour.Force.Participation.Rate..Male.
gii$Labour.Force.Participation.Rate..Male. <- NULL
gii$labourF <- gii$Labour.Force.Participation.Rate..Female.
gii$Labour.Force.Participation.Rate..Female. <- NULL
gii$eduM <- gii$Population.with.Secondary.Education..Male.
gii$Population.with.Secondary.Education..Male. <- NULL
gii$eduF <- gii$Population.with.Secondary.Education..Female. 
gii$Population.with.Secondary.Education..Female. <- NULL
str(gii)
dim(gii)

# Education ratio - new variable:
gii$eduRatio <- with (gii, eduF / eduM)
summary(gii$eduRatio)

# Labour ratio - new variable:
gii$labourRatio <- with (gii, labourF/labourM)
summary(gii$labourRatio)  

library(dplyr)

join_by <- c("Country")
join_by

# join the two datasets by the selected identifiers
hd_gii <- inner_join(hd, gii, by = join_by)

colnames(hd_gii)

glimpse(hd_gii)

str(hd_gii)

# PART 2
library(stringr)

str(hd_gii$GNI)
str(hd_gii$Country)

# converting GNI variable to numeric
str_replace(hd_gii$GNI, pattern=",", replace ="") %>% as.numeric
variable.names(hd_gii)

#Keeping only the following variables
keep <- c("Country", "lifeExp", "GNI", "educationExp", "birthRate", "mortality","repr.parliament", "eduRatio", "labourRatio")
hd_gii <- select(hd_gii, one_of(keep))

#Removing NAs 
complete.cases(hd_gii)
data.frame(hd_gii[-1], comp = complete.cases(hd_gii))
human <- filter(hd_gii, TRUE, complete.cases(hd_gii))

#Removing all the regional observations (instead of countries)
tail(human, n=10)
last <- nrow(human) - 7
human <- human[1:last,]

#Changing the row names of the data by the country 
rownames(human) <- human$Country
human$Country
str(human)



write.csv(human1, file = "/Applications/IODS-project/data/human1.csv")
human2 <- read.csv(file = "/Applications/IODS-project/data/human1.csv", sep =",", header =TRUE)
human2

