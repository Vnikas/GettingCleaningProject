
#read files
library(reshape2)
test_data       <- read.table("./test/X_test.txt")
train_data      <- read.table("./train/X_train.txt")
act_lab         <- read.table("activity_labels.txt")
test_act        <- read.table("./test/y_test.txt")
train_act       <- read.table("./train/y_train.txt")
test_sub        <- read.table("./test/subject_test.txt")
train_sub       <- read.table("./train/subject_train.txt")


# 1. Merge the training and the test sets to create one data set

values <- rbind(test_data,train_data)
act_codes <- rbind(test_act,train_act)
subj <- rbind(test_sub,train_sub)

total_data <- cbind(values, act_codes,subj)
n <- dim(total_data)[2]
 
# 2. Extracts only the measurements on the mean 
# and standard deviation for each measurement. 

# Read features.txt to find mean and sd measurements
feat_data <- read.table("features.txt")
feat_ind <- grep("mean()|std()",feat_data$V2)
m <- length(feat_ind)

# Create a dataset with just the measurements on the mean and sd
# without changing the last 2 cols (subject, activity code)
ds1 <- total_data[,c(feat_ind, (n-1):n)]

# 3. Use descriptive activity names to name the activities in the data set

# Will merge ds1 with act_lab that contains activity codes and their description
# First i give appropriate names to make merging easier

names(act_lab) <- c("code","activity")
names(ds1)[(m+1):(m+2)] <- c("code","subject")

# Finally merge and remove the col with the activity codes which is useless

ds1 <- merge(ds1,act_lab,by = "code", sort = FALSE)
ds1 <- ds1[,2:(m+3)]

# 4. Appropriately labels the data set with descriptive variable names

# Use features.txt to replace labels with descriptive variable names 
# Use the gsub to make them syntactically valid (remove parentheses, replace "-")

v_names <- gsub("[()]", "", as.character(feat_data$V2[feat_ind])) 
v_names <- gsub("[-]", ".", v_names)

names(ds1)[1:m] <- v_names

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# Mean of all variables for each activity and subject

ds2 <- aggregate(ds1[,1:m], by = list(ds1$subject, ds1$activity ), FUN = "mean")

# Rename the first colums

names(ds2)[1:2] <- c("subject", "activity")

ds2 <- ds2[order(ds2$subject), ]

# Create txt file

write.table(ds2, "project.txt", row.names =F )



