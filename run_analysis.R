# Johns Hopkins Data Science Track
# Getting and Cleaning Data
#
# Course Project

# run_analysis.R performs the following steps:
#  - Merges the training and the test sets to create one data set.
#  - Extracts only the measurements on the mean and standard deviation for each 
#      measurement (assumed to be features with mean() or std() in name). 
#  - Uses descriptive activity names to name the activities in the data set
#  - Appropriately labels the data set with descriptive variable names. 
#  - From the data set in step 4, creates a second, independent tidy data set 
#      with the average of each variable for each activity and each subject.

# script assumes that the raw data download has been unzipped into a directory
#   named "UCI HAR Dataset" placed in the current working director
library(reshape2)

#load training data
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt");
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt");
trainY <- read.table("./UCI HAR Dataset/train/Y_train.txt");
#load test data
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt");
testX <- read.table("./UCI HAR Dataset/test/X_test.txt");
testY <- read.table("./UCI HAR Dataset/test/Y_test.txt");

#merge training data together, test data together, and concatenate
df <- rbind(cbind(trainSubject,trainY,trainX),
            cbind(testSubject,testY,testX));

#read feature file
features <- read.table("./UCI HAR Dataset/features.txt");
features <- rename(features,col = V1, feature = V2);
#extract feature names that include "mean()" or "std()"
#note: meanFreq() features are excluded
index <- grep("mean\\(\\)|std\\(\\)",features$feature);
features <- features[index,];
#extract subject, activity, and selected features from data frame
df <- df[,c(1,2,index+2)];
#rename variables
colnames(df) <- c("subjectid","activityid",
                  as.character(features$feature));

#load activity names
activities <- read.table("./UCI HAR Dataset/activity_labels.txt");
#add activity name to data frame and remove activity id
df <- mutate(df, activity = factor(activities$V2[df$activityid])) %>% select(-activityid);

#reshape data frame into long tidy dataset
df <- melt(df,id=c("subjectid","activity"),measure.vars = features$feature);

#compute mean by subject and activity for each variable
groups <- group_by(df,subjectid,activity,variable);
tidy.df <- summarize(groups,varmean = mean(value));

#write tidy.df to txt file in current working directory
write.table(tidy.df,"./tidydf.txt",row.name=FALSE);