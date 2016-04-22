#Summary::
#Automatically downloads the dependencies for creating a tidy_table at the end.
#Merges the training and test sets to create one data set.
#For each measurement extracts only the measurements on the mean and standard deviation.
#Names the activities in the data set with descriptive activity names.
#Labels the data set with descriptive activity names.
#Creates an independent and clean data set in the end with the average of each variable for each activity and each subject.


#Only Load packages if not installed previously.
if (!require("data.table")) {
  install.packages("data.table")
}
if (!require("reshape2")) {
  install.packages("reshape2")
}
require("data.table")
require("reshape2")



# Load activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
# Load: data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# For each measurement, Extract only the measurements on the mean and standard deviation 
extract_features <- grepl("mean|std", features)

# Load and process X_test data and y_test data.
X_test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test_data <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test_data) = features

# only Extract the measurements on the mean and standard deviation for each measurement.
X_test_data = X_test_data[,extract_features]

# Load activity labels
y_test_data[,2] = activity_labels[y_test_data[,1]]
names(y_test_data) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test_data, X_test_data)

# Load and process X_train data andy_train data.
X_train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train_data <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_train_data <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_train_data) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_train_data = X_train_data[,extract_features]

# Load activity data
y_train_data[,2] = activity_labels[y_train_data[,1]]
names(y_train_data) = c("Activity_ID", "Activity_Label")
names(subject_train_data) = "subject"

# Bind data
all_train_data <- cbind(as.data.table(subject_train_data), y_train_data, X_train_data)

# Merge test and train data
data = rbind(test_data, all_train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

#Write clean data set to file 
write.table(tidy_data, file = "./tidy_data.txt")
