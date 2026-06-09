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

#--------------------------------------------------------------
SF_Data<- read.csv("PublicLibrary.csv")

postPB<- subset(PublicLibrary,PublicLibrary$post_covid==1)
modelPB <- lm(Full.Year.Result ~ End.Calendar.Year, data = postPB)
summary(modelPB)

prePB<- subset(PublicLibrary,PublicLibrary$pre_covid==1)
model2PB <- lm(Full.Year.Result ~ End.Calendar.Year, data = preDY)
summary(model2PB)

options(scipen=999)
 plot(Full.Year.Result ~ End.Calendar.Year, data = PublicLibrary, 
    xlim = c(2021, 2027),
     main = "Public Library Post-Covid Growth Rate",
     xlab = "Year",
     ylab = "Observed Number of Visitors")
text(x = 2024, y = 3e+06, label = "Growth Rate: 626,365 people/year", cex = 1)
abline(modelPB)

options(scipen=999)
plot(Full.Year.Result ~ End.Calendar.Year, data = PublicLibrary, 
     xlim=c(2015,2020),
     main = "Public Library Pre-Covid Growth Rate",
     xlab = "Year",
     ylab = "Observed Number of Visitors")
text(x = 2019, y = 5e+06, label = "Growth Rate: -144,423 people/year", cex = 1)
abline(model2PB)

#------------------------------------------------------------------------------------

read.csv("DeYoung.csv")

postDY<- subset(DeYoung,DeYoung$post_covid==1)
modelDY <- lm(Full.Year.Result ~ End.Calendar.Year, data = postDY)
summary(modelDY)


preDY<- subset(DeYoung,DeYoung$pre_covid==1)
model2DY <- lm(Full.Year.Result ~ End.Calendar.Year, data = preDY)
summary(model2DY)

options(scipen=999)
plot(Full.Year.Result ~ End.Calendar.Year, data = DeYoung, 
     xlim=c(2022, 2026),
     main = "DeYoung Museum Post-Covid Growth Rate",
     xlab = "Year",
     ylab = "Observed Number of Visitors")
text(x = 2024, y = 1200000, label = "Growth Rate:  61,542 people/year", cex = 1)
abline(modelDY)


options(scipen=999)
plot(Full.Year.Result ~ End.Calendar.Year, data = DeYoung, 
     xlim=c(2015,2020),
     main = "DeYoung Museum Pre-Covid Growth Rate",
     xlab = "Year",
     ylab = "Observed Number of Visitors")
text(x = 2019, y =1200000, label = "Growth Rate: -39,536 people/year", cex = 1)
abline(model2DY)

#---------------------------------------------------------------------------------

read.csv("LegionOfHonor.csv")

postLH<- subset(LegionOfHonor,LegionOfHonor$post_covid==1)
modelLH <- lm(Full.Year.Result ~ End.Calendar.Year, data = postLH)
summary(modelLH)


preLH<- subset(LegionOfHonor,LegionOfHonor$pre_covid==1)
model2LH <- lm(Full.Year.Result ~ End.Calendar.Year, data = preLH)
summary(model2LH)

options(scipen=999)
plot(Full.Year.Result ~ End.Calendar.Year, data = LegionOfHonor, 
     xlim=c(2022, 2026),
     main = "Legion Of Honor Post-Covid Growth Rate",
     xlab = "Year",
     ylab = "Observed Number of Visitors")
text(x = 2024, y = 400000, label = "Growth Rate: 29,479 people/year", cex = 1)
abline(modelLH)


options(scipen=999)
plot(Full.Year.Result ~ End.Calendar.Year, data = LegionOfHonor, 
     xlim=c(2015,2020),
     main = "Legion of Honor Pre-Covid Growth Rate",
     xlab = "Year",
     ylab = "Observed Number of Visitors")
text(x = 2019, y =400000, label = "Growth Rate: 3927 people/year", cex = 1)
abline(model2LH)

res <- resid(modelLH)

res2 <- resid(model2LH)

plot(fitted(modelLH), res)
abline(0,0)
qqnorm(res)
qqline(res) 

plot(fitted(model2LH), res2)
abline(0,0)
qqnorm(res2)
qqline(res2) 
#hmmmmm not much data for the assumptions of the data to be Not accurate...
#---------------------------------------------------------------------------------

read.csv("AsianArtMuseum.csv")

postAA<- subset(AsianArtMuseum,AsianArtMuseum$post_covid==1)
modelAA <- lm(Full.Year.Result ~ End.Calendar.Year, data = postAA)
summary(modelAA)

preAA<- subset(AsianArtMuseum,AsianArtMuseum$pre_covid==1)
model2AA <- lm(Full.Year.Result ~ End.Calendar.Year, data = preAA)
summary(model2AA)


options(scipen=999)
plot(Full.Year.Result ~ End.Calendar.Year, data = AsianArtMuseum, 
     xlim=c(2022, 2026),
     main = "Asian Art Museum Post-Covid Growth Rate",
     xlab = "Year",
     ylab = "Observed Number of Visitors")
text(x = 2024, y = 200000, label = "Growth Rate: -10,345 people/year", cex = 1)
abline(modelAA)


options(scipen=999)
plot(Full.Year.Result ~ End.Calendar.Year, data = AsianArtMuseum, 
     xlim=c(2015,2020),
     main = "Asian Art Museum Pre-Covid Growth Rate",
     xlab = "Year",
     ylab = "Observed Number of Visitors")
text(x = 2019, y =250000, label = "Growth Rate: -17,988 people/year", cex = 1)
abline(model2AA)
#---------------------------------------------------------------------------------------

read.csv("AcademyofScience.csv")

postAS<- subset(AcademyOfScience,AcademyOfScience$post_covid==1)
modelAS <- lm(Full.Year.Result ~ End.Calendar.Year, data = postAS)
summary(modelAS)

preAS<- subset(AcademyOfScience,AcademyOfScience$pre_covid==1)
model2AS <- lm(Full.Year.Result ~ End.Calendar.Year, data = preAS)
summary(model2AS)

options(scipen=999)
plot(Full.Year.Result ~ End.Calendar.Year, data = AcademyOfScience, 
     xlim=c(2022, 2026),
     main = "Academy Of Science Post-Covid Growth Rate",
     xlab = "Year",
     ylab = "Observed Number of Visitors")
text(x = 2024, y = 1400000, label = "Growth Rate: 148,851  people/year", cex = 1)
abline(modelAS)


options(scipen=999)
plot(Full.Year.Result ~ End.Calendar.Year, data = AcademyOfScience, 
     xlim=c(2015,2020),
     main = "Academy Of Science Pre-Covid Growth Rate",
     xlab = "Year",
     ylab = "Observed Number of Visitors")
text(x = 2019, y =1200000, label = "Growth Rate: -20,353 people/year", cex = 1)
abline(model2AS)
#-----------------------------------------------------------------------------------
