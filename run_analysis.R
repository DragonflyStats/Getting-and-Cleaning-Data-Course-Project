###### R Packages
library(magrittr)
library(tidyverse)
library(stringr)

###### Data
## Downloading all Data Sets

filename <- "Coursera_Week4_FinalAssignment.zip"

# Checking if the file already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
  }  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
     unzip(filename) 
}

###### Preparatory Steps
## Reading test and training and assigning all datasets

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

###### Step 1:
## Merging the test and training sets to create one data set

X <- dplyr::bind_rows(x_train, x_test)
Y <- dplyr::bind_rows(y_train, y_test)

Subject <- dplyr::bind_rows(subject_train, subject_test)
Merged_Data <- dplyr::bind_cols(Subject, Y, X)

###### Step 2:
## Extracts only the measurements on the mean and standard deviation for each measurement.

myData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))


###### Step 3:
## Uses descriptive activity names to name the activities in the data set.

myData$code <- activities[myData$code, 2]

###### Step 4:
## Appropriately labels the data set with descriptive variable names.

names(myData)[2] = "activity"
names(myData) <-  gsub("Acc", "Accelerometer", names(myData))
names(myData) <-  gsub("BodyBody", "Body", names(myData))
names(myData) <-  gsub("Gyro", "Gyroscope", names(myData))
names(myData) <-  gsub("Mag", "Magnitude", names(myData))
names(myData) <-  gsub("^t", "Time", names(myData))
names(myData) <-  gsub("^f", "Frequency", names(myData))
names(myData) <-  gsub("-mean()", "Mean", names(myData), ignore.case = TRUE)
names(myData) <-  gsub("-std()", "STD", names(myData), ignore.case = TRUE)
names(myData) <-  gsub("-freq()", "Frequency", names(myData), ignore.case = TRUE)
names(myData) <-  gsub("angle", "Angle", names(myData))
names(myData) <-  gsub("gravity", "Gravity", names(myData))
names(myData) <-  gsub("tBody", "TimeBody", names(myData))

###### Step 5:
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

FinalData <- myData %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))
  
write.table(FinalData, "TidiedData.txt", row.name=FALSE)
