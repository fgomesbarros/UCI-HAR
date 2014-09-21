---
output:
  html_document:
    keep_md: yes
---
CodeBook
========

This Codebook describes what UCI-HAR raw data should be collected and how it is transformed in tidy data. It also shows the structure of the tidy data. 

## 1. Study Design

### 1.2 Which raw data should be used?
It should be used the Human Activity Recognition (HAR) Using Smartphones Data Set of the Center for Machine Learning and Intelligent Systems of the University of California, Irvine (UCI)

### 1.2 How should the raw data be collected?
The data should be downloaded from the UCI-HAR site. The URL is:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The URL to download the the data folder is:

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

### 1.3 How is the raw data organized?

For each observation, it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

So the data set includes the following data files:

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.  

### 1.4 Which files should be used?
All data files should be used, except the those in both Inertial Signal directories.

### 1.5 What's the process used to create the tidy data?

The tidy data is a combination of the files, following the steps:

#### STEP 1 - Appropriately labels the data set with descriptive variable names. 
In this step, the code gets the variable names from the features file. 

#### STEP 2 - Merges the training and the test sets to create one data set. 
The test and trains files are read. The apropriate labels are set, using the variable names obtained in the previous step.
The columns of "subject"", "y_test" and "X_test" data sets are combined in order to create the test and train data sets. After that, the rows of the two data sets are combined, forming the merged data set.

#### STEP 3 - Uses descriptive activity names to name the activities in the data set
The activity labels are read. In the merged data set, the Activity column is transformed in a factor, using the activity labels.

#### STEP 4 - Extracts only the measurements on the mean and standard deviation for each measurement.
The columns not corresponding the required measurements are removed from the data set. 

#### STEP 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The data set is molten by Subject and Activity. After that, the molten data frame is cast and ordered, creating the tidy data. The aggregate function used in the cast is the mean. Thus, the tidy data contains the mean of the all required measurements. Finally, the tidy data is written in a file.

### 1.6 What is the output generated?
The output, i.e the tidy data, is stored in the txt file "UCI-HAR-TidyData.txt".

A small output sample is showed below. Only six rows and five columns are showed. 

```
"Subject" "Activity" "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z"
1 "WALKING" 0.277330758736842 -0.0173838185273684 -0.111148103547368
1 "WALKING_UPSTAIRS" 0.255461689622641 -0.0239531492643396 -0.0973020020943396
1 "WALKING_DOWNSTAIRS" 0.289188320408163 -0.00991850461020408 -0.107566190908163
1 "SITTING" 0.261237565425532 -0.00130828765170213 -0.104544182255319
1 "STANDING" 0.278917629056604 -0.0161375901037736 -0.110601817735849
1 "LAYING" 0.22159824394 -0.0405139534294 -0.11320355358
2 "WALKING" 0.276426586440678 -0.0185949199145763 -0.105500357966102
```

## 2. CodeBook

2.1 What variables does tidy data set contain?

There are 68 variables in the tidy data set. The first two are the "Subject" and "Activity" variables:

* Subject: numeric.
* Activity: factor with 6 levels "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING", "STANDING" and "LAYING".

The rest of the variables are the required measurements. The class of these variables is numeric.

* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()

