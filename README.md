# Getting-and-Cleaning-the-Data

=========================================================================================================


## Introduction

The data of this project comes from a series of experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS,  WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II), which records data with its embedded accelerometer and gyroscope. Given the raw data, the aim of the project is to prepare tidy data that can be used for later analysis. 


## Raw Data
The raw data for the project can be found in **UCI HAR Dataset** in this repo. Besides, you can click [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to download from the original website.


## Specific Files Used in Processing
**Train file**       
    1.X_train.txt: Training data set contains 70% of subjects.    
    2.y_train.txt: The label number in training data set means six activities.     
    3.subject_train.txt : Subject ID for training data set.     

**Test file**        
    1.X_test.txt: Test data set contains 30% of subjects.     
    2.y_test.txt: The label number in test data set means six activities.      
    3.subject_test.txt: Subject ID for test data set.     

**features.txt**         
    List of all features.

**activity_labels.txt**        
    Links the class labels with their activity name.


## Data Processing
Data Processing involves 5 steps as follows.   
1. Merges the training and the test sets to create one data set.     
2. Extracts only the measurements on the mean and standard deviation for each measurement.      
3. Uses descriptive activity names to name the activities in the data set.     
4. Appropriately labels the data set with descriptive variable names.     
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.            
The R code for data prosessing is stored as **run_analysis.R** and processed dataset is stored as **processed_data.txt**.


## Code Book
**codebook.md** Describes each varible and its values in the **processed_data.txt**. 
