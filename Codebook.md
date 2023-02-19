# Introduction
This code book describes the variables, the data, and any transformations or work performed to clean up the data 

# Libraries used:
* R Base
* dplyr

# File Information:
* Project Folder
  + run_analysis.R 
  + README.md
  + CodeBook.md
  + processedData.txt (final tidy data file outputed from the script)
  + getdata_projectfiles_UCI HAR Dataset.zip (Data file in zip format downloaded from source)
  + UCI HAR Dataset (contains data files extracted from the zip file)
    + activity_labels.txt (activity label table)
    + features.txt (feature label table)
    + test
      + subject_test.txt (subject id in testing dataset)
      + X_test.txt (features in testing dataset)
      + y_test.txt (activity id in testing dataset)
    + train
      + subject_train.txt (subject id in training dataset)
      + X_train.txt (features in training dataset)
      + y_train.txt (activity id in training dataset)

# Variables used:
Variable                  |Description
--------------------------|--------------------------
cDataURL                  |URL of the downloaded zip data file
cDataFileName             |Name of the downloaded zip data file
cDataFolder               |Folder name of the unzipped data
cTestDataFilePath         |Folder name of the testing dataset
cTrainDataFilePath        |Folder name of the training dataset
cTestXDataFilePath        |File name of the feature data in testing dataset
cTestYDataFilePath        |File name of the activity id data in testing dataset
cTestSubjectDataFilePath  |File name of the subject id data in testing dataset
cTrainXDataFilePath       |File name of the feature data in training dataset
cTrainYDataFilePath       |File name of the activity id data in training dataset
cTrainSubjectDataFilePath |File name of the subject id data in training dataset
cFeatureDataFilePath      |File name of the feature label table
cActivityDataFilePath     |File name of the activity label table
cOutputDataFilePath       |File name of the output processed data
dfFeature                 |Dataframe of the feature label
dfActivity                |Dataframe of the activity label
dfTestX                   |Dataframe of the feature data in testing dataset
dfTestY                   |Dataframe of the activity id data in testing dataset
dfTestSubject             |Dataframe of the subject id data in testing dataset
dfTrainX                  |Dataframe of the feature data in training dataset
dfTrainY                  |Dataframe of the activity id data in training dataset
dfTrainSubject            |Dataframe of the subject id data in training dataset
dfX                       |Dataframe of the feature data in merged dataset (testing + training)
dfY                       |Dataframe of the activity id in merged dataset (testing + training)
dfSubject                 |Dataframe of the subject id in merged dataset (testing + training)
listFeatureIDInScope      |Column position list of those feature related to mean & standard derivation
dfFeaturesInScope         |Dataframe of the filtered dfx that contains only features related to mean & standard derivation
dfFullDataSet             |Dataframe join subject id (dfSubject), activity id (dfY) and features (dfx)
cColumnNames              |list of descriptive column names of the final dataset
dfOutputDataSet           |final dataset output to file


# Data Processing Procedure
1. Download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip the data set into a "UCI HAR Dataset" folder
3. Ensure the files in the zip file are in "UCI HAR Dataset" folder
4. Read data into dataframe:
    + Read feature label into dfFeature
    + Read activity label into dfActivity
    + Read feature data in testing dataset into dfTestX
    + Read activity id data in testing dataset into dfTestY
    + Read subject id data in testing dataset into dfTestSubject
    + Read feature data in training dataset into dfTrainX
    + Read activity id data in training dataset into dfTrainY
    + Read subject id data in training dataset into dfTrainSubject
5. Merges the training and the test sets to create one data set, assuming testing and training data have the same data schema
    + Union dfTestX and dfTrainX into dfX
    + Union dfTestY and dfTrainY into dfY
    + Union dfTestSubject and dfTrainSubject into dfSubject
6. Extracts only the measurements on the mean and standard deviation for each measurement
    + Extract the column position list in dfFeature for those feature with name containing "mean(" or "std(" into listFeatureIDInScope
    + Filter dfTestX to become dfFeaturesInScope to include only the columns with position id in listFeatureIDInScope
    + Join dfSubject, dfY and dfX together to form a new dataframe dfFullDataSet
7. Uses descriptive activity names to name the activities in the data set
    + Replace activity_id in dfFullDataSet by activity in dfActivity
8. Appropriately labels the data set with descriptive variable names
    + Rename activity_id into activity
    + Rename starting t into time
    + Rename starting f into frequency
    + Rename Acc into Accelerometer
    + Rename Gyro into Gyroscope
    + Rename Mag into Magnitude
    + Rename std into stddev
    + Remove ..
6. Create a dataset called dfOutputDataSet with the average of each variable for each activity and each subject id
7. Export the tidy data into cOutputDataFilePath
