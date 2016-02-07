### R course spring 2016
### Assignment 2
### Going through the Basic R Studio Tutorial 
### NOTE- all code below is from the examples provided in the R Studio Tutorial 

#import data set using command line
acs <- read.csv(url("http://stat511.cwick.co.nz/homeworks/acs_or.csv"))
View(acs)

#get the column of husband ages
acs$age_husband
#access data as a vector, show the element in the first row, third column
acs[1,3]

#subset data
a <- subset(acs, age_husband > age_wife)
View(a)

#descriptive stats
mean(acs$age_husband)
median(acs$age_husband)
quantile(acs$age_wife)
var(acs$age_wife)
sd(acs$age_wife)

#summary
summary(acs)

#basic plot 
plot(acs$age_husband, acs$age_wife, type = "p")

#histogram
hist(acs$number_children)

counts <- table(acs$bedrooms)
barplot(counts, main="Bedrooms Distribution", xlab="Number of Bedrooms")
