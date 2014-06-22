
# This R script called run_analysis.R that does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# import activity labels and features Data
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"")
features <- read.table("./UCI HAR Dataset/features.txt", quote="\"")

# import test Data
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")

# import train Data
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")


# Merge the two data sets (test and train Data) to create one data set
# Label the columns: Uses descriptive activity names to name the activities in the data set

subject <- rbind(subject_test, subject_train)
colnames(subject) <- "Subject_ID"


activity <- rbind(y_test, y_train)
activity <- sapply(activity, function(x) activity_labels[x, 2])
colnames(activity) <-"Activity_Type"

data_set <-rbind(X_test, X_train)
colnames(data_set) <- features[,2]

data <- cbind(subject, activity, data_set)


# Subset the Data to xtracts only the measurements on the mean and standard deviation for each measurement
mean_col <- grep("mean()", colnames(data))
std_col <- grep("std()", colnames(data))
subset_col <- c(1, 2, mean_col, std_col)

mean_std_data <- data[,subset_col]

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject

library(plyr)
average_data <- ddply(mean_std_data, .(Subject_ID, Activity_Type), function(x) {
        cols <- !names(x) %in% c("Subject_ID", "Activity_Type")
        apply(x[, cols], 2, function(y) mean(as.numeric(y)))
} )

#Save the new tidy data set on the working directory

write.table(mean_std_data, "Mean_Std_data.txt")
write.table(average_data, "Average_data.txt")
