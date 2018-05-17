# This is a codebook for "Gettind and Cleaning Data" project 

## Experimental design and background: 
Today, having data about different activities of people leads to useful data analyses that can be used
to infer important information. In this experiment 30 volunteers are involved, each performed six activities(WALKING, WALKING_UPSTAIRS,
SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

## Raw Data: 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width
sliding windows of 2.56 sec and 50% overlap (128 readings/window).The sensor acceleration signal, which has gravitational and body motion
components, was separated using a Butterworth low-pass filter into body acceleration and gravity.From each window, a vector of features 
was obtained by calculating variables from the time and frequency domain. 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## Processed Data:

