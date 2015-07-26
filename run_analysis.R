##=============================================
## Getting and Cleaning Data Course Project
##=============================================

## =============
## Load the raw data

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")


## =============
## Step 1. Merges the training and the test sets into one dataset

x_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject <- rbind(sub_train, sub_test)


## =============
## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement

### Load "features" dataset
features <- read.table("UCI HAR Dataset/features.txt")

### Extract the data only including "mean" and "std".
features_data <- grep("mean\\(\\)|std\\(\\)", features[,2])

### Check how many variables
length(features_data) 
## 66 variables in features_data

### Subset data columns only including "mean" and "std"
data_mean_std <- x_data[,features_data]

### Subset variable name only including "mean" and "std"
var <- features[features_data,]

names(var) <- c("ID", "Variable")


## ============
## Step 3. Appropriately labels the data set with descriptive variable names

library(dplyr)
var <- var %>%
      mutate(Variable = gsub("-mean\\(\\)", "_mean", Variable),
             Variable = gsub("-std\\(\\)", "_std", Variable),
             Variable = gsub("-","_", Variable),
             Variable = gsub("^t","Time_", Variable),
             Variable = gsub("^f","Frequency_", Variable),
             Variable = gsub("BodyBody","Body", Variable))

names(data_mean_std) <- var[,2]



## ============
## Step 4. Uses descriptive activity names to name the activities in the data set

### Load "activity" dataset
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

### Rename appropriate column name
names(activity_labels) <- c("ID", "Activity")
names(y_data)[1] <- "ID"
names(subject)[1] <- "Subject_Id"

### Replace with descriptive activity names
Activity <- y_data %>%
      left_join(activity_labels, by = "ID") %>%
      select(Activity)

### Create a complete dataset including subject, activity and records  
complete_data <- cbind(subject, Activity, data_mean_std)


## ============
## Step 5.From the data set in step 4, creates a second, independent tidy data set with 
## the average of each variable for each activity and each subject


processed_data <- complete_data %>%
      group_by(Subject_Id, Activity) %>%
      summarise_each(funs(mean))

write.table(processed_data, "processed_data.txt", row.name = FALSE, sep="\t")
