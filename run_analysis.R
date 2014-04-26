# run_analysis.R
##add check if folder with samsung data exist


#define constants
nFeatures = 561
#datadir ="data"

##Load futures
features <- read.table("./data/features.txt")

#find desired features (mean and std ) and their indexes
featureIndexes <- (grep("mean\\(\\)|std\\(\\)",features$V2)); length(featureIndexes)
features <- features[featureIndexes,]

#define var dcols for reading desired columns from file with read.table
dcols <- rep("NULL", nFeatures);
dcols[featureIndexes] <- NA

nFeatures <- length(featureIndexes)

#read desired columnts from train.txt and  test.txt
dTrain <- read.table("./data/train/X_train.txt", colClasses = dcols) 
dTest <- read.table("./data/test/X_test.txt", colClasses = dcols) 

#add subject (volunteer) labels
subjectTrain <- read.table("./data/train/subject_train.txt")
subjectTest <- read.table("./data/test/subject_test.txt")

#add activity labels
activityTrain <- read.table("./data/train/y_train.txt")
activityTest <- read.table("./data/test/y_test.txt")

##add subject labels and activity labels into dataFrames  for test and train
dTrain <- cbind(subjectTrain,activityTrain,dTrain)
dTest <- cbind(subjectTest,activityTest,dTest)
nFeatures <- nFeatures +2

##merge train and test
data <- rbind(dTrain , dTest);dim(data)
##add labels 
names(data) <- c( "Subject","Activity",as.vector(features$V2))

## add descriptive activity names
activityNames <- read.table("./data/activity_labels.txt")
data$Activity <- activityNames[data$Activity,2]

data[1:2,1:4]


SubjectActivity <- paste(data$Subject,data$Activity,sep=".")
#data$Activity <- as.numeric(data$Activity)
data[1:2,1:4]
s <- split(data, SubjectActivity)
dtidy <- sapply(s,  function(x) colMeans(x[, c(3: nFeatures )]))
dtidy <- round(t(dtidy),4)
dtidy[1:2,1:4]
Subject <- mapply(function(x) sub("\\..*","",x),rownames(dtidy), USE.NAMES = F)
dtidy <-cbind(Subject = Subject, dtidy)
dtidy[1:2,1:4]


write.table(dtidy,"dtidy.txt",sep = "\t", row.names = F)


