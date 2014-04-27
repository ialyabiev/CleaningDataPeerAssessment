## CleaningData PeerAssessment

### Introduction
Here is the project for practice in using R for cleaning  data.  
The goal is to prepare tidy data that can be used for later analysis.  
Data was taken from "Human Activity Recognition Using Smartphones Data Set".  
Data set and description can be found at  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

### Scripts
Project contains two scrips 
* "run_analysis.R"
* "lib_run_analysis.R"  

Main script to run is "run_analysis.R".   

Script "lib_run_analysis.R" contains two function to help main script  
to produce clean data.    

### run_analysys.R
It's a main script. It can be run via command in R console:
```
source("run_analysis.R") 
```

For execution script correctly working directory must be set  
as a path to folder with the script. It can be done via command in R console:

```
setwd("path_to_run_analysis.R")
```
Script checks if the working directory contains subfolder   
with data set. Subfolder name for data set is "UCI HAR Dataset". This name  
can be changed via "foldername" variable in the script.   
If the data folder wasn't found then the script stops with error message.  
Otherwise it will execute two function from the "lib_run_analysis.R".  
The result of working the script will be data.frames tidydata with result.  

### lib_run_analysis.R
This script contain two functions: 

* runAnalysis 
* createTidyData.

__runAnalysis__ function collect data from various txt files, merge  
training and test dataset into one block, choose subset of columns,  
give columns headings, turned the numeric activities into activity names  
and so on. 
The result is data frame after all transformations.

__createTidyData__ function get data frame from __runAnalysis__ function and   
creates new tidy data set with the average of each variable for each activity   
and each subject. The function return data frame "tidydata" and also save
the  data frame as  "tidy.txt" ini the working directory.

Detailed descriptions of transformations both function made you can  
read at __CodeBook.md__


