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

