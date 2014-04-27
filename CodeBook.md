 CodeBook
========================================================


## Introduction 

This file describes the variables, the data,  and also transformations performed to clean up the data.  

Data processing is divided into two main stages, which realizes by two correspondent functions

*  __function runAnalysis__  make all transformations initial data for steps 1-4:
       1. Merges the training and the test sets to create one data set.  
       2. Extracts only the measurements on the mean and standard deviation for each measurement.  
       3. Uses descriptive activity names to name the activities in the data set.
       4. Appropriately labels the data set with descriptive activity names.

        Funtion return dataframe "data"

* __function createTidyData__ produce tidy dataset for  step 5.  
        5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

Both functions placed into "lib_run_analysis.R" and started from the main script "run_analysis.R"


## Initial data

Out initial data get from  [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Full data information and description can be foud there.
In short we can say this data built from the recordings of subjects (volunteers) performing activities of daily living while carrying a waist-mounted smartphone with sensors.  

Number of subjects is 30.
Number of activities is 6. They are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
Two sensors are accelerometer and gyroscope. They are produced
3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  
The sensor signals were sampled in fixed-width sliding windows with overlap. From each window a 561-feature vector was obtained by calculating variables. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

That is our initial data.


## Transformations and convertions


### Step 1 and Step 2

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 

Before reading and merging we will do the step 2. It  decreases amount of data we need and speed up the process of reading and meerging.

We get full features list from file "features.txt" and keep only features  with substrings "mean()" or "std()". In result we get 33 features for mean and 33 for standart deviations.

We use this new list of features to read only necessary data from datasets in files "train/X_train.txt" and "test/X_test.txt" and in result we get two dataframes "dTrain", "dTest".


After that we read  subjects from "train/subject_train.txt", "test/subject_test.txt" and acctivities from "train/y_train.txt", "test/y_test.txt" corresponding to our data cases.
Then we add subject and activities columns to  dTrain, dTest.

And finally we merge two data frames into dataframe "data" 


### Step 3

Reading activity names from file "activity_labels.txt". 
Make simple substitution.  Place activity names instead of numbers. 


### Step 4.

First we create feature vector which contain "Subject","Activity" and features from "features.txt".   
Features typical initial format  is "tBodyAcc-mean()-X".  
All features names in initial dataset can be found in the file  "features.txt".  

For the purposes of  convenience in recognition variables by humans and for using new dataset in later analysis in R, we defined names for new variables.

We make only two modifications in the names and these modifications fit our goals perfectly.

* we cut out all brackets "()"
* we replaces hyphens "-" by dots "."

After this last step we have our result data frame "data" with the variables, described in the next section.


### List of variables:

* Toltal number of variables is 68
* 33 for measurement means
* 33 for measurement standart deviations

We describe only few of variables, to make idea what is going on.

* Subject - volunteer ID number from 1 to 30
* Activity - one of the six: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The initial raw acceleration signal was separated in initial dataset into body and gravity acceleration signals using low pass Butterworth filter with a corner frequency of 0.3 Hz.
So we have:

mean of body linear acceleration in XYZ direction

* tBodyAcc.mean.X  
* tBodyAcc.mean.Y 
* tBodyAcc.mean.Z 

standart deviation of body linear acceleration in XYZ direction

* tBodyAcc.std.X   
* tBodyAcc.std.Y  
* tBodyAcc.std.Z  


gravity acceleration signals means and standart deviation in XYZ direction

* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z

 angular velocity of body
 
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z

the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
tBodyAccJerk-XYZ.

* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z

and tBodyGyroJerk-XYZ.

* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z

the magnitude of three-dimensional signals were calculated using the Euclidean norm.
These groups are:  

tBodyAccMag

* tBodyAccMag.mean
* tBodyAccMag.std

tGravityAccMag

* tGravityAccMag.mean
* tGravityAccMag.std

tBodyAccJerkMag

* tBodyAccJerkMag.mean
* tBodyAccJerkMag.std

tBodyGyroMag

* tBodyGyroMag.mean
* tBodyGyroMag.std

tBodyGyroJerkMag

* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)

* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* fBodyAccMag.mean
* fBodyAccMag.std
* fBodyBodyAccJerkMag.mean
* fBodyBodyAccJerkMag.std
* fBodyBodyGyroMag.mean
* fBodyBodyGyroMag.std
* fBodyBodyGyroJerkMag.mean
* fBodyBodyGyroJerkMag.std

The full description of all other variables can be found in Data Set Description of [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Step 5

Step 5 performed by function __createTidyData__.

It gets as initial data the dataframe "data" which is the result of function __runAnalysis__.(steps 1-4).  

* First we return to numeric our activities column. 
* Then we create a vector "SubjectActivity" with composite elements "subject.activity".
* split our data by uses "SubjectActivity" vector for grouping.
* by using sapply and ColMeans function (that's why we made our activities numeric) with splitted data calculate average values for each variabls in each level in "SubjectActivity". It means we calculate average values  for each activity and each subject.
* then we transform result matrix and round our values to 4 decimal places. It makes data more readable.
* our last two step are ordering result data and return our activity variable to readbale names form.

At this moment we have "dtidy"" data frame.  
We write it to "dtidy.txt" file and return as result of the function.

---------------
---------------
That is the end of the processing our data.
