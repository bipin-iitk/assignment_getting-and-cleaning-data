## downloading the file

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, "DataSet.zip")

## Unzipping

unzip("DataSet.zip") 

## Reading and storing the data from unzip file to different variables 

activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity.Code", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("no.", "functions"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity.Code")
subject_train <-  read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity.Code")

## merging data

X_merged = rbind(X_train, X_test)
Y_merged = rbind(Y_train, Y_test)
subject_merged = rbind(subject_train, subject_test)
## 1. Merges the training and the test sets to create one data set.
all_merged = cbind(subject_merged, Y_merged, X_merged)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

fields <- tolower(names(all_merged))    ## extracting column names
index1 = grep("mean", fields)            ## extracting indices of column names with "mean"
index2 = grep("std", fields)             ## extracting indices of column names with "std"
index = as.numeric(c(1,2,index1, index2))
index = sort(index)                       ## sorting the indices with "mean" and "std" as column name
tidy.Data = all_merged[,index]    ## tidy.Data is data with column name containing "mean" and "sd" only

## 3. Uses descriptive activity names to name the activities in the data set

tidy.Data$activity.Code <- activity[tidy.Data$activity.Code, 2]

## 4. Appropriately labels the data set with descriptive variable names.

names(tidy.Data)[2] = "activity"
names(tidy.Data)<-gsub("Acc", "Accelerometer", names(tidy.Data))
names(tidy.Data)<-gsub("Gyro", "Gyroscope", names(tidy.Data))
names(tidy.Data)<-gsub("BodyBody", "Body", names(tidy.Data))
names(tidy.Data)<-gsub("Mag", "Magnitude", names(tidy.Data))
names(tidy.Data)<-gsub("^t", "Time", names(tidy.Data))
names(tidy.Data)<-gsub("^f", "Frequency", names(tidy.Data))
names(tidy.Data)<-gsub("tBody", "TimeBody", names(tidy.Data))
names(tidy.Data)<-gsub("-mean()", "Mean", names(tidy.Data), ignore.case = TRUE)
names(tidy.Data)<-gsub("-std()", "STD", names(tidy.Data), ignore.case = TRUE)
names(tidy.Data)<-gsub("-freq()", "Frequency", names(tidy.Data), ignore.case = TRUE)
names(tidy.Data)<-gsub("angle", "Angle", names(tidy.Data))
names(tidy.Data)<-gsub("gravity", "Gravity", names(tidy.Data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

library(dplyr)
tidy.Data_avg <- tidy.Data %>% group_by(subject, activity) %>% summarise_all(funs(mean))

## write above data in a text file

write.table(tidy.Data_avg, "tidy_Data_avg.txt", row.name=FALSE)













