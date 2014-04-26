#dtest <- read.table("./data/test.txt", nrows = c(1,3,6,4))
#grep("mean()",dtest)
#mycols <- rep("NULL", 6)
#mycols[c(1,5,6)] <- NA
#dtest <- read.table("./data/test.txt", colClasses = mycols )


#df1 = data.frame(id = sample(1:10), x = rnorm(10));df1
#df2 = data.frame(id = sample(11:20), x = rnorm(10));df2
#rbind(df1,df2)


library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
sapply(s, colMeans)



s1 <- split(data, data$Activity)
dtidy1 <- sapply(s1, function(x) colMeans(x[, c(3: nFeatures )]))
dtidy1 <- round(t(dtidy1),4)
dtidy1 <- cbind(Activity = rownames(dtidy1), dtidy1)
dtidy1[1:2,1:4]
write.table(dtidy1,"dtidy1.txt",sep = "\t", row.names = F)

s2 <- split(data, data$Subject)

dtidy2 <- sapply(s2, function(x) colMeans(x]))
dtidy2 <- round(t(dtidy2),4)
dtidy2 <- cbind(Subject = rownames(dtidy2), dtidy2)
dtidy2[1:2,1:4]

write.table(dtidy2,"dtidy2.txt",sep = "\t", row.names =F)
