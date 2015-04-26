#--------------------------------------------------------------
# Run_Analysis.R
#______________________________________________________________
# Assumes all data in ./data folder
#
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
library(stringr)

# Get the zipped files from the source and unzip them into the data folder without subfolders
if(!file.exists("./data")) {dir.create("./data")}

sourceFile <- "UCI_HAR_Dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("UCI_HAR_Dataset.zip")) {
    download.file(fileURL,destfile=sourceFile)
    unzip(sourceFile,exdir="./data",junkpaths=TRUE)
}

#----------------------------------------------------
# Process Features Valuse to Clean Up Variable Names
#----------------------------------------------------

# read file into table
features <- read.table("./data/features.txt") 

# create a character vector that will match the 561 automatically 
# assigned variables in the X_test and X_train files
cid <- paste("V",1:561, sep="")

# initial features table processing
# The goal of this section is prepare the feature name for further translation.
# To do this, the feature name is split into "measure", "aggregation", 
# and "axis" based on original hyphenation.  This also allows the easier removal
# of parenthesis in the aggregation component.
features <- features %>% 
    cbind(cid) %>% # adds column to match to column names in the X_test & X_train tables
    select(cid, V2) %>% # extract subset for further processing
    mutate(newlabel = str_replace_all(V2, "BodyBody", "Body")) %>% # correct error in original
    separate(newlabel, c("measure","aggregation","axis"), sep="-", extra="merge") %>% # split by hyphen
    mutate(newagg =  str_replace_all(aggregation, "[()]+", "")) %>% # remove "()" from aggregation
    rename(oldagg = aggregation, aggregation = newagg) # rename things for future processing

#Create a character vector of original Feature terms with the aggregation and matrix stripped off.
#Note this list was crteated using output from the procesing above.
orig <- c("tBodyAcc",
          "tGravityAcc",
          "tBodyAccJerk",
          "tBodyGyro",
          "tBodyGyroJerk",
          "tBodyAccMag",
          "tGravityAccMag",
          "tBodyAccJerkMag",
          "tBodyGyroMag",
          "tBodyGyroJerkMag",
          "fBodyAcc",
          "fBodyAccJerk",
          "fBodyGyro",
          "fBodyAccMag",
          "fBodyAccJerkMag",
          "fBodyGyroMag",
          "fBodyGyroJerkMag",
          "angle(tBodyAccMean,gravity)",
          "angle(tBodyAccJerkMean),gravityMean)",
          "angle(tBodyGyroMean,gravityMean)",
          "angle(tBodyGyroJerkMean,gravityMean)",
          "angle(X,gravityMean)",
          "angle(Y,gravityMean)",
          "angle(Z,gravityMean)")

# Create a character vector of my translation of the original terms.  See codebook for translation approach.
trn <- c("time-body-accelerometer",
         "time-gravity-accelerometer",
         "time-body-accelerometer-jerk",
         "time-body-gyroscope",
         "time-body-gyroscope-jerk",
         "time-body-accelerometer-magnitude",
         "time-gravity-accelerometer-magnitude",
         "time-body-accelerometer-jerk-magnitude",
         "time-body-gyroscope-magnitude",
         "time-body-gyroscope-jerk-magnitude",
         "frequency-body-accelerometer",
         "frequency-body-accelerometer-jerk",
         "frequency-body-gyroscope",
         "frequency-body-accelerometer-magnitude",
         "frequency-body-accelerometer-jerk-magnitude",
         "frequency-body-gyroscope-magnitude",
         "frequency-body-gyroscope-jerk-magnitude",
         "angle-tBodyAccMean-gravityMean",
         "angle-tBodyAccJerkMean-gravityMean",
         "angle-tBodyGyroMean-gravityMean",
         "angle-tBodyGyroJerkMean-gravityMean",
         "angle-X-gravityMean",
         "angle-Y-gravityMean",
         "angle-Z-gravityMean")

# create a data data.frame from the two character vectors to use for translation
trex <- data.frame(cbind(orig, trn))
names(trex) <- c("measure","translation") # rename for matching purposes.

# final features processing, to include translation and putting measure terms back together
features <- inner_join(features, trex, by = "measure") %>% # inner join to add translation terms to features
    rename(old = measure, measure = translation) %>% # rename for future use
    mutate(m = paste(measure, aggregation, axis, sep="-")) %>% # put translated measure term 
    rename(old2 = measure, measure = m) %>% # rename for future use
    select(cid, V2, measure) # keep the variable key, old term, and new measure term


#----------------------------------------------------
# Process Activity Labelx
#----------------------------------------------------

# simple read and rename process
actv_lbl <- read.table("./data/activity_labels.txt") 
actv_lbl <- rename(actv_lbl, activity = V2)

#----------------------------------------------------
# Process test data 
#
# This will assign activity labels, convert to long approach, and assign measurement labels
#----------------------------------------------------

# Read the subject_test.txt file into create tables. Assign "subject" to column name
s_test <- read.table("./data/subject_test.txt", col.name="subject")

# Read the y_test file (subject and activity) data and join the activity lables to the activities.
y_test <- read.table("./data/y_test.txt") %>% tbl_df() %>% inner_join(actv_lbl,by="V1") 
activity <- as.character(y_test$activity) # extract the joined activity labels for later use

# Read the X_test file.  Note the columns are automatically assigned V1...V561
x_test <- read.table("./data/X_test.txt") %>% tbl_df() 

# The major processing of the test data
test_d <- cbind(s_test, activity, x_test) %>% # add subject and activity values to test data
    melt(id = c("subject","activity"), variable.name = "cid", value.name="value") %>% # melt to go long form
    inner_join(features, by = "cid") %>% # join the features terms to the long form. 
    select(subject, activity, measure, value) %>% # pull out the four desired columns
    filter(str_detect(measure,fixed("-mean-")) | str_detect(measure,fixed("-std-"))) # filter to get mean % std

#----------------------------------------------------
# Process train data 
#
# This will assign activity labels, convert to long approach, and assign measurement labels
#----------------------------------------------------

# Read the subject_train.txt file into create tables. Assign "subject" to column name
s_train <- read.table("./data/subject_train.txt", col.name="subject")

# Read the y_train file (subject and activity) data and join the activity lables to the activities.
y_train <- read.table("./data/y_train.txt") %>% tbl_df() %>% inner_join(actv_lbl,by="V1")
activity <- as.character(y_train$activity) # extract the joined activity labels for later use

# Read the X_train.txt file.  Note the columns are automatically assigned V1...V561
x_train <- read.table("./data/X_train.txt") %>% tbl_df() 

# The major processing of the test data
train_d <- cbind(s_train, activity, x_train) %>% # add subject and activity values to train data
    melt(id = c("subject","activity"), variable.name = "cid", value.name="value") %>% # melt to go long form
    inner_join(features, by = "cid") %>% # join the features terms to the long form. 
    select(subject, activity, measure, value) %>% # pull out the four desired columns
    filter(str_detect(measure,fixed("-mean-")) | str_detect(measure,fixed("-std-"))) # filter to get mean % std

#----------------------------------------------------
# Create the desired output of two tidy data files
#----------------------------------------------------
# merge the two data frames
data_1 <- rbind(test_d, train_d)

# determine mean by subject, activity, and measure
data_2 <- data_1 %>% group_by(subject, activity, measure) %>% summarise(avg = mean(value))

# write output files
# write.table(data_1, file="HRA_data_mean_std_data.txt", row.names=FALSE)
write.table(data_2, file="HRA_data_average.txt", row.names=FALSE)

