#
# Run_Analysis.R
#______________________________________________________________
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, 
#    creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.
#______________________________________________________________
library(dplyr)
library(tidyr)

if(!file.exists("./data")) {dir.create("./data")}

sourceFile <- "UCI_HAR_Dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("UCI_HAR_Dataset.zip")) {
    download.file(fileURL,destfile=sourceFile)
    unzip(sourceFile,exdir="./data",junkpaths=TRUE)
}

actv_lbl <- read.table("./data/activity_labels.txt") 
actv_lbl <- rename(actv_lbl, activity = V2)

features <- read.table("./data/features.txt") 
features <- rename(features, measure = V2)

# Read the test files
stest <- read.table("./data/subject_test.txt", col.name="subject") %>% tbl_df()
ytest <- read.table("./data/y_test.txt") %>% tbl_df() %>% inner_join(actv_lbl,by="V1")

testd <- cbind(stest, ytest[2])

xtest <- read.table("./data/X_test.txt", col.names=features$measure) %>% tbl_df() 
testd <- bind_cols(testd, xtest)

# Read the train files
strain <- read.table("./data/subject_train.txt", col.name="subject") %>% tbl_df()
ytrain <- read.table("./data/y_train.txt") %>% tbl_df() %>% inner_join(actv_lbl,by="V1")

traind <- cbind(strain, ytrain[2])

xtrain <- read.table("./data/X_train.txt", col.names=features$measure) %>% tbl_df() 
traind <- bind_cols(traind, xtrain)
