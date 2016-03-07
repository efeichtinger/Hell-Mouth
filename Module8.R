#Module 8
#Plyr
#Run a mean using Sex as the category
#write the resulting output to a file

setwd("C:/Users/Erin/Hell-Mouth")

library(plyr)

df <- read.csv(file="DataSet.csv")
str(df)

#Mean using plyr
#mean grade by sex and age
df2 <- ddply(df, "Sex", summarise,
             N = length(Grade),
             mean = mean(Grade))

write.csv(df2,file =  "C:/Users/Erin/Hell-Mouth/mydata.csv")


#mean grade by sex and grade
df3 <- ddply(df, c("Sex"), summarise,
             N= length(Age),
             mean = mean(Age))
write.csv(df3, file = "C:/Users/Erin/Hell-Mouth/mydata2.csv")


#Part 2
#test the DataSet.txt dataframe for names whos name contains the 
#letter i, then create a new data set with those names, 
#Write those names to a file separated by comma's (CSV)
name.i <- subset(df, grepl("[iI]", df$Name))

write.csv(name.i, file = "C:/Users/Erin/Hell-Mouth/mydata2.csv")
