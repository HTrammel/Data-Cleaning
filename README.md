# Data-Cleaning
Project repository for Coursera "Getting and Cleaning Data"

## Course Project Description
As stated in the assignment:

>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
>
> 1. a tidy data set as described below, 
> 2. a link to a Github repository with your script for performing the analysis, and 
> 3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
> 
> You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
> 
> One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

> Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

> You should create one R script called run_analysis.R that does the following. 
 
> * Merges the training and the test sets to create one data set.
> * Extracts only the measurements on the mean and standard deviation for each measurement. 
> * Uses descriptive activity names to name the activities in the data set
> * Appropriately labels the data set with descriptive variable names. 
> * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
>

## Project Notes

One of the challenges of this exercise was deciding what "tidy data" meant.  After experimenting with the "wide" approach, I chose to go with the "long" approach, i.e. fewer columns and more rows.  While this meant more work, I found it easier to understant the resulting data. 

My second biggest challenge was translating the feature terms and matching them to the data. I experimented with splitting the translated terms into separate columns, but was not satisfied with my results.

I chose to include the process to retrieve and unzip the source data within my script.  This may not be considered necessary but I wanted everything in one script.

## What the Script does

The script first loads the dplyr, tidyr, reshape2, and stringr libraries.

I then get the zipped files from the source and unzip them into the data folder without subfolders

The next major process was to clean up the variable names by modifying the data from the feature.txt file.  

1. I first read the feature.txt into a table.  
2. I created a character vector that will match the 561 automatically assigned variables in the X_test and X_train files.  
3. I then add the character vector from #2 as a new column (cid). 
4. 1 extracted a subset consisting of the new column and the V2 (measure) columne.
5. Because there was an naming inconsistency in the feature list provided, I replaced the instances of "BodyBody" with "Body".
6. I then began preparing the feature name for further translation. To do this, the loaded feature name is split into "measure", "aggregation", and "axis" based on original hyphenation.  
7. I removed the parenthesis "()" from the aggregation column.
8. I next create a character vector from the "measure" column.
9. Using this as a starting point, I created a translation table as described in the CodeBook. The translated measures were then used in a second character vector.
10. I created a data frame from the orignal "measure" vector and the translated measure vector.
11. I then used an inner join matching the original measure vector in the data frame to the features table measure column.
12. A new easier to understand measure variable was created by pasting the translated measure, aggregation, and axis columns using a hyphen separator.
13. A new features table was created by selecting the cid, V2, and new measure columns. 

The script simply reads the activity_labels.txt file into a table (actv_lbl) and renames the V2 column as activity.

The core major processes were dealing with the training and test data. For each set of data, the following process was followed. 

1. The subject_test.txt file was read into a character vector (s_[test|train]) and the column was renamed subject.
2. The y_[train|test].txt file was read into a table data frame (y_[train|test]).
3. The actv_lbl table was inner joined to the y_[test|train] table on the "V1" column.
4. An activity character vector was created by extracting the y_[test|train]$activity column.
5. The x_[test|train].txt file was read into a table data frame (x_[test|train]).
6. The s_[test|train] subject column and the activity vector were bound as new columns to the x_[test|train] table.
7. The x_[test|train] table was melted using the "subject" and "activity" columns as id, "cid" as the variable name, and "value" as the value name.
8. The features table was joined to the x_[test|train] table on the "cid" columns.
9. The subject, activity, measure, and value columns were extracted.
10. The mean and standard deviation measures were filtered for processing.  It should be noted that some of the measures have "mean" in the name but are not actually means.  For example, see the angle domain measures.  To select only the actual mean and std measures the filter terms used were "-mean-" and "-std-".

The rows from the test and training were bound together and the resulting set was used for the final processing. It should be noted that this total data set included only mean and standard deviation measures.  This data set was grouped by "subject", "activity", and "measure" and then summarised to find the mean of the "value" and a second tidy data set was the result.

The final step was to use write.table (with row.names=FALSE) to write the second tidy data set to the file: "HRA_data_average.txt".


## Known Issues

When the script is run, the following warnings occur at this time:

```
Warning messages:
1: joining character vector and factor, coercing into character vector 
2: joining factors with different levels, coercing to character vector 
3: joining factors with different levels, coercing to character vector
```

As far as I can tell, the results are ok.  