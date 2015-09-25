


#GettingCleaningProject



> In this repository one can find a method to clean data of an experiment (more info  [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))


The repo contains:

+ An R script that was used to clean raw data (run_analysis.R)
+ A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data (OrderBook.Rmd)

---

##Instructions:


1. Download raw data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Set ".../UCI HAR Dataset" as the working directory.
3. Run *run_analysis.R*.  

The script will create a txt file with a tidy dataset.

I have tried the above steps for several times (in Windows OS), always with the same results.

---

##What does the script do:

run_analysis.R that does the following: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
6. Finally it creates a txt file with the final dataset
