#1. Merges the training and the test sets to create one data set
mergeTrainTest = function(training, test){
      training_table = read.table(training)
      test_table = read.table(test)
      merged = rbind(training_table, test_table)
      return(merged)
}

subject_merged = mergeTrainTest("train\\subject_train.txt","test\\subject_test.txt")
X_merged = mergeTrainTest("train\\X_train.txt","test\\X_test.txt")
Y_merged = mergeTrainTest("train\\Y_train.txt","test\\Y_test.txt")

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
features = read.table("features.txt")
extractedCol = grep("mean\\(|std\\(",features[,2])
X_extract = X_merged[,extractedCol]
names(X_extract) = features[extractedCol,2]


#3. Uses descriptive activity names to name the activities in the data set
activity = read.table("activity_labels.txt")
Y_labeled = merge(Y_merged,activity,by.x="V1",by.y="V1")
names(Y_labeled) = c("Label","Activity")

#4. Appropriately labels the data set with descriptive activity names. 
names(subject_merged) = "SubjectID"
X_Y_labeled = cbind(subject_merged,Y_labeled$Activity,X_extract)
colnames(X_Y_labeled)[2]="Activity"


#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(data.table)
DT=data.table(X_Y_labeled)
tidyData = DT[,lapply(.SD,mean),by=list(SubjectID, Activity)]

write.table(tidyData, "tidyData_mean_of_each_SubjectAndActivity.txt")
