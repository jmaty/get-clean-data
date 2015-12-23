## Code Book

This code book describes data sets, variables, and transformations used to make a tidy data set in the [Getting and Cleaning Data Course Project](https://class.coursera.org/getdata-035).

### Input Data Set Overview

The project uses [Human Activity Recognition database](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

For more information see the [Human Activity Recognition Using Smartphones Data Set web pages](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Explanation of input files

In this project, we use the following files

- features.txt: names of the 561 features, i.e. variables
- activity_labels.txt: IDs and names of the 6 activities 
- X_train.txt: 7352 observations of the 561 features (from 70% of all volunteers, i.e. from 21 volunteers)
- y_train.txt: 7352 activity labels (integers) related to the observations in X_train.txt
- subject_train.txt: 7352 subject IDs (integers) related to the observations in X_train.txt
- X_test.txt: 2947 observations of the 561 features (from 30% of all volunteers, i.e. from 9 volunteers)
- y_test.txt: 2947 activity labels (integers) related to the observations in X_test.txt
- subject_test.txt: 2947 subject IDs (integers) related to the observations in X_test.txt

More information about the files is available in README.txt. More information about the features is available in features_info.txt.

### Script run_analysis.R

The script run_analysis.R contains all processing steps needed to make the tidy data set as specified by the project assingnment.

The script requires all the files specified above to be placed into the working directory of the script.

#### Processing steps

The script does the following:

1. The training and testing data sets, the features, and activity labels are read into the corresponding data frames. The variables in the data frames are named accordingly. The training and test sets are merged into a single data set.
2. Only variables (i.e. columns of the data frames) related to measurements on the mean and standard deviation for each measurement are kept in the data set. Other columns are removed. In addtition, subjectID and activity columns are added as the first and second columns of the data set.
3. The activity column is converted to a factor using the descriptive activity names.
4. An independent tidy data set is created containing the average of each variable for each activity and each subject.
5. The resulting tidy data set is written to a text file.
