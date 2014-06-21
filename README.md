GCD_Course_Project
==================

code for the Coursera Getting and Cleaning Data Course Project

The `run_analysis.R` script obtains the required input data from the course website if not present then transforms and summarizes the data as follows;

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second independent tidy data set (`HAR_summarised_tidydata.txt`) with the average of each variable for each activity and each subject.    

The `CodeBook.md` (generated from `CodeBook.Rmd`) summarizes the resulting tidy dataset.  
