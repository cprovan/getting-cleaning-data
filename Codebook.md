#Getting and Cleaning Data
##Course Project: Code book

This codebook describes the relevant source data, transformations applied, and output data for script run_analysis.R.

The source data can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the source data, how it was collected, and how the features were computed can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

run_analysis.R uses the data in the /train and /test subdirectories of the linked dataset. The script uses the mean (tagged with -mean()) and standard deviation (tagged with -std()) measurements for each of the following variables taken from the files train[test]/X_train[test].txt: 

(Note: all variables have been normalized onto [-1,1] and are therefore unitless.)

- tBodyAcc: body acceleration signal (variables for each dimension -X, -Y, -Z)
- tGravityAcc: gravity acceleration signal (variables for each dimension -X, -Y, -Z)
- tBodyAccJerk: body acceleration jerk (variables for each dimension -X, -Y, -Z)
- tBodyGyro: angular body acceleration (variables for each dimension -X, -Y, -Z)
- tBodyGyroJerk: angular body acceleration jerk (variables for each dimension -X, -Y, -Z)
- tBodyAccMag: magnitude of body acceleration vector
- tGravityAccMag: magnitude of gravity acceleration vector
- tBodyAccJerkMag: magnitude of body acceleration jerk vector
- tBodyGyroMag: magnitude of angular body acceleration vector
- tBodyGyroJerkMag: magnitude of angular body acceleration jerk vector
- Fast Fourier tranforms (FFTs) on the above variables:
    - fBodyAcc-XYZ
    - fBodyAccJerk-XYZ
    - fBodyGyro-XYZ
    - fBodyAccMag
    - fBodyAccJerkMag
    - fBodyGyroMag
    - fBodyGyroJerkMag
    
Additional fields in the tidy datasets:

- subjectid: subject numbers (1-30) taken from train[test]/subject_train[test].txt
- activity: activity name matched to activity number in train[test]/y_train[test].txt using the activities as listed in activity_labels.txt
- varmean: arithmetic mean of the indicated variable for each (subjectid,activity) tuple