library(dplyr)
library(plyr)
#The order of the steps are different than the task

#reading files (includes also step 4)
features<- read.table("features.txt")   #import features
activity_labels<-read.table("activity_labels.txt",col.names = c("label","activity_name")) #import activity_labels

test_X<- read.table("test/X_test.txt",col.names = as.vector(features[[2]])) #import test_X_test add column names
test_y<- read.table("test/y_test.txt",col.names= "label") #import test_y_test 
subject_test <- read.table("test/subject_test.txt",col.names="subject_label") # import subjet train


train_X<- read.table("train/X_train.txt",col.names = as.vector(features[[2]])) #import train_X_test add column names
train_y<- read.table("train/y_train.txt",col.names= "label") #import train_y_test 
subject_train <- read.table("train/subject_train.txt",col.names="subject_label") # import subjet train

#(step 3) Change label to activity name in test_y and train_Y 
test_y_activity<- join(test_y,activity_labels)[-1] #test_y with activity names in stead of labels
train_y_activity<- join(train_y,activity_labels)[-1] #train_y with activity names in stead of labels

#(step 1) merge test and train sets 
merged_test <- cbind(test_y_activity,subject_test,test_X)
merged_train <- cbind(train_y_activity,subject_train,train_X)
merged_ALL <- rbind(merged_test,merged_train)

#(step 2) Extracts only the measurements on the mean and standard deviation for each measurement 
mean_std<-(grepl("activity_name",colnames(merged_test))|
             grepl("subject_label",colnames(merged_test))|  
                     grepl("mean",colnames(merged_test))|
             grepl("std",colnames(merged_test)))
merged_ALL<-merged_ALL[,mean_std==TRUE]

#(step 5)a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy <- aggregate(. ~subject_label + activity_name, merged_ALL, mean)
tidySet <- tidy[order(tidy$subject_label, tidy$activity_name),]

#export to txt file
write.table(tidySet, "tidySet.txt", row.name=FALSE)
