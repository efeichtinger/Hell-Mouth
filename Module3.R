## R course Spring 2016
## Module 3

Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_politicalpollresults <- c(4,62,51,21,2,14,15)
NBC_politicalpollresults <- c(12,75,43,19,1,21,19)

#Binding with different modes using cbind() results in R coerceing the elements to
#the most general 
#Let's check

pres.cand <- cbind(Name, ABC_politicalpollresults, NBC_politicalpollresults)
pres.cand

pres.cand <- as.data.frame(pres.cand)
mean(pres.cand, na.rm=TRUE)
mean(pres.cand[,2:3])
summary(pres.cand)

#I can look at each candidate's polling result by indexing
Jeb <- pres.cand[1,1:3]
Donald <- pres.cand[2,1:3]
Ted <- pres.cand[3,1:3]
Marco <- pres.cand[4,1:3]
Carly <- pres.cand[5,1:3]
Hillary <- pres.cand[6,1:3]
Bernie <- pres.cand[7,1:3]

ggplot(pres.cand, aes(pres.cand$Name, y="Polling results", color = "Media Outlet")) + 
  geom_point(aes(y = pres.cand$ABC_politicalpollresults , col = "ABC")) + 
  geom_point(aes(y = pres.cand$NBC_politicalpollresults, col = "NBC")) + 
  labs(x = "Candidate", y = "Polling Results")   +
theme(
    axis.title=element_text(face="bold", size = "12", color="black"))
  












