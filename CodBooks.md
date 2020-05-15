# run_analysis.R : script file variable description
----------------------------------------------------------------

 ## Variable is on left hant side whose meaning is clearly indicated by exoression on right hand side
 
     activity = UCI HAR Dataset/activity_labels.txt
     features = UCI HAR Dataset/features.txt
     subject_test = UCI HAR Dataset/test/subject_test.txt
     X_test = UCI HAR Dataset/test/X_test.txt
     Y_test = UCI HAR Dataset/test/y_test.txt
     subject_train =  UCI HAR Dataset/train/subject_train.txt
     X_train = UCI HAR Dataset/train/X_train.txt
     Y_train = "UCI HAR Dataset/train/y_train.txt


    X_merged = rbind(X_train, X_test)
    Y_merged = rbind(Y_train, Y_test)
    subject_merged = rbind(subject_train, subject_test)
    all_merged = cbind(subject_merged, Y_merged, X_merged)

