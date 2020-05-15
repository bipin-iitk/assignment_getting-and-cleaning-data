# It is the description of code written in run_analysis.R

1. First of all zip file is downloaded using download.file().

2. This file is unzipped using unzip().

3. Data is stored in variables by reading through read.table().
 ### variable is on left hant side which is indicated below:

     activity = UCI HAR Dataset/activity_labels.txt
     features = UCI HAR Dataset/features.txt
     subject_test = UCI HAR Dataset/test/subject_test.txt
     X_test = UCI HAR Dataset/test/X_test.txt
     Y_test = UCI HAR Dataset/test/y_test.txt
     subject_train =  UCI HAR Dataset/train/subject_train.txt
     X_train = UCI HAR Dataset/train/X_train.txt
     Y_train = "UCI HAR Dataset/train/y_train.txt

4.  Merging of training and test data is done as following

    X_merged = rbind(X_train, X_test)
    Y_merged = rbind(Y_train, Y_test)
    subject_merged = rbind(subject_train, subject_test)
    all_merged = cbind(subject_merged, Y_merged, X_merged)


5. From above merged data columns containing the field name "mean" and "std" is extrscted by using grep() and sorting().

6. Descriptive activity name is assignmed to activity.

7. Appropirate column name is assigned as following:

(idy.Data)[2] = activity
Acc = Accelerometer
Gyro = Gyroscope
and so on.....


8 From the data set in above step,second, independent tidy data set with the average of each variable for each activity and each subject is created

9. Finally above data set is written in text file by using write.table()
