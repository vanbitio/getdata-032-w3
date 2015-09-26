# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# library reshape2 for melt and dcast functions.
library(reshape2)

# Read the activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Read the features.txt file for column headers
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Read the test set of files
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Read the training set of files
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Bind the data together
XData <- rbind(X_test, X_train)
YData <- rbind(y_test, y_train)
SubjectData <- rbind(subject_test, subject_train)

# Set the column headers of XData to the data read from features.txt
names(XData) <- features

# Set the column headers of YData and SubjectData
names(YData) <- "activity_identifier"
names(SubjectData) <- "subject_identifier"

# Subset only needed data
meanStdCols <- grepl("mean|std", features)
subsetData <- XData[meanStdCols]

finalData <- cbind(subsetData, YData, SubjectData)

# Created new category variable for activity label
finalData$activity_label = factor(finalData$activity_identifier, levels=c(1:6), labels=activity_labels)

# Part 5
# Melt data frame to reshape data set
dataMelt <- melt(finalData, id=c("subject_identifier", "activity_identifier", "activity_label"),names(finalData[1:79]))

# Cast data into a different shape to summarize data, also pass in the mean function.
shapeData <- dcast(dataMelt, subject_identifier + activity_label ~ variable, mean)

# Write tidy data to file
write.table(shapeData, file="./tidyData.txt", row.name=FALSE)