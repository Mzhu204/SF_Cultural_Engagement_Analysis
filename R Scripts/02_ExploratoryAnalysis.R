rm(list = ls()) 

library(ggplot2)
library(GGally)
library(tidyr)
library(dplyr)

SF_Data<- read.csv("San_Francisco_Citywide_Performance_Metrics.csv")

head(SF_Data)
class(SF_Data)
dim(SF_Data)
names(SF_Data)
str(SF_Data)
summary(SF_Data)

#--------------------------------------------------------------------------
SF_Data<- read.csv("PublicLibrary.csv")

PublicLibrarySR <- PublicLibrary %>% drop_na()
# did a department hit their target y/n
# count number of ones and divide by year = success rate
count <- 0
i<- 1
for (i in i:nrow(PublicLibrarySR)) {
if (PublicLibrarySR$Full.Year.Result[[i]] > PublicLibrarySR$Target[[i]]) {
  count<- count+1
  i<-i+1
}
}
count
PublicLibrary_SuccessRate<- count/nrow(PublicLibrary)
PublicLibrary_SuccessRate  ###0.67
#

mean(PublicLibrary$Full.Year.Result, na.rm = TRUE)
##total mean = 4,071,786


#------------------------------------------------------------------------------------
read.csv("DeYoung.csv")


DeYoungSR<- DeYoung %>% drop_na()
count2 <- 0
i<- 1
for (i in i:nrow(DeYoungSR)) {
  if (DeYoungSR$Full.Year.Result[[i]] > DeYoungSR$Target[[i]]) {
    count2<- count2+1
    i<-i+1
  }
}
count2
DeYoung_SuccessRate<- count/nrow(DeYoung)
DeYoung_SuccessRate  #### 0.444

mean(DeYoung$Full.Year.Result, na.rm = TRUE)
##total mean = 921,100.8

#---------------------------------------------------------------------------------

read.csv("LegionOfHonor.csv")

LegionOfHonorSR<- LegionOfHonor %>% drop_na()
count3 <- 0
i<- 1
for (i in i:nrow(LegionOfHonorSR)) {
  if (LegionOfHonorSR$Full.Year.Result[[i]] > LegionOfHonorSR$Target[[i]]) {
    count3<- count3+1
    i<-i+1
  }
}
count3
LegionOfHonor_SuccessRate<- count/nrow(LegionOfHonor)
LegionOfHonor_SuccessRate  #### 0.444


mean(LegionOfHonor$Full.Year.Result, na.rm = TRUE)
##total mean = 363,902.9

#--------------------------------------------------------------------

read.csv("AsianArtMuseum.csv")

AsianArtMuseumSR<-AsianArtMuseum %>% drop_na()
count4 <- 0
i<- 1
for (i in i:nrow(AsianArtMuseumSR)) {
  if (AsianArtMuseumSR$Full.Year.Result[[i]] > AsianArtMuseumSR$Target[[i]]) {
    count4<- count4+1
    i<-i+1
  }
}
count4
AsianArtMuseum_SuccessRate<- count/nrow(AsianArtMuseum)
AsianArtMuseum_SuccessRate  #### 0.4

mean(AsianArtMuseum$Full.Year.Result, na.rm = TRUE)
##total mean = 194,924.3


#---------------------------------------------------------------------------------------
read.csv("AcademyofScience.csv")

AcademyOfScienceSR<-AcademyOfScienceSR %>% drop_na()
count5 <- 0
i<- 1
for (i in i:nrow(AcademyOfScienceSR)) {
  if (AcademyOfScienceSR$Full.Year.Result[[i]] > AcademyOfScienceSR$Target[[i]]) {
    count5<- count5+1
    i<-i+1
  }
}
count5
AcademyOfScience_SuccessRate<- count/nrow(AcademyOfScience)
AcademyOfScience_SuccessRate  #### 0.4


mean(AcademyOfScience$Full.Year.Result, na.rm = TRUE)
##total mean = 1,135,974


#-----------------------------------------------------------------------------------



