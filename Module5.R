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

#brute force approach
bp1 <- c(59,109,78,205,103,87,32,42,176,135)
fstt <- c(0,0,0,0,1,1,1,1,1,NA)
d <- data.frame(bp1,fstt)
#add in labels and stuff
boxplot(unstack(d))


ID <- c(1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7,7,7,8,8,8,9,9,9,10,10,10)
f <- c(0.6,0.6,0.6,0.3,0.3,0.3,0.4,0.4,0.4,0.4,0.4,0.4,0.2,0.2,0.2,0.6,0.6,0.6,
       0.3,0.3,0.3,0.4,0.4,0.4,0.9,0.9,0.9,0.2,0.2,0.2)
bp <- c(103,103,103,87,87,87,32,32,32,42,42,42,59,59,59,109,109,109,78,
        78,78,205,205,205,135,135,135,176,176,176)
test.ID <- c(1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3)
test.res <- c(0,0,0,0,0,1,0,1,0,0,1,1,1,0,0,1,0,1,1,1,0,1,1,1,1,1,1,NA,1,1)
d <- data.frame(ID,f,bp,test.ID,test.res)
arrange(d, test.res)

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
