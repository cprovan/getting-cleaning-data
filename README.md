#Getting and Cleaning Data
##Course Project: ReadMe

This repo includes the script and codebook to execute the tasks laid out in the course project for the "Getting and Cleaning Data" course. The script run_analysis.R performs the full analysis. The initial tidy dataset is output as data frame df, and the final tidy dataset (as described in step 5 of the project instructions) is output as data frame tidy.df. The final tidy dataset is also written to file tidydf.txt in the current working directory.

The script assumes that the raw data has been downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data must be unzipped, and the "UCI HAR Dataset" directory from the zip must be placed into the current working directory.

Script run_analysis.R can then be executed. This script performs the steps described in the project requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement (assumed to be features with mean() or std() in name). 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

For information on the source and output data, see file Codebook.md. 