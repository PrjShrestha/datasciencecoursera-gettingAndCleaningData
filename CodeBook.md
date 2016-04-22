# CodeBook

This is a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.

## The data source

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information

The experiments was carried out with the help of 30 volunteers within an age bracket of 19-48 years. Each person performed the following six activities wearing the Samsung Galaxy S II on the waist. 
1.WALKING
2.WALKING_UPSTAIRS
3.WALKING_DOWNSTAIRS
4.SITTING
5.STANDING
6. LAYING

Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments had been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets of 70% and 30% of volunteers for training and testing respectively.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has body motion and gravitational components , was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Contains information about the variables used on the feature vector.

- 'features.txt': Contains the List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


## Transformation details

The following steps are carried out in the transformation:

1.Merges the training and test sets to create one data set.
2.For each measurement extracts only the measurements on the mean and standard deviation.
3.Names the activities in the data set with descriptive activity names.
4.Labels the data set with descriptive activity names.
5.Creates an independant and clean data set in the end with the average of each variable for each activity and each subject

## Working of ```run_analysis.R``` to carry out the transformation:

* Require ```reshapre2``` and ```data.table``` librareis, automatically download and install if not present.
* Load both test and train data.
* Load the features and activity labels.
* Extract the mean and standard deviation column names and data.
* Process the train data and test data respectively.
* Merge data set.
