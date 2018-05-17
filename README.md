# -Getting-and-Cleaning-Data-Project
This is a repository made for the project of the "Getting and Cleaning Data" course  

This repository contains an R-scrpit called run_analysis.R that creates a tidy data set by working on

two different data sets: "Test set" and "Training set" which are obtained from 

"Getting and Cleaning Data" course of "Data science specialization" in Coursera

There is also a codebook.md file which describes all of the steps taken to create a tidy 

data set in detail.

## run_analysis.R script
In this script we follow five steps to create a tidy set which means that
* Selected mean and standard deviation of each measurement is in one column.
* Each different observation of that variable for each subject and each activity is in a different row.
* The variable names are human readable.

## Codebook.md 
This file contains all of the steps taken to create a tidy data set. These steps are:
* Merging the training and the test sets to create one data set
* Extracting only the measurements on the mean and standard deviation for each measurement 
* Using descriptive activity names to name the activities in the data set
* Appropriately labeling the data set with descriptive variable names
* Creating and independent tidy data set with the average of each variable for each activity and each subject

## Reading the tidy data set
To read the tidy data set one can use the following commands in R:

data <- read.table(file_path, header = TRUE) 

View(data)
