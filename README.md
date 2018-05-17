# -Getting-and-Cleaning-Data-Project
This is a repository made for the project of the "Getting and Cleaning Data" course  

This repository contains an R-scrpit called run_analysis.R that creates a tidy data set by working on

two different data sets: "Test set" and "Training set" which are obtained from 

"Getting and Cleaning Data" course of "Data science specialization" in Coursera
* The first step it to merge traning set and test set to create a merged data set

We read the required datasets with "read.table" function 

and then using "cbind" and "rbind" functions we merge these datasets
* In the second step involves extracting only the measurements on the mean(mean()) 
and standard deviation(std()) for each measurement.

First, The names of the features are extracted from "features.txt" file 

Then, using "grep" function we find the indices of the measurements on the mean and 

standard deviation for each variable
* In the third step we use descriptive activity names to name the activities 
in the dataset
* In the fourth step we label the dataset with descriptive variable names, for instance

we use Freq instead of f to say that the signal is in the frequency domain

Using "gsub" function we replace variable names with descriptive names

Then we use these names as column names for our dataset using "colnames" function 
* In the fifth step we create a final independent dataset with the average of each

variable for each activity and each subject

Using "dplyr" package, we first group our data by Subjects and then by activities

and then we use summarize_all function to obtain final tiny data and end with 

only one observation(the mean) for each subject-activity pair
(30 subjects*6 activities = 180 observations in total)
* Finally, to read the tidy data again so as to check whether or not it is tidy
we use "read.table" function
