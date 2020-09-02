#The order of the steps are different than the task

1 - reading all files (includes also step 4)
The files are read with read.table and the columns are getting names

2 - Change label to activity name in test_y and train_Y  (step 3)
The activity labels in test_y and train_y are replaced by the activity names 

3 - merging test and train sets (step 1)
Creating a dataframe "merged_ALL" which contains all the data.

4 - Extracts only the measurements on the mean and standard deviation for each measurement (step 2)
Making a dataframe with only the mean and standard deviation for each measurement

5 - a second, independent tidy data set with the average of each variable for each activity and each subject (step 5)
Creating the second data frame and saved the tidy data in txt file
