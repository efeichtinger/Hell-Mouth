#Module 5
#Data from local hospital 
#5 variables
#freq of visits,blood pressure, first assessment (0,1) 
#second assesment (0,1), care (0,1)
#Create boxplot and histogram
library(plyr)

#subject <- c(1:10)
freq <- c(0.6,0.3,0.4,0.4,0.2,0.6,0.3,0.4,0.9,0.2)
frq2 <- c(freq*100)
bloodp <- c(103,87,32,42,59,109,78,205,135,176)
first <- c("bad", "bad", "bad", "bad", "good", "good","good","good", "NA", "bad")
#same as first but with 1 and 0 
fst <- c(1,1,1,1,0,0,0,0,NA,1)
second <- c("low","low","high","high","low","low","high","high","high","high")
scd <- c(0,0,1,1,0,0,1,1,1,1)
fdec <- c("low","high","low","high","low","high","low","high","high","high")
fd <- c(0,1,0,1,0,1,0,1,1,1)

#data frames, df1 
df1 <- data.frame(freq, bloodp, first, second, fdec)
df2 <- data.frame(freq, bloodp, fst, scd, fd)

hist(df2$freq, main = "", xlab = "Frequency of Hospital Visits in Past Twelve Months",
     ylab = "Number of Cases", pin = c(5,5))
hist(df2$bloodp, main = "", xlab = "Blood Pressure", pin = c(5,5))

#brute force approach
bp1 <- c(59,109,78,205,103,87,32,42,176,135)
frqq <- c(0.2,0.6,0.3,0.4,0.6,0.3,0.4,0.4,0.2,0.9)
fstt <- c(0,0,0,0,1,1,1,1,1,NA)
d <- data.frame(bp1,fstt)
dd <- data.frame(frqq, fstt)
#blood pressure distribution between groups according to the first test 
boxplot(unstack(d), xlab = "First Test Result", ylab = "Blood Pressure",
        pin = c(5,5))
boxplot(unstack(dd), xlab = "First Test Result", 
      ylab = "Frequency of Visits Past 12 Months", pin = c(5,5))
sctt <- c(0,0,0,0,1,1,1,1,1,1)
bp2 <- c(103,87,59,109,32,42,78,205,135,176)
ddd <- data.frame(bp2,sctt)
boxplot(unstack(ddd), xlab = "Second Test Result", ylab = "Blood Pressure",
        pin = c(5,5))
thdtt <- c(0,0,0,0,1,1,1,1,1,1)
bp3 <- c(103,32,59,78,87,42,109,205,135,176)
dddd <- data.frame(bp3, thdtt)
boxplot(unstack(dddd), xlab = "Third Test Result", ylab = "Blodd Pressure",
        pin = c(5,5))
#some problems using stack and unstack with the data frames
#errors involving using factors, it ignores them 
#probably have to use reshape

#using function from plyr
arrange(df2, fst)
#using built in R function, does same thing
df2[ order(df2$freq), ]
df2[with(df2, order(fst,scd,fd)), ]

arrange(df2, fst)
stack(df2)
unstack(df2)
