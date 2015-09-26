# getdata-032-w3

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# How the script works:

Download the data set from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzip the files to a "UCI HAR Dataset" folder in your working dictory.

You will need the "reshape2" library installed.
Run the run_analysis.R script. This will do steps 1 to 5 from above and output a tidy data set file called "tidyData.txt".

