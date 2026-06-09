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

##################################################################### removing commmas from numbers to make them not characters anymore

SF_Data$Target <- gsub(",","",SF_Data$Target) 
SF_Data$Full.Year.Result <- gsub(",","",SF_Data$Full.Year.Result) 

###################################################### ##<- Raw Data is a LIST of 51 DATA FRAMES Where each dept is a df

Split_SF_Data<- split(SF_Data, SF_Data$Department.Name)
class(Split_SF_Data) 
length(Split_SF_Data)

###############################################<- PROBLEM: There are multiple measurements for each department all under "measurements"

Split_SF_Data$`PUBLIC LIBRARY`$Measure.Description
PublicLibrary<- Split_SF_Data$`PUBLIC LIBRARY`[c(27:39), ] #number of visitors
PublicLibrary
typeof(PublicLibrary$End.Calendar.Year)

PublicLibrary<- PublicLibrary %>%
  mutate(
    post_covid = if_else(End.Calendar.Year >= 2022, 1, 0)
  )
PublicLibrary<- PublicLibrary %>%
  mutate(
    pre_covid = if_else(End.Calendar.Year <= 2019, 1, 0)
  )

write.csv(PublicLibrary, file = "PublicLibraries.csv")

#------------------------------------------------------------------------------------
Split_SF_Data$`FINE ARTS MUSEUM`$Measure.Description
DeYoung<- Split_SF_Data$`FINE ARTS MUSEUM`[c(61:75), ]
# TWO Museums, number of visitors to Legion of Honor & number of visitors De Young

DeYoung<- DeYoung %>%
  mutate(
    post_covid = if_else(End.Calendar.Year >= 2022, 1, 0)
  )
DeYoung<- DeYoung %>%
  mutate(
    pre_covid = if_else(End.Calendar.Year <= 2019, 1, 0)
  )
write.csv(DeYoung, file = "DeYoung.csv")
#---------------------------------------------------------------------------------
Split_SF_Data$`FINE ARTS MUSEUM`$Measure.Description
LegionOfHonor<- Split_SF_Data$`FINE ARTS MUSEUM`[c(76:90), ]
LegionOfHonor

LegionOfHonor<- LegionOfHonor %>%
  mutate(
    post_covid = if_else(End.Calendar.Year >= 2022, 1, 0)
  )
LegionOfHonor<- LegionOfHonor %>%
  mutate(
    pre_covid = if_else(End.Calendar.Year <= 2019, 1, 0)
  )
write.csv(LegionOfHonor, file = "LegionOfHonor.csv")
#---------------------------------------------------------------------------------
Split_SF_Data$`ASIAN ART MUSEUM`$Measure.Description
AsianArtMuseum<- Split_SF_Data$`ASIAN ART MUSEUM`[c(29:43), ]
AsianArtMuseum
#number of every museum visitor entering the front door

AsianArtMuseum<- AsianArtMuseum %>%
  mutate(
    post_covid = if_else(End.Calendar.Year >= 2022, 1, 0)
  )
AsianArtMuseum<- AsianArtMuseum %>%
  mutate(
    pre_covid = if_else(End.Calendar.Year <= 2019, 1, 0)
  )
write.csv(AsianArtMuseum, file = "AsianArtMuseum.csv")
#---------------------------------------------------------------------------------------
Split_SF_Data$`ACADEMY OF SCIENCES`$Measure.Description
AcademyOfScience<- Split_SF_Data$`ACADEMY OF SCIENCES`[c(1: 15), ]
#total number of visitors to Aquarium and Academy

AcademyOfScience<- AcademyOfScience %>%
  mutate(
    post_covid = if_else(End.Calendar.Year >= 2022, 1, 0)
  )
AcademyOfScience<- AcademyOfScience %>%
  mutate(
    pre_covid = if_else(End.Calendar.Year <= 2019, 1, 0)
  )

write.csv(AcademyOfScience, file= "AcademyofScience.csv")

#------------------------------------------------------------------------------------------------------

SF_Data_MERGED<- read.csv("SF_DATA_CLEANED.csv")
head(SF_Data_MERGED)
class(SF_Data_MERGED)
dim(SF_Data_MERGED)
names(SF_Data_MERGED)
str(SF_Data_MERGED)
summary(SF_Data_MERGED)





