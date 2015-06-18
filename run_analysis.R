library(stats)
library(utils)

#1. Merges the training and the test sets to create one data set.

#Create measurement data set

X_test <- read.table("test/X_test.txt")
X_train <- read.table("train/X_train.txt")
measurement <- rbind(X_train, X_test)

#Create activity code data set

y_test <- read.table("test/y_test.txt")
y_train <- read.table("train/y_train.txt")
activitycode <- rbind(y_test, y_train)

#Create subject data set

subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject <- rbind(subject_test, subject_train)

#2. Extracts only the measurements involving mean and standard 
#deviations. 

#Labels dataset columns with appropriate measurement

features <- read.table("features.txt")
varnames <- features[,2]
colnames(measurement) <- varnames

#Selects data related to mean or standard deviation only

meanstd_only <- grep("mean|std", varnames)
datameanstd <- measurement[,meanstd_only]
  
#3. Uses descriptive activity names to name the activities in 
#the data set

#Update activity codes with activity labels

activity_labels <- read.table("activity_labels.txt")
activitycode[,1] <- activity_labels[activitycode[,1],2]

#4. Appropriately labels the data set with descriptive variable 
#names. 
 
#Merge subject, activity code, and measurement data sets

fulldata <- cbind(subject, activitycode, measurement)
  
#Label subject and activity columns (measurements labeled in 
#step 2 above )

colnames(fulldata)[1:2] <- c("subject", "activity")

#5. From the data set in step 4, creates a second, independent 
#tidy data set with the average of each variable for each 
#activity and each subject.

#Compute mean per activity per person in the study

tidydata <- aggregate(fulldata, by=list(activity = fulldata$activity,
subject = fulldata$subject), FUN = mean)

#Remove duplicate activity and subject columns from result

tidydatafinal <- tidydata[,-3:-4]

#Write table containing tidy dataset
  
write.table(tidydatafinal, file ="tidydata.txt", row.names = FALSE,
sep = " ")
