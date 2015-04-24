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
library(reshape2)

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
features <- rename(features, id = V1, measure = V2)

# Read the test files
x_test <- read.table("./data/X_test.txt", col.names=features$measure) %>% tbl_df() 
s_test <- read.table("./data/subject_test.txt", col.name="subject") %>% tbl_df()
y_test <- read.table("./data/y_test.txt") %>% tbl_df() %>% inner_join(actv_lbl,by="V1")

test_d <- s_test %>% 
    cbind(y_test[2], x_test) 

