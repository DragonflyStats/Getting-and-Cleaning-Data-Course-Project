## Introduction
This code book describes the variables, the data, and any transformations or work performed to clean up the data 

### Libraries used:
* R version 4.0.4 Base
* {tidyverse} colleciton of R packages

### File Information:
* Project Folder
  + run_analysis.R 
  + README.md
  + CodeBook.md
  + TidiedData.txt (final tidy data file outputed from the script)
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

### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


### Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.
- 
# Variables used:
Variable                  |Description
--------------------------|--------------------------
1|subject
2|activity
3|TimeBodyAccelerometer.mean...X_mean
4|TimeBodyAccelerometer.mean...Y_mean
5|TimeBodyAccelerometer.mean...Z_mean
6|TimeGravityAccelerometer.mean...X_mean
7|TimeGravityAccelerometer.mean...Y_mean
8|TimeGravityAccelerometer.mean...Z_mean
9|TimeBodyAccelerometerJerk.mean...X_mean
10|TimeBodyAccelerometerJerk.mean...Y_mean
11|TimeBodyAccelerometerJerk.mean...Z_mean
12|TimeBodyGyroscope.mean...X_mean
13|TimeBodyGyroscope.mean...Y_mean
14|TimeBodyGyroscope.mean...Z_mean
15|TimeBodyGyroscopeJerk.mean...X_mean
16|TimeBodyGyroscopeJerk.mean...Y_mean
17|TimeBodyGyroscopeJerk.mean...Z_mean
18|TimeBodyAccelerometerMagnitude.mean..mean
19|TimeGravityAccelerometerMagnitude.mean..mean
20|TimeBodyAccelerometerJerkMagnitude.mean..mean
21|TimeBodyGyroscopeMagnitude.mean..mean
22|TimeBodyGyroscopeJerkMagnitude.mean..mean
23|FrequencyBodyAccelerometer.mean...X_mean
24|FrequencyBodyAccelerometer.mean...Y_mean
25|FrequencyBodyAccelerometer.mean...Z_mean
26|FrequencyBodyAccelerometer.meanFreq...X_mean
27|FrequencyBodyAccelerometer.meanFreq...Y_mean
28|FrequencyBodyAccelerometer.meanFreq...Z_mean
29|FrequencyBodyAccelerometerJerk.mean...X_mean
30|FrequencyBodyAccelerometerJerk.mean...Y_mean
31|FrequencyBodyAccelerometerJerk.mean...Z_mean
32|FrequencyBodyAccelerometerJerk.meanFreq...X_mean
33|FrequencyBodyAccelerometerJerk.meanFreq...Y_mean
34|FrequencyBodyAccelerometerJerk.meanFreq...Z_mean
35|FrequencyBodyGyroscope.mean...X_mean
36|FrequencyBodyGyroscope.mean...Y_mean
37|FrequencyBodyGyroscope.mean...Z_mean
38|FrequencyBodyGyroscope.meanFreq...X_mean
39|FrequencyBodyGyroscope.meanFreq...Y_mean
40|FrequencyBodyGyroscope.meanFreq...Z_mean
41|FrequencyBodyAccelerometerMagnitude.mean..mean
42|FrequencyBodyAccelerometerMagnitude.meanFreq..mean
43|FrequencyBodyAccelerometerJerkMagnitude.mean..mean
44|FrequencyBodyAccelerometerJerkMagnitude.meanFreq..mean
45|FrequencyBodyGyroscopeMagnitude.mean..mean
46|FrequencyBodyGyroscopeMagnitude.meanFreq..mean
47|FrequencyBodyGyroscopeJerkMagnitude.mean..mean
48|FrequencyBodyGyroscopeJerkMagnitude.meanFreq..mean
49|Angle.TimeBodyAccelerometerMean.Gravity.mean
50|Angle.TimeBodyAccelerometerJerkMean..GravityMean.mean
51|Angle.TimeBodyGyroscopeMean.GravityMean.mean
52|Angle.TimeBodyGyroscopeJerkMean.GravityMean.mean
53|Angle.X.GravityMean.mean
54|Angle.Y.GravityMean.mean
55|Angle.Z.GravityMean.mean
56|TimeBodyAccelerometer.std...X_mean
57|TimeBodyAccelerometer.std...Y_mean
58|TimeBodyAccelerometer.std...Z_mean
59|TimeGravityAccelerometer.std...X_mean
60|TimeGravityAccelerometer.std...Y_mean
61|TimeGravityAccelerometer.std...Z_mean
62|TimeBodyAccelerometerJerk.std...X_mean
63|TimeBodyAccelerometerJerk.std...Y_mean
64|TimeBodyAccelerometerJerk.std...Z_mean
65|TimeBodyGyroscope.std...X_mean
66|TimeBodyGyroscope.std...Y_mean
67|TimeBodyGyroscope.std...Z_mean
68|TimeBodyGyroscopeJerk.std...X_mean
69|TimeBodyGyroscopeJerk.std...Y_mean
70|TimeBodyGyroscopeJerk.std...Z_mean
71|TimeBodyAccelerometerMagnitude.std..mean
72|TimeGravityAccelerometerMagnitude.std..mean
73|TimeBodyAccelerometerJerkMagnitude.std..mean
74|TimeBodyGyroscopeMagnitude.std..mean
75|TimeBodyGyroscopeJerkMagnitude.std..mean
76|FrequencyBodyAccelerometer.std...X_mean
77|FrequencyBodyAccelerometer.std...Y_mean
78|FrequencyBodyAccelerometer.std...Z_mean
79|FrequencyBodyAccelerometerJerk.std...X_mean
80|FrequencyBodyAccelerometerJerk.std...Y_mean
81|FrequencyBodyAccelerometerJerk.std...Z_mean
82|FrequencyBodyGyroscope.std...X_mean
83|FrequencyBodyGyroscope.std...Y_mean
84|FrequencyBodyGyroscope.std...Z_mean
85|FrequencyBodyAccelerometerMagnitude.std..mean
86|FrequencyBodyAccelerometerJerkMagnitude.std..mean
87|FrequencyBodyGyroscopeMagnitude.std..mean
88|FrequencyBodyGyroscopeJerkMagnitude.std..mean




