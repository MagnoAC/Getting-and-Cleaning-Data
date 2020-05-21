# Getting and Cleaning Data

## Project Goals

The main goal of this project was to create one R script name run_analysis.R that does the following.

1 - Merges the training and the test sets to create one data set.

2 - Extracts only the measurements on the mean and standard deviation for each measurement.

3 - Uses descriptive activity names to name the activities in the data set.

4 - Appropriately labels the data set with descriptive activity names.

5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How make the R Script work

1 - Download the data source (```UCI HAR Dataset```) and unzip it into a folder called "Obtaining and Cleaning data".

2 - Before running the script ```run_analysis.R```, adapt the working diretory in the ```setwd()``` function on the beginning of the script

3 - After running the script, a file called ```OaCD_Project.txt``` will be generated at your working directory.
