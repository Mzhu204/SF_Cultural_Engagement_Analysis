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

#------------------------------------------------------------------
SF_Data<- read.csv("PublicLibrary.csv")

tapply(PublicLibrary$Full.Year.Result, PublicLibrary$post_covid, mean, na.rm = TRUE)
tapply(PublicLibrary$Full.Year.Result, PublicLibrary$pre_covid, mean, na.rm = TRUE)
mean(PublicLibrary$Full.Year.Result[PublicLibrary$End.Calendar.Year %in% c(2020, 2021)],na.rm = TRUE)
#pre-covid mean = 6,085,149
#post-covid mean = 3,530,371 
#covid mean = 2,134,569


#Measure the Immediate Drop From Baseline:  Shock Magnitude= Pre-COVID Mean/ (Pandemic Mean −Pre-COVID Mean)
#pre-covid mean = 6,085,149, post-covid mean = 3,530,371 
6085149/( 2134569-6085149) # == -1.54 = a 154% drop in visitors
3530371/6085149 #0.58 recovery ratio = visitor levels are only 60% recovered


library(scales)
 
PB<- ggplot(
  data = PublicLibrary,			
  mapping = aes(                                   
    x = End.Calendar.Year,
    y = as.numeric(Full.Year.Result))
)+
  
geom_rect(aes(xmin = 2020, xmax = 2030, ymin = 0, ymax = 7500000),alpha = 0.005, fill = "red")+
  
  geom_segment(aes( y=6085149 ,yend= 6085149,x= 2010, xend = 2019), color = "darkgreen")+
  geom_segment(aes( y=3530371  ,yend= 3530371 ,x= 2022, xend = 2030), color = "red")+
  
  labs(title ="Public Library Pre vs Post Pandemic Mean Number of Visitors")+
  xlab("Year")+
  ylab("Observed Number of Visitors")+
  geom_point() +
  scale_y_continuous(labels = label_comma())+
  theme_bw()
  
ggsave(
  filename = "PubliLibrary_means.png",
  plot = PB,
  width = 7,
  height = 5,
  dpi = 300
)


#------------------------------------------------------------------------------------
read.csv("DeYoung.csv")

tapply(DeYoung$Full.Year.Result, DeYoung$post_covid, mean, na.rm = TRUE)
tapply(DeYoung$Full.Year.Result, DeYoung$pre_covid, mean, na.rm = TRUE)
mean(DeYoung$Full.Year.Result[DeYoung$End.Calendar.Year %in% c(2020, 2021)],na.rm = TRUE)
#Measure the Immediate Drop From Baseline:  Shock Magnitude= Pre-COVID Mean/ (Pandemic Mean −Pre-COVID Mean)
## pre-covid mean = 1,139,464.3 
#post-covid mean = 801,902.8
#covid mean = 395,225

1139464.3/(395225- 1139464.3) # gives -1.53 = -153% drop in visitors
801902.8/1139464.3 #gives 0.70 = number of visitors is 70% recovered

DeY<- ggplot(
  data = DeYoung,			
  mapping = aes(                                   
    x = End.Calendar.Year,
    y = as.numeric(Full.Year.Result))
)+
  
  geom_rect(aes(xmin = 2020, xmax = 2030, ymin = 0, ymax = 2000000),alpha = 0.005, fill = "red")+
  
  geom_segment(aes( y=1139464.3 ,yend= 1139464.3,x= 2010, xend = 2019), color = "darkgreen")+
  geom_segment(aes( y=801902.8 ,yend= 801902.8,x= 2022, xend = 2030), color = "red")+
  
  labs(title ="DeYoung Museum Pre vs Post 2020 Mean Number of Visitors")+
  xlab("Year")+
  ylab("Observed Number of Visitors")+
  geom_point() +
  scale_y_continuous(labels = label_comma())+
  theme_bw()

ggsave(
  filename = "DeYoung_means.png",
  plot = DeY,
  width = 7,
  height = 5,
  dpi = 300
)


#---------------------------------------------------------------------------------


read.csv("LegionOfHonor.csv")

tapply(LegionOfHonor$Full.Year.Result, LegionOfHonor$post_covid, mean, na.rm = TRUE)
tapply(LegionOfHonor$Full.Year.Result, LegionOfHonor$pre_covid, mean, na.rm = TRUE)
mean(LegionOfHonor$Full.Year.Result[LegionOfHonor$End.Calendar.Year %in% c(2020, 2021)],na.rm = TRUE)
## pre-covid mean = 377197.9
#post-covid mean =347682.8
#covid mean = 128,343.5

377197.9/(128343.5-377197.9) # gives -1.52 = 152%  drop in visitors
347682.8/377197.9 #gives 0.92 = LH is 92% recovered

LH<- ggplot(
  data = LegionOfHonor,			
  mapping = aes(                                   
    x = End.Calendar.Year,
    y = as.numeric(Full.Year.Result))
)+
  
  geom_rect(aes(xmin = 2020, xmax = 2030, ymin = 0, ymax = 750000),alpha = 0.005, fill = "red")+
  
  geom_segment(aes( y=377197.9 ,yend= 377197.9,x= 2010, xend = 2019), color = "darkgreen")+
  geom_segment(aes( y=347682.8 ,yend= 347682.8,x= 2022, xend = 2030), color = "red")+
  
  labs(title ="Legion Of Honor Museum Pre vs Post 2020 Mean Number of Visitors")+
  xlab("Year")+
  ylab("Observed Number of Visitors")+
  geom_point() +
  scale_y_continuous(labels = label_comma())+
  theme_bw()

ggsave(
  filename = "LegionOfHonor_means.png",
  plot = LH,
  width = 7,
  height = 5,
  dpi = 300)

#---------------------------------------------------------------------------------
read.csv("AsianArtMuseum.csv")

tapply(AsianArtMuseum$Full.Year.Result, AsianArtMuseum$post_covid, mean, na.rm = TRUE)
tapply(AsianArtMuseum$Full.Year.Result, AsianArtMuseum$pre_covid, mean, na.rm = TRUE)
mean(AsianArtMuseum$Full.Year.Result[AsianArtMuseum$End.Calendar.Year %in% c(2020, 2021)],na.rm = TRUE)
## pre-covid mean = 263,343.1
#post-covid mean = 143362.8
#covid mean= 59591.5

263343.1/ (59591.5- 263343.1) #= gives -1.29 = 129% drop in visitors
143362.8/263343.1 #gives 0.54 = AA only 54% recovered

AA<- ggplot(
  data = AsianArtMuseum,			
  mapping = aes(                                   
    x = End.Calendar.Year,
    y = as.numeric(Full.Year.Result))
)+
  
  geom_rect(aes(xmin = 2020, xmax = 2030, ymin = 0, ymax = 400000),alpha = 0.005, fill = "red")+
  
  geom_segment(aes( y=263343.1 ,yend= 263343.1,x= 2010, xend = 2019), color = "darkgreen")+
  geom_segment(aes( y=143362.8 ,yend= 143362.8,x= 2022, xend = 2030), color = "red")+
  
  labs(title ="Asian Art Museum Pre vs Post 2020 Mean Number of Visitors")+
  xlab("Year")+
  ylab("Observed Number of Visitors")+
  geom_point() +
  scale_y_continuous(labels = label_comma())+
  theme_bw()

ggsave(
  filename = "AsianArtMuseum_means.png",
  plot = AA,
  width = 7,
  height = 5,
  dpi = 300)

#---------------------------------------------------------------------------------------

read.csv("AcademyofScience.csv")


tapply(AcademyOfScience$Full.Year.Result, AcademyOfScience$post_covid, mean, na.rm = TRUE)
tapply(AcademyOfScience$Full.Year.Result, AcademyOfScience$pre_covid, mean, na.rm = TRUE)
mean(AcademyOfScience$Full.Year.Result[AcademyOfScience$End.Calendar.Year %in% c(2020, 2021)],na.rm = TRUE)
## pre-covid mean = 1,345,937
#post-covid mean = 1074167
#covid mean= 524717.5

1345937/(524717.5-1345937) #gives -1.64 = 164% drop in visitors
1074167/1345937 #0.798 = 80% recovered

AS<- ggplot(
  data = AcademyOfScience,			
  mapping = aes(                                   
    x = End.Calendar.Year,
    y = as.numeric(Full.Year.Result))
)+
  
  geom_rect(aes(xmin = 2020, xmax = 2030, ymin = 0, ymax = 1750000),alpha = 0.005, fill = "red")+
  
  geom_segment(aes( y=1345937 ,yend= 1345937,x= 2010, xend = 2019), color = "darkgreen")+
  geom_segment(aes( y=1074167 ,yend= 1074167,x= 2022, xend = 2030), color = "red")+
  
  labs(title ="Academy of Science Pre vs Post 2020 Mean Number of Visitors")+
  xlab("Year")+
  ylab("Observed Number of Visitors")+
  geom_point() +
  scale_y_continuous(labels = label_comma())+
  theme_bw()

ggsave(
  filename = "AcademyOfScience_means.png",
  plot = AS,
  width = 7,
  height = 5,
  dpi = 300)

#-----------------------------------------------------------------------------------
