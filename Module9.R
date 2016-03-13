#Module 9
#March 13 2016
##ggplot2

setwd("C:/Users/Erin/Hell-Mouth")
library(survival)

jays <- read.csv("Erin_Breeders_All_Years.csv")
colnames(jays)[1] <- "breeder"
colnames(jays)[2] <- "ID"

#convert dates to date format
jays$MinDate <- as.Date(jays$MinDate, format = "%m/%d/%Y")
jays$LastObsDate <- as.Date(jays$LastObsDate, format = "%m/%d/%Y")

#subtract dates to get number of days
date.diff<- jays$LastObsDate-jays$MinDate

#and survival period in years, account for leap year 
jays["Yrs"] <- as.numeric(date.diff/365.25)
jays["FirstYr"] <- as.factor(jays$FirstYr)
jays <- subset(jays, jays$Yrs > 0 & jays$YrsExp > 0)

#add column for censorship status, in survival package - 0=alive, 1=dead
jays["censorship"] <- 1
#If last observed date = 10/14/2015, 0 for still alive today
jays$censorship[which(jays$LastObsDate=="2015-10-14")]<-0

#change back to numeric for survival object 
jays$MinDate <- as.numeric(jays$MinDate)
jays$LastObsDate <- as.numeric(jays$LastObsDate)

#Create survival object - IS THIS CORRECT?? 
jay.ob <- Surv(jays$Yrs, jays$censorship, type =c('right'))
jay.lifetab <- survfit(jay.ob~1, conf.type = "log-log")

#Construct Kaplan-Meier Survival Curves, log scale
jay.fitlog <- plot(jay.lifetab, xlab = "Time (years)",
            log = "y", ylim = c(0.001,2), ylab = "Cumulative Survival", 
            main = "FL Scrub-Jay Breeder survival Log Scale")

#KM Curves by sex
km.sex <- survfit(jay.ob ~ jays$Sex, conf.type = "log-log")
sex.log <- plot(km.sex, col = c("dodgerblue","mediumorchid"), log = "y", ylim = c(0.001,2),
                lty  = c(1,2),lws=c(2,2), xlab = "Time (years)",ylab = "Cumulative Survival", 
                main = "Survival by Sex Log Scale")
legend("topright", c("Females","Males"), col = c("dodgerblue","mediumorchid"), 
       lty = c(1,2), lwd =2)

library(lattice)
xyplot(jays$Yrs ~ jays$AgeFirstBreed, data = jays, pch =19)
xyplot(jays$Yrs ~ jays$AgeFirstBreed | jays$Sex, data = jays, pch = 19,
       xlab = "Age at First Breeding", ylab = "Years Lived")


library(ggplot2)
ggplot(jays, aes(x=AgeFirstBreed, y=Yrs)) +
  geom_point(shape=1)+
  geom_smooth(method=lm,
              se=FALSE)

ggplot(jays, aes(x=AgeFirstBreed, y=Yrs, color=Sex)) +
  geom_point(shape = 1) + 
  geom_smooth(method=lm, se=FALSE)




