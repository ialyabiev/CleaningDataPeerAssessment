
runAnalysis <- function (datafolder)
{
        # define base path for data
        basePath <- paste0("./",datafolder,"/")
        message("Prepearing for reading data...")
        # Load futures
        
        features <- read.table(paste0(basePath,"features.txt"))
        nFeatures <- nrow(features) ;nFeatures
        
        message("Read features - OK")
        # find desired features (mean and std ) and their indexes
        
        featureIndexes <- (grep("mean\\(\\)|std\\(\\)",features$V2))
        features <- features[featureIndexes,]
        
        
        # define var dcols for reading desired columns from files 
        # X_train.txt and X_test.txt with read.table
        
        dcols <- rep("NULL", nFeatures);
        dcols[featureIndexes] <- NA
        
        # read desired columnts from train.txt and  test.txt
        message("Start reading train data....")
        dTrain <- read.table(paste0(basePath,"train/X_train.txt"), colClasses = dcols) 
        message("Train data -  OK.\nStart reading test data...")
        dTest <- read.table(paste0(basePath,"test/X_test.txt"), colClasses = dcols) 
        
        message("Test data - OK")
        # read subject labels 
        
        subjectTrain <- read.table(paste0(basePath,"train/subject_train.txt"))
        subjectTest <- read.table(paste0(basePath,"test/subject_test.txt"))
        
        message("Read subjects - OK")
        
        # read activity labels
        
        activityTrain <- read.table(paste0(basePath,"train/y_train.txt"))
        activityTest <- read.table(paste0(basePath,"test/y_test.txt"))
        message("Read activities  - OK")
        
        # add subject labels and activity labels into test and train dataFrames
        
        dTrain <- cbind(subjectTrain,activityTrain,dTrain)
        dTest <- cbind(subjectTest,activityTest,dTest)
        nFeatures <- dim(dTest)[2]
        
        message("Add subject, activity columns - OK")
        
        # merge train and test data
        data <- rbind(dTrain , dTest)
        message("Merge data  - OK")
        
        # add descriptive activity names
        activityNames <- read.table(paste0(basePath,"activity_labels.txt"))
        data[,2] <- activityNames[data[,2],2]
        
        message("Add descriptive activities - OK")
        
        # create variable names vector for data frame
        colnames <- c( "Subject","Activity",as.vector(features$V2))
        colnames <- mapply(function(x) gsub("\\(\\)","",x),colnames, USE.NAMES = F)
        colnames <- mapply(function(x) gsub("-","\\.",x),colnames, USE.NAMES = F)
        
        # apply column names to data frame
        names(data) <- colnames
        message("Create tidy variable names - OK")
        message("Return dataframe \"data\"")
        return(data)
}

createTidyData <- function (data){
        
        #data.t <- data
        #data <- data.t
        
        # Create tidy data
        message("Start creating tidy data...")
        
        data$Activity <- as.numeric(data$Activity)
        SubjectActivity <- paste(data$Subject,data$Activity,sep=".")
        #data <- data.matrix(data)
                
        s <- split(data, SubjectActivity)
        dtidy <- sapply(s, colMeans)
        dtidy <- round(t(dtidy),4)
        
        
        dtidy <- data.frame(dtidy)
        dtidy <- dtidy[order(dtidy$Subject,dtidy$Activity),]
        rownames(dtidy) <- NULL
        dtidy[,2] <- activityNames[dtidy[,2],2]
        #dtidy[1:2,1:4]
        message("Tidy data created - OK")
        write.table(dtidy,"dtidy.txt",sep = " ", row.names = F)
        message("File \"tidy.txt\" was created.\nReturn.")
        message("Return data.frame \"tidydata\"")
        return(dtidy)
        
}