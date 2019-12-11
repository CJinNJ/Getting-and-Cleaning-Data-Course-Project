## Load needed Libraries
library(dplyr)

DataFile <- "Coursera_DS3_Final.zip"

# Checking if zipfile already exists.  If not download it
if (!file.exists(DataFile)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, DataFile, method="curl")
}  

# Checking if folder exists if not unzip the file
if (!file.exists("UCI HAR Dataset")) { 
        unzip(DataFile) 
}

## Read the Activity "Y" files 

ActivityTestData  <- read.table(file.path("UCI HAR Dataset/test/y_test.txt"),header = FALSE)
ActivityTrainData <- read.table(file.path("UCI HAR Dataset/train/y_train.txt"),header = FALSE)

## Read the "Subject" files 

SubjectTrainData <- read.table(file.path("UCI HAR Dataset/train/subject_train.txt"),header = FALSE)
SubjectTestData  <- read.table(file.path("UCI HAR Dataset/test/subject_test.txt"),header = FALSE)

## Read the Fearures "X" files

FeaturesTestData  <- read.table(file.path("UCI HAR Dataset/test/X_test.txt"),header = FALSE)
FeaturesTrainData <- read.table(file.path("UCI HAR Dataset/train/X_train.txt"),header = FALSE)

## 1. Merges the training and the test sets to create one data set.

## Concatenate the data tables by rows
SubjectData <- rbind(SubjectTrainData, SubjectTestData)
ActivityData<- rbind(ActivityTrainData, ActivityTestData)
FeaturesData<- rbind(FeaturesTrainData, FeaturesTestData)

## Set names to variables
names(SubjectData)<-c("subject")
names(ActivityData)<- c("activity")
FeaturesDataNames <- read.table(file.path("UCI HAR Dataset/features.txt"),head=FALSE)
names(FeaturesData)<- FeaturesDataNames$V2

## Merge columns to get the data frame Data for all data
CombineData <- cbind(SubjectData, ActivityData)
MergedData <- cbind(CombineData, FeaturesData)

## 2. Extracts only the measurements on the mean and 
##    standard deviation for each measurement.

## Subset Name of Features by measurements on the mean and 
## standard deviation. i.e taken Names of Features with “mean()” 
## or “std()”

FeaturesDataNamessub <- FeaturesDataNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesDataNames$V2)]

## Subset the data frame Data by seleted names of Features

selectedNames <- c(as.character(FeaturesDataNamessub), "subject", "activity" )
MergedData <- subset(MergedData,select=selectedNames)

## 3. Uses descriptive activity names to name the activities in the
##    data set.

activities_labels <- read.table("UCI HAR Dataset/activity_labels.txt", head = FALSE)

MergedData$activity <- activities_labels[MergedData$activity, 2]

## 4. Appropriately labels the data set with descriptive 
##    variable names.

names(MergedData)<-gsub("Acc", "Accelerometer", names(MergedData))
names(MergedData)<-gsub("Gyro", "Gyroscope", names(MergedData))
names(MergedData)<-gsub("BodyBody", "Body", names(MergedData))
names(MergedData)<-gsub("Mag", "Magnitude", names(MergedData))
names(MergedData)<-gsub("^t", "Time", names(MergedData))
names(MergedData)<-gsub("^f", "Frequency", names(MergedData))
names(MergedData)<-gsub("tBody", "TimeBody", names(MergedData))
names(MergedData)<-gsub("-mean()", "Mean", names(MergedData), ignore.case = TRUE)
names(MergedData)<-gsub("-std()", "STD", names(MergedData), ignore.case = TRUE)
names(MergedData)<-gsub("-freq()", "Frequency", names(MergedData), ignore.case = TRUE)
names(MergedData)<-gsub("angle", "Angle", names(MergedData))
names(MergedData)<-gsub("gravity", "Gravity", names(MergedData))
names(MergedData)<- gsub('[-()]', '', names(MergedData))

## 5. From the data set in step 4, creates a second, independent tidy
##    data set with the average of each variable for each activity 
##    and each subject.

FinalData <- MergedData %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))

write.table(FinalData, "FinalData.txt", row.name=FALSE)

