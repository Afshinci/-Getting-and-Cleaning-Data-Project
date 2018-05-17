#This is a R-scrpit called run_analysis.R that creates a tidy data set by working on
#two different data sets: "Test set" and "Training set" which are obtained from 
#"Getting and Cleaning Data" course of "Data science specialization" in Coursera

library(dplyr)
#The first step it to merge traning set and test set to create on data set
#We read the required datasets with "read.table" function and then using "cbind" and
#"rbind" function we merge these datasets

Data_test <- read.table("X_test.txt",header = FALSE)
Data_train <- read.table("X_train.txt",header = FALSE)
Data_subj_train <- read.table("subject_train.txt",header = FALSE)
Data_subj_test <- read.table("subject_test.txt",header = FALSE)
Data_activity_train <- read.table("y_train.txt",header = FALSE)
Data_activity_test <- read.table("y_test.txt",header = FALSE)
Data_train1 <- cbind(Data_subj_train,Data_activity_train,Data_train)
Data_test1 <- cbind(Data_subj_test,Data_activity_test,Data_test)
MergedData <- rbind(Data_test1,Data_train1)

#In the second step involves extracting only the measurements on the mean(mean()) 
#and standard deviation(std()) for each measurement.
#First, The names of the features are extracted from "features.txt" file 
#Then, using "grep" function we find the indices of the measurements on the mean and 
#standard deviation for each variable

feature_names <- read.table("features.txt",header = FALSE)
ind1 <- grep("mean()",feature_names[,2],fixed = TRUE)
ind2 <- grep("std()",feature_names[,2],fixed = TRUE)
ind <- c(ind1,ind2)
ind <- sort(ind)
ind_fin <- ind + 2
ind_final <- c(1,2,ind_fin)
MergedDataNew<- MergedData[,ind_final]

#In the third step we use descriptive activity names to name the activities 
#in the dataset
activity_names <- read.table("activity_labels.txt",header = FALSE)
MergedDataNew[,2] <- activity_names[MergedDataNew[,2],2]

#In the fourth step we label the dataset with descriptive variable names, for instance
#we use Freq instead of f to say that the signal is in the frequency domain
#Using "gsub" function we replace variable names with descriptive names

variableNames <- feature_names[ind,2]
DescriptiveNames <- gsub("^t","Time",variableNames)
DescriptiveNames <- gsub("^f","Freq",DescriptiveNames)
DescriptiveNames <- gsub("-",".",DescriptiveNames)
DescriptiveNames <- gsub("Acc","Acceleration",DescriptiveNames)
DescriptiveNames <- gsub("Gyro","Gyroscope",DescriptiveNames)
DescriptiveNames <- gsub("Mag","Magnitude",DescriptiveNames)
DescriptiveNames <- gsub("BodyBody","Body",DescriptiveNames)
#Then we use these names as column names for our dataset using "colnames" function 

FinalNames<- c("SubjectID","Activity",DescriptiveNames)
colnames(MergedDataNew) <- FinalNames

#In the fifth step we create a final independent dataset with the average of each
#variable for each activity and each subject
#Using "dplyr" package, we first group our data by Subjects and then by activities
#and then we use summarize_all function to obtain final tiny data and end with 
#only one observation(the mean) for each subject-activity pair
#(30 subjects*6 activities = 180 observations in total)

GroupedData <- group_by(MergedDataNew,SubjectID,Activity)
TidyData <- summarize_all(GroupedData,funs(mean))
write.table(TidyData,file="TidyDataset.txt",row.names = FALSE)

#Finally, to read the tidy data again so as to check whether or not it is tidy
#we use "read.table" function
read.table("TidyDataset.txt",header = TRUE)
