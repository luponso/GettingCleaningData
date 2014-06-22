
This R script called run_analysis.R that does the following:
1. Extract the rought data from UCI HAR Dataset directory to produce two tidy data sets as follow.
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

5. Appropriately labels the data set with descriptive variable names. 

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
        
mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
7. Produces two new data sets that will be placed in your working directory

        Mean_Std_data.txt: data set containing only the measurements on the mean and standard deviation for each measurement
        Average_data.txt: tidy data set with the average of each variable for each activity and each subject. 

About the Method:
Merge the two data sets (test and train Data) to create one data set using rbind()
Label the columns: Uses descriptive activity names to name the activities in the data set
Subset the Data to extracts only the measurements on the mean and standard deviation for each measurement using grep()
Creates a second, independent tidy data set with the average of each variable for each activity and each subject using plyr library
Save the new tidy data set on the working directory as txt files

