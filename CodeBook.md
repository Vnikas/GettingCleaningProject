
#CodeBook


> This is  a CodeBook that describes the variables, the data, and any transformations or work 
> that I performed to clean up of data collected from the accelerometers from the 
> Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
> <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>


##Description of the experiment

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

---

##Work performed to clean up Data 

First of all data were downloaded from:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


I then coded a script, *run_Analysis.R*, that does the following:

1. Read all the relative csv files and merges the data sets that, in their original form, are separated in test and train subsets. The files (and the directories) that I used were: 
      1. UCI HAR Dataset/test/X_test.txt and  
      2. UCI HAR Dataset/train/X_train.txt
      for the measurements.
      3. UCI HAR Dataset/activity_labels.txt
      for mapping activity codes to activity descriptions.
      4. UCI HAR Dataset/test/y_test.txt and
      5. UCI HAR Dataset/train/y_train.txt
      for the activities.
      6. UCI HAR Dataset/test/subject_test.txt and
      7. UCI HAR Dataset/train/subject_train.txt
      for the subjects.
      8. UCI HAR Dataset/features.txt for the feature names.
 
      
2. Extracts only the measurements on the mean and standard deviation for each measurement. In order to find the above  measurements I first used the **grep** function at the features names to find only those that contained the string "mean" or "std". Then I took the subset of the total dataset with only the appropriate features.
3. Merges the new dataset with activity descriptions in order to add the descriptive activity names to the dataset
4. Renames the dataset variables using syntactically valid names.
5. Creates a new dataset using the **aggregate** to find  the average of each variable for each activity and each subject. 

---


##Variables

Here are some interesting information about the Features (obtained by the featured_info file):


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:

mean(): Mean value

std(): Standard deviation



###Data Dictionary

All variables, except *subject* and *activity* are normalized and bounded within [-1,1] so **all features are nondimensional** (have no unit). Moreover all values of variables are averages for each activity and each subject.


| Variable   | Description|
|------------|------------|
|tBodyAcc.mean.X |The Mean of Body Acceleration measured by an Accelerometer in the time domain for the X direction |
|tBodyAcc.mean.Y |The Mean of Body Acceleration measured by an Accelerometer in the time domain for the Y direction |
|tBodyAcc.mean.Z |The Mean of Body Acceleration measured by an Accelerometer in the time domain for the Z direction |
|tBodyAcc.std.X |The Standard Deviation of Body Acceleration measured by an Accelerometer in the time domain for the X direction |
|tBodyAcc.std.Y |The Standard Deviation of Body Acceleration measured by an Accelerometer in the time domain for the Y direction |
|tBodyAcc.std.Z |The Standard Deviation of Body Acceleration measured by an Accelerometer in the time domain for the Z direction |
|tGravityAcc.mean.X |The Mean of Gravity Acceleration measured by an Accelerometer in the time domain for the X direction |
|tGravityAcc.mean.Y |The Mean of Gravity Acceleration measured by an Accelerometer in the time domain for the Y direction |
|tGravityAcc.mean.Z |The Mean of Gravity Acceleration measured by an Accelerometer in the time domain for the Z direction |
|tGravityAcc.std.X |The Standard Deviation of Gravity Acceleration measured by an Accelerometer in the time domain for the X direction |
|tGravityAcc.std.Y |The Standard Deviation of Gravity Acceleration measured by an Accelerometer in the time domain for the Y direction |
|tGravityAcc.std.Z |The Standard Deviation of Gravity Acceleration measured by an Accelerometer in the time domain for the Z direction |
|tBodyAccJerk.mean.X |The Mean of Jerk of Body Acceleration measured by an Accelerometer in the time domain for the X direction |
|tBodyAccJerk.mean.Y |The Mean of Jerk of Body Acceleration measured by an Accelerometer in the time domain for the Y direction |
|tBodyAccJerk.mean.Z |The Mean of Jerk of Body Acceleration measured by an Accelerometer in the time domain for the Z direction |
|tBodyAccJerk.std.X |The Standard Deviation of Jerk of Body Acceleration measured by an Accelerometer in the time domain for the X direction |
|tBodyAccJerk.std.Y |The Standard Deviation of Jerk of Body Acceleration measured by an Accelerometer in the time domain for the Y direction |
|tBodyAccJerk.std.Z |The Standard Deviation of Jerk of Body Acceleration measured by an Accelerometer in the time domain for the Z direction |
|tBodyGyro.mean.X |The Mean of Body Acceleration measured by a Gyroscope in the time domain for the X direction |
|tBodyGyro.mean.Y |The Mean of Body Acceleration measured by a Gyroscope in the time domain for the Y direction |
|tBodyGyro.mean.Z |The Mean of Body Acceleration measured by a Gyroscope in the time domain for the Z direction |
|tBodyGyro.std.X |The Standard Deviation of Body Acceleration measured by a Gyroscope in the time domain for the X direction |
|tBodyGyro.std.Y |The Standard Deviation of Body Acceleration measured by a Gyroscope in the time domain for the Y direction |
|tBodyGyro.std.Z |The Standard Deviation of Body Acceleration measured by a Gyroscope in the time domain for the Z direction |
|tBodyGyroJerk.mean.X |The Mean of Jerk of Body Acceleration measured by a Gyroscope in the time domain for the X direction |
|tBodyGyroJerk.mean.Y |The Mean of Jerk of Body Acceleration measured by a Gyroscope in the time domain for the Y direction |
|tBodyGyroJerk.mean.Z |The Mean of Jerk of Body Acceleration measured by a Gyroscope in the time domain for the Z direction |
|tBodyGyroJerk.std.X |The Standard Deviation of Jerk of Body Acceleration measured by a Gyroscope in the time domain for the X direction |
|tBodyGyroJerk.std.Y |The Standard Deviation of Jerk of Body Acceleration measured by a Gyroscope in the time domain for the Y direction |
|tBodyGyroJerk.std.Z |The Standard Deviation of Jerk of Body Acceleration measured by a Gyroscope in the time domain for the Z direction |
|tBodyAccMag.mean |The Mean of Magnitude of Body Acceleration measured by an Accelerometer in the time domain |
|tBodyAccMag.std |The Standard Deviation of Magnitude of Body Acceleration measured by an Accelerometer in the time domain |
|tGravityAccMag.mean |The Mean of Magnitude of Gravity Acceleration measured by an Accelerometer in the time domain |
|tGravityAccMag.std |The Standard Deviation of Magnitude of Gravity Acceleration measured by an Accelerometer in the time domain |
|tBodyAccJerkMag.mean |The Mean of Magnitude of Jerk of Body Acceleration measured by an Accelerometer in the time domain |
|tBodyAccJerkMag.std |The Standard Deviation of Magnitude of Jerk of Body Acceleration measured by an Accelerometer in the time domain |
|tBodyGyroMag.mean |The Mean of Magnitude of Body Acceleration measured by a Gyroscope in the time domain |
|tBodyGyroMag.std |The Standard Deviation of Magnitude of Body Acceleration measured by a Gyroscope in the time domain |
|tBodyGyroJerkMag.mean |The Mean of Magnitude of Jerk of Body Acceleration measured by a Gyroscope in the time domain |
|tBodyGyroJerkMag.std |The Standard Deviation of Magnitude of Jerk of Body Acceleration measured by a Gyroscope in the time domain |
|fBodyAcc.mean.X |The Mean of Body Acceleration measured by an Accelerometer in the frequency domain for the X direction |
|fBodyAcc.mean.Y |The Mean of Body Acceleration measured by an Accelerometer in the frequency domain for the Y direction |
|fBodyAcc.mean.Z |The Mean of Body Acceleration measured by an Accelerometer in the frequency domain for the Z direction |
|fBodyAcc.std.X |The Standard Deviation of Body Acceleration measured by an Accelerometer in the frequency domain for the X direction |
|fBodyAcc.std.Y |The Standard Deviation of Body Acceleration measured by an Accelerometer in the frequency domain for the Y direction |
|fBodyAcc.std.Z |The Standard Deviation of Body Acceleration measured by an Accelerometer in the frequency domain for the Z direction |
|fBodyAcc.meanFreq.X |The Mean of Body Acceleration measured by an Accelerometer in the frequency domain for the X direction |
|fBodyAcc.meanFreq.Y |The Mean of Body Acceleration measured by an Accelerometer in the frequency domain for the Y direction |
|fBodyAcc.meanFreq.Z |The Mean of Body Acceleration measured by an Accelerometer in the frequency domain for the Z direction |
|fBodyAccJerk.mean.X |The Mean of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain for the X direction |
|fBodyAccJerk.mean.Y |The Mean of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain for the Y direction |
|fBodyAccJerk.mean.Z |The Mean of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain for the Z direction |
|fBodyAccJerk.std.X |The Standard Deviation of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain for the X direction |
|fBodyAccJerk.std.Y |The Standard Deviation of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain for the Y direction |
|fBodyAccJerk.std.Z |The Standard Deviation of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain for the Z direction |
|fBodyAccJerk.meanFreq.X |The Mean of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain for the X direction |
|fBodyAccJerk.meanFreq.Y |The Mean of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain for the Y direction |
|fBodyAccJerk.meanFreq.Z |The Mean of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain for the Z direction |
|fBodyGyro.mean.X |The Mean of Body Acceleration measured by a Gyroscope in the frequency domain for the X direction |
|fBodyGyro.mean.Y |The Mean of Body Acceleration measured by a Gyroscope in the frequency domain for the Y direction |
|fBodyGyro.mean.Z |The Mean of Body Acceleration measured by a Gyroscope in the frequency domain for the Z direction |
|fBodyGyro.std.X |The Standard Deviation of Body Acceleration measured by a Gyroscope in the frequency domain for the X direction |
|fBodyGyro.std.Y |The Standard Deviation of Body Acceleration measured by a Gyroscope in the frequency domain for the Y direction |
|fBodyGyro.std.Z |The Standard Deviation of Body Acceleration measured by a Gyroscope in the frequency domain for the Z direction |
|fBodyGyro.meanFreq.X |The Mean of Body Acceleration measured by a Gyroscope in the frequency domain for the X direction |
|fBodyGyro.meanFreq.Y |The Mean of Body Acceleration measured by a Gyroscope in the frequency domain for the Y direction |
|fBodyGyro.meanFreq.Z |The Mean of Body Acceleration measured by a Gyroscope in the frequency domain for the Z direction |
|fBodyAccMag.mean |The Mean of Magnitude of Body Acceleration measured by an Accelerometer in the frequency domain |
|fBodyAccMag.std |The Standard Deviation of Magnitude of Body Acceleration measured by an Accelerometer in the frequency domain |
|fBodyAccMag.meanFreq |The Mean of Magnitude of Body Acceleration measured by an Accelerometer in the frequency domain |
|fBodyBodyAccJerkMag.mean |The Mean of Magnitude of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain |
|fBodyBodyAccJerkMag.std |The Standard Deviation of Magnitude of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain |
|fBodyBodyAccJerkMag.meanFreq |The Mean of Magnitude of Jerk of Body Acceleration measured by an Accelerometer in the frequency domain |
|fBodyBodyGyroMag.mean |The Mean of Magnitude of Body Acceleration measured by a Gyroscope in the frequency domain |
|fBodyBodyGyroMag.std |The Standard Deviation of Magnitude of Body Acceleration measured by a Gyroscope in the frequency domain |
|fBodyBodyGyroMag.meanFreq |The Mean of Magnitude of Body Acceleration measured by a Gyroscope in the frequency domain |
|fBodyBodyGyroJerkMag.mean |The Mean of Magnitude of Jerk of Body Acceleration measured by a Gyroscope in the frequency domain |
|fBodyBodyGyroJerkMag.std |The Standard Deviation of Magnitude of Jerk of Body Acceleration measured by a Gyroscope in the frequency domain |
|fBodyBodyGyroJerkMag.meanFreq |The Mean of Magnitude of Jerk of Body Acceleration measured by a Gyroscope in the frequency domain |
|subject|The code of the volunteer that performed the activity, it is a an integer between 1 and 30.|
|activity| Description of the activity performed. It is a string of characters (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING)|


