# Coursera Course 3: Getting and Cleaning Data Repo

## Week 4 Project Summary

We should create one R script called run_analysis.R that does the following:

1. Merges the training and test sets to create one data set.
2. For each measurement extracts only the measurements on the mean and standard deviation.
3. Names the activities in the data set with descriptive activity names.
4. Labels the data set with descriptive activity names.
5. Creates an independant and clean data set in the end with the average of each variable for each activity and each subject.

## Steps to work on this course project

1. Download the data source and put into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio.
3. Run ```source("run_analysis.R")```, then it will generate a new file ```tidy_data.txt``` in your working directory.

## Dependencies

1. There are dependencies on packages ```reshape2``` and ```data.table```.
2. The dependencies are automatically installed through the script ```run_analysis.R```.   
