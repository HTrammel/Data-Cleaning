---
title: "CodeBook.md"
author: "Harold Trammel"
date: "Monday, April 20, 2015"
output: html_document
---
##Purpose of the Project

The purpose of this project is to collect, work with, and clean a data set of measuremeents made with Samsung smartphonne. The goal is to prepare tidy data that can be used for later analysis.  

The original data includes a training set and a test set.  The overall study data should be the combination of these two data sets.  From this combined data, two sets of tidy data are desired: 

1. An extract of only the measurements on the mean and standard deviation for each measurement
2. Using extract #1, product an extract with average of each variable for each activity and each subject.

##Source Data
The source data files were retrieved as a single zip file via http using the URL link provided in the instructions.  The downloaded file was saved as ```"UCI_HAR_Dataset.zip"``` and subsquently unzipped into the data directory without retaining the zip file's internal directory structure.  The decision to flatten the data directory was made after confirming that none of the files in the archive subdirectories had the same names as any other file in the archive.

The source data files included the following documentation files:

* README.txt
* features-info.txt

The contents of these files have been included at the end of this codebook for additional reference about how the study that produced these data was conducted.  These documents also explain the meaning of the various 



##Activity Labels
The **Activity** labels were provided in the *activity_labels.txt* file provided in the zipped source files.  These labels were considered to be adquate to describe the results.  The **V2** column name was changed to **activity** as the data was read from the file.

##Feature Data
The core data are recorded as 561 feature variables.  The source data included the following feature documentation:

* *features.text* that contains a list of all the features labels
* *features_info.txt* that provided more detail about how the measures were made and labeled. 

The *features_info.txt* describes this data as:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The feature labels are not particularly clear with out referring to the documentation.  To address this concern, these labels were translated into hopefully clearer terminology. The list of signal variables from the *feature_info.txt* was used as the basis this translation.

The values in the features.txt file were translated using the following key:

    t = time
    f = frequency
    Body = body
    Grav = gravity
    Acc = accelerometer
    Gyro = gyroscope
    Jerk = jerk
    Mag = Magnitude

The resulting components were joined using a hyphen.  In addion, the parenthesis in the features.txt values were eliminated.  The following table provides some examples of the translations.  The complete translation table is provided later in this document.

"features.txt" Value | Translated Value
tBodyGyroJerk-arCoeff()-X,1|time-body-gyroscope-jerk-arCoeff-X,1
tBodyAccJerkMag-min()|time-body-accelerometer-jerk-magnitude-min
fBodyAcc-bandsEnergy()-33,40|frequency-body-accelerometer-bandsEnergy-33,40

The data also include some features that had additional processing performed and were further used to calculate angle data.  These were not within the scope of this project as they were neither a *means* nor a *standard deviation*; thus these exclued from the data.

##Measurement Data
The original test and training data were arranged in a *wide* manner with 561 columns.  The data were transformed into a *long* format with a "measure" column and single value column.  The translated features values (see above) were used for the "measure" column values.

##Output Files
The requested data are provided in CSV format. 

* *HRA_data_mean_std_data.csv*: The extract of only the measurements on the mean and standard deviation for each measurement
* *HRA_data_average.csv*: The extract with average of each variable for each activity and each subject drawn from the above extract.


##Data Dictionary
```
SUBJECT
    Subject Code
        1-30 .Unique number for each subject

ACTIVITY
    Activity Term
        WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS
        SITTING
        STANDING
        LAYING

MEASURE    
    Measure Terminology    
		time-body-accelerometer-mean-X
		time-body-accelerometer-mean-Y
		time-body-accelerometer-mean-Z
		time-body-accelerometer-std-X
		time-body-accelerometer-std-Y
		time-body-accelerometer-std-Z
		time-gravity-accelerometer-mean-X
		time-gravity-accelerometer-mean-Y
		time-gravity-accelerometer-mean-Z
		time-gravity-accelerometer-std-X
		time-gravity-accelerometer-std-Y
		time-gravity-accelerometer-std-Z
		time-body-accelerometer-jerk-mean-X
		time-body-accelerometer-jerk-mean-Y
		time-body-accelerometer-jerk-mean-Z
		time-body-accelerometer-jerk-std-X
		time-body-accelerometer-jerk-std-Y
		time-body-accelerometer-jerk-std-Z
		time-body-gyroscope-mean-X
		time-body-gyroscope-mean-Y
		time-body-gyroscope-mean-Z
		time-body-gyroscope-std-X
		time-body-gyroscope-std-Y
		time-body-gyroscope-std-Z
		time-body-gyroscope-jerk-mean-X
		time-body-gyroscope-jerk-mean-Y
		time-body-gyroscope-jerk-mean-Z
		time-body-gyroscope-jerk-std-X
		time-body-gyroscope-jerk-std-Y
		time-body-gyroscope-jerk-std-Z
		time-body-accelerometer-magnitude-mean-NA
		time-body-accelerometer-magnitude-std-NA
		time-gravity-accelerometer-magnitude-mean-NA
		time-gravity-accelerometer-magnitude-std-NA
		time-body-accelerometer-jerk-magnitude-mean-NA
		time-body-accelerometer-jerk-magnitude-std-NA
		time-body-gyroscope-magnitude-mean-NA
		time-body-gyroscope-magnitude-std-NA
		time-body-gyroscope-jerk-magnitude-mean-NA
		time-body-gyroscope-jerk-magnitude-std-NA
		frequency-body-accelerometer-mean-X
		frequency-body-accelerometer-mean-Y
		frequency-body-accelerometer-mean-Z
		frequency-body-accelerometer-std-X
		frequency-body-accelerometer-std-Y
		frequency-body-accelerometer-std-Z
		frequency-body-accelerometer-jerk-mean-X
		frequency-body-accelerometer-jerk-mean-Y
		frequency-body-accelerometer-jerk-mean-Z
		frequency-body-accelerometer-jerk-std-X
		frequency-body-accelerometer-jerk-std-Y
		frequency-body-accelerometer-jerk-std-Z
		frequency-body-gyroscope-mean-X
		frequency-body-gyroscope-mean-Y
		frequency-body-gyroscope-mean-Z
		frequency-body-gyroscope-std-X
		frequency-body-gyroscope-std-Y
		frequency-body-gyroscope-std-Z
		frequency-body-accelerometer-magnitude-mean-NA
		frequency-body-accelerometer-magnitude-std-NA
		frequency-body-accelerometer-jerk-magnitude-mean-NA
		frequency-body-accelerometer-jerk-magnitude-std-NA
		frequency-body-gyroscope-magnitude-mean-NA
		frequency-body-gyroscope-magnitude-std-NA
		frequency-body-gyroscope-jerk-magnitude-mean-NA
		frequency-body-gyroscope-jerk-magnitude-std-NA

```
### Feature Translation Table

Key|Original Measure| Translated Measure
---|----------------|-------------------
V1|tBodyAcc-mean()-X|time-body-accelerometer-mean-X
V2|tBodyAcc-mean()-Y|time-body-accelerometer-mean-Y
V3|tBodyAcc-mean()-Z|time-body-accelerometer-mean-Z
V4|tBodyAcc-std()-X|time-body-accelerometer-std-X
V5|tBodyAcc-std()-Y|time-body-accelerometer-std-Y
V6|tBodyAcc-std()-Z|time-body-accelerometer-std-Z
V7|tBodyAcc-mad()-X|time-body-accelerometer-mad-X
V8|tBodyAcc-mad()-Y|time-body-accelerometer-mad-Y
V9|tBodyAcc-mad()-Z|time-body-accelerometer-mad-Z
V10|tBodyAcc-max()-X|time-body-accelerometer-max-X
V11|tBodyAcc-max()-Y|time-body-accelerometer-max-Y
V12|tBodyAcc-max()-Z|time-body-accelerometer-max-Z
V13|tBodyAcc-min()-X|time-body-accelerometer-min-X
V14|tBodyAcc-min()-Y|time-body-accelerometer-min-Y
V15|tBodyAcc-min()-Z|time-body-accelerometer-min-Z
V16|tBodyAcc-sma()|time-body-accelerometer-sma-NA
V17|tBodyAcc-energy()-X|time-body-accelerometer-energy-X
V18|tBodyAcc-energy()-Y|time-body-accelerometer-energy-Y
V19|tBodyAcc-energy()-Z|time-body-accelerometer-energy-Z
V20|tBodyAcc-iqr()-X|time-body-accelerometer-iqr-X
V21|tBodyAcc-iqr()-Y|time-body-accelerometer-iqr-Y
V22|tBodyAcc-iqr()-Z|time-body-accelerometer-iqr-Z
V23|tBodyAcc-entropy()-X|time-body-accelerometer-entropy-X
V24|tBodyAcc-entropy()-Y|time-body-accelerometer-entropy-Y
V25|tBodyAcc-entropy()-Z|time-body-accelerometer-entropy-Z
V26|tBodyAcc-arCoeff()-X,1|time-body-accelerometer-arCoeff-X,1
V27|tBodyAcc-arCoeff()-X,2|time-body-accelerometer-arCoeff-X,2
V28|tBodyAcc-arCoeff()-X,3|time-body-accelerometer-arCoeff-X,3
V29|tBodyAcc-arCoeff()-X,4|time-body-accelerometer-arCoeff-X,4
V30|tBodyAcc-arCoeff()-Y,1|time-body-accelerometer-arCoeff-Y,1
V31|tBodyAcc-arCoeff()-Y,2|time-body-accelerometer-arCoeff-Y,2
V32|tBodyAcc-arCoeff()-Y,3|time-body-accelerometer-arCoeff-Y,3
V33|tBodyAcc-arCoeff()-Y,4|time-body-accelerometer-arCoeff-Y,4
V34|tBodyAcc-arCoeff()-Z,1|time-body-accelerometer-arCoeff-Z,1
V35|tBodyAcc-arCoeff()-Z,2|time-body-accelerometer-arCoeff-Z,2
V36|tBodyAcc-arCoeff()-Z,3|time-body-accelerometer-arCoeff-Z,3
V37|tBodyAcc-arCoeff()-Z,4|time-body-accelerometer-arCoeff-Z,4
V38|tBodyAcc-correlation()-X,Y|time-body-accelerometer-correlation-X,Y
V39|tBodyAcc-correlation()-X,Z|time-body-accelerometer-correlation-X,Z
V40|tBodyAcc-correlation()-Y,Z|time-body-accelerometer-correlation-Y,Z
V41|tGravityAcc-mean()-X|time-gravity-accelerometer-mean-X
V42|tGravityAcc-mean()-Y|time-gravity-accelerometer-mean-Y
V43|tGravityAcc-mean()-Z|time-gravity-accelerometer-mean-Z
V44|tGravityAcc-std()-X|time-gravity-accelerometer-std-X
V45|tGravityAcc-std()-Y|time-gravity-accelerometer-std-Y
V46|tGravityAcc-std()-Z|time-gravity-accelerometer-std-Z
V47|tGravityAcc-mad()-X|time-gravity-accelerometer-mad-X
V48|tGravityAcc-mad()-Y|time-gravity-accelerometer-mad-Y
V49|tGravityAcc-mad()-Z|time-gravity-accelerometer-mad-Z
V50|tGravityAcc-max()-X|time-gravity-accelerometer-max-X
V51|tGravityAcc-max()-Y|time-gravity-accelerometer-max-Y
V52|tGravityAcc-max()-Z|time-gravity-accelerometer-max-Z
V53|tGravityAcc-min()-X|time-gravity-accelerometer-min-X
V54|tGravityAcc-min()-Y|time-gravity-accelerometer-min-Y
V55|tGravityAcc-min()-Z|time-gravity-accelerometer-min-Z
V56|tGravityAcc-sma()|time-gravity-accelerometer-sma-NA
V57|tGravityAcc-energy()-X|time-gravity-accelerometer-energy-X
V58|tGravityAcc-energy()-Y|time-gravity-accelerometer-energy-Y
V59|tGravityAcc-energy()-Z|time-gravity-accelerometer-energy-Z
V60|tGravityAcc-iqr()-X|time-gravity-accelerometer-iqr-X
V61|tGravityAcc-iqr()-Y|time-gravity-accelerometer-iqr-Y
V62|tGravityAcc-iqr()-Z|time-gravity-accelerometer-iqr-Z
V63|tGravityAcc-entropy()-X|time-gravity-accelerometer-entropy-X
V64|tGravityAcc-entropy()-Y|time-gravity-accelerometer-entropy-Y
V65|tGravityAcc-entropy()-Z|time-gravity-accelerometer-entropy-Z
V66|tGravityAcc-arCoeff()-X,1|time-gravity-accelerometer-arCoeff-X,1
V67|tGravityAcc-arCoeff()-X,2|time-gravity-accelerometer-arCoeff-X,2
V68|tGravityAcc-arCoeff()-X,3|time-gravity-accelerometer-arCoeff-X,3
V69|tGravityAcc-arCoeff()-X,4|time-gravity-accelerometer-arCoeff-X,4
V70|tGravityAcc-arCoeff()-Y,1|time-gravity-accelerometer-arCoeff-Y,1
V71|tGravityAcc-arCoeff()-Y,2|time-gravity-accelerometer-arCoeff-Y,2
V72|tGravityAcc-arCoeff()-Y,3|time-gravity-accelerometer-arCoeff-Y,3
V73|tGravityAcc-arCoeff()-Y,4|time-gravity-accelerometer-arCoeff-Y,4
V74|tGravityAcc-arCoeff()-Z,1|time-gravity-accelerometer-arCoeff-Z,1
V75|tGravityAcc-arCoeff()-Z,2|time-gravity-accelerometer-arCoeff-Z,2
V76|tGravityAcc-arCoeff()-Z,3|time-gravity-accelerometer-arCoeff-Z,3
V77|tGravityAcc-arCoeff()-Z,4|time-gravity-accelerometer-arCoeff-Z,4
V78|tGravityAcc-correlation()-X,Y|time-gravity-accelerometer-correlation-X,Y
V79|tGravityAcc-correlation()-X,Z|time-gravity-accelerometer-correlation-X,Z
V80|tGravityAcc-correlation()-Y,Z|time-gravity-accelerometer-correlation-Y,Z
V81|tBodyAccJerk-mean()-X|time-body-accelerometer-jerk-mean-X
V82|tBodyAccJerk-mean()-Y|time-body-accelerometer-jerk-mean-Y
V83|tBodyAccJerk-mean()-Z|time-body-accelerometer-jerk-mean-Z
V84|tBodyAccJerk-std()-X|time-body-accelerometer-jerk-std-X
V85|tBodyAccJerk-std()-Y|time-body-accelerometer-jerk-std-Y
V86|tBodyAccJerk-std()-Z|time-body-accelerometer-jerk-std-Z
V87|tBodyAccJerk-mad()-X|time-body-accelerometer-jerk-mad-X
V88|tBodyAccJerk-mad()-Y|time-body-accelerometer-jerk-mad-Y
V89|tBodyAccJerk-mad()-Z|time-body-accelerometer-jerk-mad-Z
V90|tBodyAccJerk-max()-X|time-body-accelerometer-jerk-max-X
V91|tBodyAccJerk-max()-Y|time-body-accelerometer-jerk-max-Y
V92|tBodyAccJerk-max()-Z|time-body-accelerometer-jerk-max-Z
V93|tBodyAccJerk-min()-X|time-body-accelerometer-jerk-min-X
V94|tBodyAccJerk-min()-Y|time-body-accelerometer-jerk-min-Y
V95|tBodyAccJerk-min()-Z|time-body-accelerometer-jerk-min-Z
V96|tBodyAccJerk-sma()|time-body-accelerometer-jerk-sma-NA
V97|tBodyAccJerk-energy()-X|time-body-accelerometer-jerk-energy-X
V98|tBodyAccJerk-energy()-Y|time-body-accelerometer-jerk-energy-Y
V99|tBodyAccJerk-energy()-Z|time-body-accelerometer-jerk-energy-Z
V100|tBodyAccJerk-iqr()-X|time-body-accelerometer-jerk-iqr-X
V101|tBodyAccJerk-iqr()-Y|time-body-accelerometer-jerk-iqr-Y
V102|tBodyAccJerk-iqr()-Z|time-body-accelerometer-jerk-iqr-Z
V103|tBodyAccJerk-entropy()-X|time-body-accelerometer-jerk-entropy-X
V104|tBodyAccJerk-entropy()-Y|time-body-accelerometer-jerk-entropy-Y
V105|tBodyAccJerk-entropy()-Z|time-body-accelerometer-jerk-entropy-Z
V106|tBodyAccJerk-arCoeff()-X,1|time-body-accelerometer-jerk-arCoeff-X,1
V107|tBodyAccJerk-arCoeff()-X,2|time-body-accelerometer-jerk-arCoeff-X,2
V108|tBodyAccJerk-arCoeff()-X,3|time-body-accelerometer-jerk-arCoeff-X,3
V109|tBodyAccJerk-arCoeff()-X,4|time-body-accelerometer-jerk-arCoeff-X,4
V110|tBodyAccJerk-arCoeff()-Y,1|time-body-accelerometer-jerk-arCoeff-Y,1
V111|tBodyAccJerk-arCoeff()-Y,2|time-body-accelerometer-jerk-arCoeff-Y,2
V112|tBodyAccJerk-arCoeff()-Y,3|time-body-accelerometer-jerk-arCoeff-Y,3
V113|tBodyAccJerk-arCoeff()-Y,4|time-body-accelerometer-jerk-arCoeff-Y,4
V114|tBodyAccJerk-arCoeff()-Z,1|time-body-accelerometer-jerk-arCoeff-Z,1
V115|tBodyAccJerk-arCoeff()-Z,2|time-body-accelerometer-jerk-arCoeff-Z,2
V116|tBodyAccJerk-arCoeff()-Z,3|time-body-accelerometer-jerk-arCoeff-Z,3
V117|tBodyAccJerk-arCoeff()-Z,4|time-body-accelerometer-jerk-arCoeff-Z,4
V118|tBodyAccJerk-correlation()-X,Y|time-body-accelerometer-jerk-correlation-X,Y
V119|tBodyAccJerk-correlation()-X,Z|time-body-accelerometer-jerk-correlation-X,Z
V120|tBodyAccJerk-correlation()-Y,Z|time-body-accelerometer-jerk-correlation-Y,Z
V121|tBodyGyro-mean()-X|time-body-gyroscope-mean-X
V122|tBodyGyro-mean()-Y|time-body-gyroscope-mean-Y
V123|tBodyGyro-mean()-Z|time-body-gyroscope-mean-Z
V124|tBodyGyro-std()-X|time-body-gyroscope-std-X
V125|tBodyGyro-std()-Y|time-body-gyroscope-std-Y
V126|tBodyGyro-std()-Z|time-body-gyroscope-std-Z
V127|tBodyGyro-mad()-X|time-body-gyroscope-mad-X
V128|tBodyGyro-mad()-Y|time-body-gyroscope-mad-Y
V129|tBodyGyro-mad()-Z|time-body-gyroscope-mad-Z
V130|tBodyGyro-max()-X|time-body-gyroscope-max-X
V131|tBodyGyro-max()-Y|time-body-gyroscope-max-Y
V132|tBodyGyro-max()-Z|time-body-gyroscope-max-Z
V133|tBodyGyro-min()-X|time-body-gyroscope-min-X
V134|tBodyGyro-min()-Y|time-body-gyroscope-min-Y
V135|tBodyGyro-min()-Z|time-body-gyroscope-min-Z
V136|tBodyGyro-sma()|time-body-gyroscope-sma-NA
V137|tBodyGyro-energy()-X|time-body-gyroscope-energy-X
V138|tBodyGyro-energy()-Y|time-body-gyroscope-energy-Y
V139|tBodyGyro-energy()-Z|time-body-gyroscope-energy-Z
V140|tBodyGyro-iqr()-X|time-body-gyroscope-iqr-X
V141|tBodyGyro-iqr()-Y|time-body-gyroscope-iqr-Y
V142|tBodyGyro-iqr()-Z|time-body-gyroscope-iqr-Z
V143|tBodyGyro-entropy()-X|time-body-gyroscope-entropy-X
V144|tBodyGyro-entropy()-Y|time-body-gyroscope-entropy-Y
V145|tBodyGyro-entropy()-Z|time-body-gyroscope-entropy-Z
V146|tBodyGyro-arCoeff()-X,1|time-body-gyroscope-arCoeff-X,1
V147|tBodyGyro-arCoeff()-X,2|time-body-gyroscope-arCoeff-X,2
V148|tBodyGyro-arCoeff()-X,3|time-body-gyroscope-arCoeff-X,3
V149|tBodyGyro-arCoeff()-X,4|time-body-gyroscope-arCoeff-X,4
V150|tBodyGyro-arCoeff()-Y,1|time-body-gyroscope-arCoeff-Y,1
V151|tBodyGyro-arCoeff()-Y,2|time-body-gyroscope-arCoeff-Y,2
V152|tBodyGyro-arCoeff()-Y,3|time-body-gyroscope-arCoeff-Y,3
V153|tBodyGyro-arCoeff()-Y,4|time-body-gyroscope-arCoeff-Y,4
V154|tBodyGyro-arCoeff()-Z,1|time-body-gyroscope-arCoeff-Z,1
V155|tBodyGyro-arCoeff()-Z,2|time-body-gyroscope-arCoeff-Z,2
V156|tBodyGyro-arCoeff()-Z,3|time-body-gyroscope-arCoeff-Z,3
V157|tBodyGyro-arCoeff()-Z,4|time-body-gyroscope-arCoeff-Z,4
V158|tBodyGyro-correlation()-X,Y|time-body-gyroscope-correlation-X,Y
V159|tBodyGyro-correlation()-X,Z|time-body-gyroscope-correlation-X,Z
V160|tBodyGyro-correlation()-Y,Z|time-body-gyroscope-correlation-Y,Z
V161|tBodyGyroJerk-mean()-X|time-body-gyroscope-jerk-mean-X
V162|tBodyGyroJerk-mean()-Y|time-body-gyroscope-jerk-mean-Y
V163|tBodyGyroJerk-mean()-Z|time-body-gyroscope-jerk-mean-Z
V164|tBodyGyroJerk-std()-X|time-body-gyroscope-jerk-std-X
V165|tBodyGyroJerk-std()-Y|time-body-gyroscope-jerk-std-Y
V166|tBodyGyroJerk-std()-Z|time-body-gyroscope-jerk-std-Z
V167|tBodyGyroJerk-mad()-X|time-body-gyroscope-jerk-mad-X
V168|tBodyGyroJerk-mad()-Y|time-body-gyroscope-jerk-mad-Y
V169|tBodyGyroJerk-mad()-Z|time-body-gyroscope-jerk-mad-Z
V170|tBodyGyroJerk-max()-X|time-body-gyroscope-jerk-max-X
V171|tBodyGyroJerk-max()-Y|time-body-gyroscope-jerk-max-Y
V172|tBodyGyroJerk-max()-Z|time-body-gyroscope-jerk-max-Z
V173|tBodyGyroJerk-min()-X|time-body-gyroscope-jerk-min-X
V174|tBodyGyroJerk-min()-Y|time-body-gyroscope-jerk-min-Y
V175|tBodyGyroJerk-min()-Z|time-body-gyroscope-jerk-min-Z
V176|tBodyGyroJerk-sma()|time-body-gyroscope-jerk-sma-NA
V177|tBodyGyroJerk-energy()-X|time-body-gyroscope-jerk-energy-X
V178|tBodyGyroJerk-energy()-Y|time-body-gyroscope-jerk-energy-Y
V179|tBodyGyroJerk-energy()-Z|time-body-gyroscope-jerk-energy-Z
V180|tBodyGyroJerk-iqr()-X|time-body-gyroscope-jerk-iqr-X
V181|tBodyGyroJerk-iqr()-Y|time-body-gyroscope-jerk-iqr-Y
V182|tBodyGyroJerk-iqr()-Z|time-body-gyroscope-jerk-iqr-Z
V183|tBodyGyroJerk-entropy()-X|time-body-gyroscope-jerk-entropy-X
V184|tBodyGyroJerk-entropy()-Y|time-body-gyroscope-jerk-entropy-Y
V185|tBodyGyroJerk-entropy()-Z|time-body-gyroscope-jerk-entropy-Z
V186|tBodyGyroJerk-arCoeff()-X,1|time-body-gyroscope-jerk-arCoeff-X,1
V187|tBodyGyroJerk-arCoeff()-X,2|time-body-gyroscope-jerk-arCoeff-X,2
V188|tBodyGyroJerk-arCoeff()-X,3|time-body-gyroscope-jerk-arCoeff-X,3
V189|tBodyGyroJerk-arCoeff()-X,4|time-body-gyroscope-jerk-arCoeff-X,4
V190|tBodyGyroJerk-arCoeff()-Y,1|time-body-gyroscope-jerk-arCoeff-Y,1
V191|tBodyGyroJerk-arCoeff()-Y,2|time-body-gyroscope-jerk-arCoeff-Y,2
V192|tBodyGyroJerk-arCoeff()-Y,3|time-body-gyroscope-jerk-arCoeff-Y,3
V193|tBodyGyroJerk-arCoeff()-Y,4|time-body-gyroscope-jerk-arCoeff-Y,4
V194|tBodyGyroJerk-arCoeff()-Z,1|time-body-gyroscope-jerk-arCoeff-Z,1
V195|tBodyGyroJerk-arCoeff()-Z,2|time-body-gyroscope-jerk-arCoeff-Z,2
V196|tBodyGyroJerk-arCoeff()-Z,3|time-body-gyroscope-jerk-arCoeff-Z,3
V197|tBodyGyroJerk-arCoeff()-Z,4|time-body-gyroscope-jerk-arCoeff-Z,4
V198|tBodyGyroJerk-correlation()-X,Y|time-body-gyroscope-jerk-correlation-X,Y
V199|tBodyGyroJerk-correlation()-X,Z|time-body-gyroscope-jerk-correlation-X,Z
V200|tBodyGyroJerk-correlation()-Y,Z|time-body-gyroscope-jerk-correlation-Y,Z
V201|tBodyAccMag-mean()|time-body-accelerometer-magnitude-mean-NA
V202|tBodyAccMag-std()|time-body-accelerometer-magnitude-std-NA
V203|tBodyAccMag-mad()|time-body-accelerometer-magnitude-mad-NA
V204|tBodyAccMag-max()|time-body-accelerometer-magnitude-max-NA
V205|tBodyAccMag-min()|time-body-accelerometer-magnitude-min-NA
V206|tBodyAccMag-sma()|time-body-accelerometer-magnitude-sma-NA
V207|tBodyAccMag-energy()|time-body-accelerometer-magnitude-energy-NA
V208|tBodyAccMag-iqr()|time-body-accelerometer-magnitude-iqr-NA
V209|tBodyAccMag-entropy()|time-body-accelerometer-magnitude-entropy-NA
V210|tBodyAccMag-arCoeff()1|time-body-accelerometer-magnitude-arCoeff1-NA
V211|tBodyAccMag-arCoeff()2|time-body-accelerometer-magnitude-arCoeff2-NA
V212|tBodyAccMag-arCoeff()3|time-body-accelerometer-magnitude-arCoeff3-NA
V213|tBodyAccMag-arCoeff()4|time-body-accelerometer-magnitude-arCoeff4-NA
V214|tGravityAccMag-mean()|time-gravity-accelerometer-magnitude-mean-NA
V215|tGravityAccMag-std()|time-gravity-accelerometer-magnitude-std-NA
V216|tGravityAccMag-mad()|time-gravity-accelerometer-magnitude-mad-NA
V217|tGravityAccMag-max()|time-gravity-accelerometer-magnitude-max-NA
V218|tGravityAccMag-min()|time-gravity-accelerometer-magnitude-min-NA
V219|tGravityAccMag-sma()|time-gravity-accelerometer-magnitude-sma-NA
V220|tGravityAccMag-energy()|time-gravity-accelerometer-magnitude-energy-NA
V221|tGravityAccMag-iqr()|time-gravity-accelerometer-magnitude-iqr-NA
V222|tGravityAccMag-entropy()|time-gravity-accelerometer-magnitude-entropy-NA
V223|tGravityAccMag-arCoeff()1|time-gravity-accelerometer-magnitude-arCoeff1-NA
V224|tGravityAccMag-arCoeff()2|time-gravity-accelerometer-magnitude-arCoeff2-NA
V225|tGravityAccMag-arCoeff()3|time-gravity-accelerometer-magnitude-arCoeff3-NA
V226|tGravityAccMag-arCoeff()4|time-gravity-accelerometer-magnitude-arCoeff4-NA
V227|tBodyAccJerkMag-mean()|time-body-accelerometer-jerk-magnitude-mean-NA
V228|tBodyAccJerkMag-std()|time-body-accelerometer-jerk-magnitude-std-NA
V229|tBodyAccJerkMag-mad()|time-body-accelerometer-jerk-magnitude-mad-NA
V230|tBodyAccJerkMag-max()|time-body-accelerometer-jerk-magnitude-max-NA
V231|tBodyAccJerkMag-min()|time-body-accelerometer-jerk-magnitude-min-NA
V232|tBodyAccJerkMag-sma()|time-body-accelerometer-jerk-magnitude-sma-NA
V233|tBodyAccJerkMag-energy()|time-body-accelerometer-jerk-magnitude-energy-NA
V234|tBodyAccJerkMag-iqr()|time-body-accelerometer-jerk-magnitude-iqr-NA
V235|tBodyAccJerkMag-entropy()|time-body-accelerometer-jerk-magnitude-entropy-NA
V236|tBodyAccJerkMag-arCoeff()1|time-body-accelerometer-jerk-magnitude-arCoeff1-NA
V237|tBodyAccJerkMag-arCoeff()2|time-body-accelerometer-jerk-magnitude-arCoeff2-NA
V238|tBodyAccJerkMag-arCoeff()3|time-body-accelerometer-jerk-magnitude-arCoeff3-NA
V239|tBodyAccJerkMag-arCoeff()4|time-body-accelerometer-jerk-magnitude-arCoeff4-NA
V240|tBodyGyroMag-mean()|time-body-gyroscope-magnitude-mean-NA
V241|tBodyGyroMag-std()|time-body-gyroscope-magnitude-std-NA
V242|tBodyGyroMag-mad()|time-body-gyroscope-magnitude-mad-NA
V243|tBodyGyroMag-max()|time-body-gyroscope-magnitude-max-NA
V244|tBodyGyroMag-min()|time-body-gyroscope-magnitude-min-NA
V245|tBodyGyroMag-sma()|time-body-gyroscope-magnitude-sma-NA
V246|tBodyGyroMag-energy()|time-body-gyroscope-magnitude-energy-NA
V247|tBodyGyroMag-iqr()|time-body-gyroscope-magnitude-iqr-NA
V248|tBodyGyroMag-entropy()|time-body-gyroscope-magnitude-entropy-NA
V249|tBodyGyroMag-arCoeff()1|time-body-gyroscope-magnitude-arCoeff1-NA
V250|tBodyGyroMag-arCoeff()2|time-body-gyroscope-magnitude-arCoeff2-NA
V251|tBodyGyroMag-arCoeff()3|time-body-gyroscope-magnitude-arCoeff3-NA
V252|tBodyGyroMag-arCoeff()4|time-body-gyroscope-magnitude-arCoeff4-NA
V253|tBodyGyroJerkMag-mean()|time-body-gyroscope-jerk-magnitude-mean-NA
V254|tBodyGyroJerkMag-std()|time-body-gyroscope-jerk-magnitude-std-NA
V255|tBodyGyroJerkMag-mad()|time-body-gyroscope-jerk-magnitude-mad-NA
V256|tBodyGyroJerkMag-max()|time-body-gyroscope-jerk-magnitude-max-NA
V257|tBodyGyroJerkMag-min()|time-body-gyroscope-jerk-magnitude-min-NA
V258|tBodyGyroJerkMag-sma()|time-body-gyroscope-jerk-magnitude-sma-NA
V259|tBodyGyroJerkMag-energy()|time-body-gyroscope-jerk-magnitude-energy-NA
V260|tBodyGyroJerkMag-iqr()|time-body-gyroscope-jerk-magnitude-iqr-NA
V261|tBodyGyroJerkMag-entropy()|time-body-gyroscope-jerk-magnitude-entropy-NA
V262|tBodyGyroJerkMag-arCoeff()1|time-body-gyroscope-jerk-magnitude-arCoeff1-NA
V263|tBodyGyroJerkMag-arCoeff()2|time-body-gyroscope-jerk-magnitude-arCoeff2-NA
V264|tBodyGyroJerkMag-arCoeff()3|time-body-gyroscope-jerk-magnitude-arCoeff3-NA
V265|tBodyGyroJerkMag-arCoeff()4|time-body-gyroscope-jerk-magnitude-arCoeff4-NA
V266|fBodyAcc-mean()-X|frequency-body-accelerometer-mean-X
V267|fBodyAcc-mean()-Y|frequency-body-accelerometer-mean-Y
V268|fBodyAcc-mean()-Z|frequency-body-accelerometer-mean-Z
V269|fBodyAcc-std()-X|frequency-body-accelerometer-std-X
V270|fBodyAcc-std()-Y|frequency-body-accelerometer-std-Y
V271|fBodyAcc-std()-Z|frequency-body-accelerometer-std-Z
V272|fBodyAcc-mad()-X|frequency-body-accelerometer-mad-X
V273|fBodyAcc-mad()-Y|frequency-body-accelerometer-mad-Y
V274|fBodyAcc-mad()-Z|frequency-body-accelerometer-mad-Z
V275|fBodyAcc-max()-X|frequency-body-accelerometer-max-X
V276|fBodyAcc-max()-Y|frequency-body-accelerometer-max-Y
V277|fBodyAcc-max()-Z|frequency-body-accelerometer-max-Z
V278|fBodyAcc-min()-X|frequency-body-accelerometer-min-X
V279|fBodyAcc-min()-Y|frequency-body-accelerometer-min-Y
V280|fBodyAcc-min()-Z|frequency-body-accelerometer-min-Z
V281|fBodyAcc-sma()|frequency-body-accelerometer-sma-NA
V282|fBodyAcc-energy()-X|frequency-body-accelerometer-energy-X
V283|fBodyAcc-energy()-Y|frequency-body-accelerometer-energy-Y
V284|fBodyAcc-energy()-Z|frequency-body-accelerometer-energy-Z
V285|fBodyAcc-iqr()-X|frequency-body-accelerometer-iqr-X
V286|fBodyAcc-iqr()-Y|frequency-body-accelerometer-iqr-Y
V287|fBodyAcc-iqr()-Z|frequency-body-accelerometer-iqr-Z
V288|fBodyAcc-entropy()-X|frequency-body-accelerometer-entropy-X
V289|fBodyAcc-entropy()-Y|frequency-body-accelerometer-entropy-Y
V290|fBodyAcc-entropy()-Z|frequency-body-accelerometer-entropy-Z
V291|fBodyAcc-maxInds-X|frequency-body-accelerometer-maxInds-X
V292|fBodyAcc-maxInds-Y|frequency-body-accelerometer-maxInds-Y
V293|fBodyAcc-maxInds-Z|frequency-body-accelerometer-maxInds-Z
V294|fBodyAcc-meanFreq()-X|frequency-body-accelerometer-meanFreq-X
V295|fBodyAcc-meanFreq()-Y|frequency-body-accelerometer-meanFreq-Y
V296|fBodyAcc-meanFreq()-Z|frequency-body-accelerometer-meanFreq-Z
V297|fBodyAcc-skewness()-X|frequency-body-accelerometer-skewness-X
V298|fBodyAcc-kurtosis()-X|frequency-body-accelerometer-kurtosis-X
V299|fBodyAcc-skewness()-Y|frequency-body-accelerometer-skewness-Y
V300|fBodyAcc-kurtosis()-Y|frequency-body-accelerometer-kurtosis-Y
V301|fBodyAcc-skewness()-Z|frequency-body-accelerometer-skewness-Z
V302|fBodyAcc-kurtosis()-Z|frequency-body-accelerometer-kurtosis-Z
V303|fBodyAcc-bandsEnergy()-1,8|frequency-body-accelerometer-bandsEnergy-1,8
V304|fBodyAcc-bandsEnergy()-9,16|frequency-body-accelerometer-bandsEnergy-9,16
V305|fBodyAcc-bandsEnergy()-17,24|frequency-body-accelerometer-bandsEnergy-17,24
V306|fBodyAcc-bandsEnergy()-25,32|frequency-body-accelerometer-bandsEnergy-25,32
V307|fBodyAcc-bandsEnergy()-33,40|frequency-body-accelerometer-bandsEnergy-33,40
V308|fBodyAcc-bandsEnergy()-41,48|frequency-body-accelerometer-bandsEnergy-41,48
V309|fBodyAcc-bandsEnergy()-49,56|frequency-body-accelerometer-bandsEnergy-49,56
V310|fBodyAcc-bandsEnergy()-57,64|frequency-body-accelerometer-bandsEnergy-57,64
V311|fBodyAcc-bandsEnergy()-1,16|frequency-body-accelerometer-bandsEnergy-1,16
V312|fBodyAcc-bandsEnergy()-17,32|frequency-body-accelerometer-bandsEnergy-17,32
V313|fBodyAcc-bandsEnergy()-33,48|frequency-body-accelerometer-bandsEnergy-33,48
V314|fBodyAcc-bandsEnergy()-49,64|frequency-body-accelerometer-bandsEnergy-49,64
V315|fBodyAcc-bandsEnergy()-1,24|frequency-body-accelerometer-bandsEnergy-1,24
V316|fBodyAcc-bandsEnergy()-25,48|frequency-body-accelerometer-bandsEnergy-25,48
V317|fBodyAcc-bandsEnergy()-1,8|frequency-body-accelerometer-bandsEnergy-1,8
V318|fBodyAcc-bandsEnergy()-9,16|frequency-body-accelerometer-bandsEnergy-9,16
V319|fBodyAcc-bandsEnergy()-17,24|frequency-body-accelerometer-bandsEnergy-17,24
V320|fBodyAcc-bandsEnergy()-25,32|frequency-body-accelerometer-bandsEnergy-25,32
V321|fBodyAcc-bandsEnergy()-33,40|frequency-body-accelerometer-bandsEnergy-33,40
V322|fBodyAcc-bandsEnergy()-41,48|frequency-body-accelerometer-bandsEnergy-41,48
V323|fBodyAcc-bandsEnergy()-49,56|frequency-body-accelerometer-bandsEnergy-49,56
V324|fBodyAcc-bandsEnergy()-57,64|frequency-body-accelerometer-bandsEnergy-57,64
V325|fBodyAcc-bandsEnergy()-1,16|frequency-body-accelerometer-bandsEnergy-1,16
V326|fBodyAcc-bandsEnergy()-17,32|frequency-body-accelerometer-bandsEnergy-17,32
V327|fBodyAcc-bandsEnergy()-33,48|frequency-body-accelerometer-bandsEnergy-33,48
V328|fBodyAcc-bandsEnergy()-49,64|frequency-body-accelerometer-bandsEnergy-49,64
V329|fBodyAcc-bandsEnergy()-1,24|frequency-body-accelerometer-bandsEnergy-1,24
V330|fBodyAcc-bandsEnergy()-25,48|frequency-body-accelerometer-bandsEnergy-25,48
V331|fBodyAcc-bandsEnergy()-1,8|frequency-body-accelerometer-bandsEnergy-1,8
V332|fBodyAcc-bandsEnergy()-9,16|frequency-body-accelerometer-bandsEnergy-9,16
V333|fBodyAcc-bandsEnergy()-17,24|frequency-body-accelerometer-bandsEnergy-17,24
V334|fBodyAcc-bandsEnergy()-25,32|frequency-body-accelerometer-bandsEnergy-25,32
V335|fBodyAcc-bandsEnergy()-33,40|frequency-body-accelerometer-bandsEnergy-33,40
V336|fBodyAcc-bandsEnergy()-41,48|frequency-body-accelerometer-bandsEnergy-41,48
V337|fBodyAcc-bandsEnergy()-49,56|frequency-body-accelerometer-bandsEnergy-49,56
V338|fBodyAcc-bandsEnergy()-57,64|frequency-body-accelerometer-bandsEnergy-57,64
V339|fBodyAcc-bandsEnergy()-1,16|frequency-body-accelerometer-bandsEnergy-1,16
V340|fBodyAcc-bandsEnergy()-17,32|frequency-body-accelerometer-bandsEnergy-17,32
V341|fBodyAcc-bandsEnergy()-33,48|frequency-body-accelerometer-bandsEnergy-33,48
V342|fBodyAcc-bandsEnergy()-49,64|frequency-body-accelerometer-bandsEnergy-49,64
V343|fBodyAcc-bandsEnergy()-1,24|frequency-body-accelerometer-bandsEnergy-1,24
V344|fBodyAcc-bandsEnergy()-25,48|frequency-body-accelerometer-bandsEnergy-25,48
V345|fBodyAccJerk-mean()-X|frequency-body-accelerometer-jerk-mean-X
V346|fBodyAccJerk-mean()-Y|frequency-body-accelerometer-jerk-mean-Y
V347|fBodyAccJerk-mean()-Z|frequency-body-accelerometer-jerk-mean-Z
V348|fBodyAccJerk-std()-X|frequency-body-accelerometer-jerk-std-X
V349|fBodyAccJerk-std()-Y|frequency-body-accelerometer-jerk-std-Y
V350|fBodyAccJerk-std()-Z|frequency-body-accelerometer-jerk-std-Z
V351|fBodyAccJerk-mad()-X|frequency-body-accelerometer-jerk-mad-X
V352|fBodyAccJerk-mad()-Y|frequency-body-accelerometer-jerk-mad-Y
V353|fBodyAccJerk-mad()-Z|frequency-body-accelerometer-jerk-mad-Z
V354|fBodyAccJerk-max()-X|frequency-body-accelerometer-jerk-max-X
V355|fBodyAccJerk-max()-Y|frequency-body-accelerometer-jerk-max-Y
V356|fBodyAccJerk-max()-Z|frequency-body-accelerometer-jerk-max-Z
V357|fBodyAccJerk-min()-X|frequency-body-accelerometer-jerk-min-X
V358|fBodyAccJerk-min()-Y|frequency-body-accelerometer-jerk-min-Y
V359|fBodyAccJerk-min()-Z|frequency-body-accelerometer-jerk-min-Z
V360|fBodyAccJerk-sma()|frequency-body-accelerometer-jerk-sma-NA
V361|fBodyAccJerk-energy()-X|frequency-body-accelerometer-jerk-energy-X
V362|fBodyAccJerk-energy()-Y|frequency-body-accelerometer-jerk-energy-Y
V363|fBodyAccJerk-energy()-Z|frequency-body-accelerometer-jerk-energy-Z
V364|fBodyAccJerk-iqr()-X|frequency-body-accelerometer-jerk-iqr-X
V365|fBodyAccJerk-iqr()-Y|frequency-body-accelerometer-jerk-iqr-Y
V366|fBodyAccJerk-iqr()-Z|frequency-body-accelerometer-jerk-iqr-Z
V367|fBodyAccJerk-entropy()-X|frequency-body-accelerometer-jerk-entropy-X
V368|fBodyAccJerk-entropy()-Y|frequency-body-accelerometer-jerk-entropy-Y
V369|fBodyAccJerk-entropy()-Z|frequency-body-accelerometer-jerk-entropy-Z
V370|fBodyAccJerk-maxInds-X|frequency-body-accelerometer-jerk-maxInds-X
V371|fBodyAccJerk-maxInds-Y|frequency-body-accelerometer-jerk-maxInds-Y
V372|fBodyAccJerk-maxInds-Z|frequency-body-accelerometer-jerk-maxInds-Z
V373|fBodyAccJerk-meanFreq()-X|frequency-body-accelerometer-jerk-meanFreq-X
V374|fBodyAccJerk-meanFreq()-Y|frequency-body-accelerometer-jerk-meanFreq-Y
V375|fBodyAccJerk-meanFreq()-Z|frequency-body-accelerometer-jerk-meanFreq-Z
V376|fBodyAccJerk-skewness()-X|frequency-body-accelerometer-jerk-skewness-X
V377|fBodyAccJerk-kurtosis()-X|frequency-body-accelerometer-jerk-kurtosis-X
V378|fBodyAccJerk-skewness()-Y|frequency-body-accelerometer-jerk-skewness-Y
V379|fBodyAccJerk-kurtosis()-Y|frequency-body-accelerometer-jerk-kurtosis-Y
V380|fBodyAccJerk-skewness()-Z|frequency-body-accelerometer-jerk-skewness-Z
V381|fBodyAccJerk-kurtosis()-Z|frequency-body-accelerometer-jerk-kurtosis-Z
V382|fBodyAccJerk-bandsEnergy()-1,8|frequency-body-accelerometer-jerk-bandsEnergy-1,8
V383|fBodyAccJerk-bandsEnergy()-9,16|frequency-body-accelerometer-jerk-bandsEnergy-9,16
V384|fBodyAccJerk-bandsEnergy()-17,24|frequency-body-accelerometer-jerk-bandsEnergy-17,24
V385|fBodyAccJerk-bandsEnergy()-25,32|frequency-body-accelerometer-jerk-bandsEnergy-25,32
V386|fBodyAccJerk-bandsEnergy()-33,40|frequency-body-accelerometer-jerk-bandsEnergy-33,40
V387|fBodyAccJerk-bandsEnergy()-41,48|frequency-body-accelerometer-jerk-bandsEnergy-41,48
V388|fBodyAccJerk-bandsEnergy()-49,56|frequency-body-accelerometer-jerk-bandsEnergy-49,56
V389|fBodyAccJerk-bandsEnergy()-57,64|frequency-body-accelerometer-jerk-bandsEnergy-57,64
V390|fBodyAccJerk-bandsEnergy()-1,16|frequency-body-accelerometer-jerk-bandsEnergy-1,16
V391|fBodyAccJerk-bandsEnergy()-17,32|frequency-body-accelerometer-jerk-bandsEnergy-17,32
V392|fBodyAccJerk-bandsEnergy()-33,48|frequency-body-accelerometer-jerk-bandsEnergy-33,48
V393|fBodyAccJerk-bandsEnergy()-49,64|frequency-body-accelerometer-jerk-bandsEnergy-49,64
V394|fBodyAccJerk-bandsEnergy()-1,24|frequency-body-accelerometer-jerk-bandsEnergy-1,24
V395|fBodyAccJerk-bandsEnergy()-25,48|frequency-body-accelerometer-jerk-bandsEnergy-25,48
V396|fBodyAccJerk-bandsEnergy()-1,8|frequency-body-accelerometer-jerk-bandsEnergy-1,8
V397|fBodyAccJerk-bandsEnergy()-9,16|frequency-body-accelerometer-jerk-bandsEnergy-9,16
V398|fBodyAccJerk-bandsEnergy()-17,24|frequency-body-accelerometer-jerk-bandsEnergy-17,24
V399|fBodyAccJerk-bandsEnergy()-25,32|frequency-body-accelerometer-jerk-bandsEnergy-25,32
V400|fBodyAccJerk-bandsEnergy()-33,40|frequency-body-accelerometer-jerk-bandsEnergy-33,40
V401|fBodyAccJerk-bandsEnergy()-41,48|frequency-body-accelerometer-jerk-bandsEnergy-41,48
V402|fBodyAccJerk-bandsEnergy()-49,56|frequency-body-accelerometer-jerk-bandsEnergy-49,56
V403|fBodyAccJerk-bandsEnergy()-57,64|frequency-body-accelerometer-jerk-bandsEnergy-57,64
V404|fBodyAccJerk-bandsEnergy()-1,16|frequency-body-accelerometer-jerk-bandsEnergy-1,16
V405|fBodyAccJerk-bandsEnergy()-17,32|frequency-body-accelerometer-jerk-bandsEnergy-17,32
V406|fBodyAccJerk-bandsEnergy()-33,48|frequency-body-accelerometer-jerk-bandsEnergy-33,48
V407|fBodyAccJerk-bandsEnergy()-49,64|frequency-body-accelerometer-jerk-bandsEnergy-49,64
V408|fBodyAccJerk-bandsEnergy()-1,24|frequency-body-accelerometer-jerk-bandsEnergy-1,24
V409|fBodyAccJerk-bandsEnergy()-25,48|frequency-body-accelerometer-jerk-bandsEnergy-25,48
V410|fBodyAccJerk-bandsEnergy()-1,8|frequency-body-accelerometer-jerk-bandsEnergy-1,8
V411|fBodyAccJerk-bandsEnergy()-9,16|frequency-body-accelerometer-jerk-bandsEnergy-9,16
V412|fBodyAccJerk-bandsEnergy()-17,24|frequency-body-accelerometer-jerk-bandsEnergy-17,24
V413|fBodyAccJerk-bandsEnergy()-25,32|frequency-body-accelerometer-jerk-bandsEnergy-25,32
V414|fBodyAccJerk-bandsEnergy()-33,40|frequency-body-accelerometer-jerk-bandsEnergy-33,40
V415|fBodyAccJerk-bandsEnergy()-41,48|frequency-body-accelerometer-jerk-bandsEnergy-41,48
V416|fBodyAccJerk-bandsEnergy()-49,56|frequency-body-accelerometer-jerk-bandsEnergy-49,56
V417|fBodyAccJerk-bandsEnergy()-57,64|frequency-body-accelerometer-jerk-bandsEnergy-57,64
V418|fBodyAccJerk-bandsEnergy()-1,16|frequency-body-accelerometer-jerk-bandsEnergy-1,16
V419|fBodyAccJerk-bandsEnergy()-17,32|frequency-body-accelerometer-jerk-bandsEnergy-17,32
V420|fBodyAccJerk-bandsEnergy()-33,48|frequency-body-accelerometer-jerk-bandsEnergy-33,48
V421|fBodyAccJerk-bandsEnergy()-49,64|frequency-body-accelerometer-jerk-bandsEnergy-49,64
V422|fBodyAccJerk-bandsEnergy()-1,24|frequency-body-accelerometer-jerk-bandsEnergy-1,24
V423|fBodyAccJerk-bandsEnergy()-25,48|frequency-body-accelerometer-jerk-bandsEnergy-25,48
V424|fBodyGyro-mean()-X|frequency-body-gyroscope-mean-X
V425|fBodyGyro-mean()-Y|frequency-body-gyroscope-mean-Y
V426|fBodyGyro-mean()-Z|frequency-body-gyroscope-mean-Z
V427|fBodyGyro-std()-X|frequency-body-gyroscope-std-X
V428|fBodyGyro-std()-Y|frequency-body-gyroscope-std-Y
V429|fBodyGyro-std()-Z|frequency-body-gyroscope-std-Z
V430|fBodyGyro-mad()-X|frequency-body-gyroscope-mad-X
V431|fBodyGyro-mad()-Y|frequency-body-gyroscope-mad-Y
V432|fBodyGyro-mad()-Z|frequency-body-gyroscope-mad-Z
V433|fBodyGyro-max()-X|frequency-body-gyroscope-max-X
V434|fBodyGyro-max()-Y|frequency-body-gyroscope-max-Y
V435|fBodyGyro-max()-Z|frequency-body-gyroscope-max-Z
V436|fBodyGyro-min()-X|frequency-body-gyroscope-min-X
V437|fBodyGyro-min()-Y|frequency-body-gyroscope-min-Y
V438|fBodyGyro-min()-Z|frequency-body-gyroscope-min-Z
V439|fBodyGyro-sma()|frequency-body-gyroscope-sma-NA
V440|fBodyGyro-energy()-X|frequency-body-gyroscope-energy-X
V441|fBodyGyro-energy()-Y|frequency-body-gyroscope-energy-Y
V442|fBodyGyro-energy()-Z|frequency-body-gyroscope-energy-Z
V443|fBodyGyro-iqr()-X|frequency-body-gyroscope-iqr-X
V444|fBodyGyro-iqr()-Y|frequency-body-gyroscope-iqr-Y
V445|fBodyGyro-iqr()-Z|frequency-body-gyroscope-iqr-Z
V446|fBodyGyro-entropy()-X|frequency-body-gyroscope-entropy-X
V447|fBodyGyro-entropy()-Y|frequency-body-gyroscope-entropy-Y
V448|fBodyGyro-entropy()-Z|frequency-body-gyroscope-entropy-Z
V449|fBodyGyro-maxInds-X|frequency-body-gyroscope-maxInds-X
V450|fBodyGyro-maxInds-Y|frequency-body-gyroscope-maxInds-Y
V451|fBodyGyro-maxInds-Z|frequency-body-gyroscope-maxInds-Z
V452|fBodyGyro-meanFreq()-X|frequency-body-gyroscope-meanFreq-X
V453|fBodyGyro-meanFreq()-Y|frequency-body-gyroscope-meanFreq-Y
V454|fBodyGyro-meanFreq()-Z|frequency-body-gyroscope-meanFreq-Z
V455|fBodyGyro-skewness()-X|frequency-body-gyroscope-skewness-X
V456|fBodyGyro-kurtosis()-X|frequency-body-gyroscope-kurtosis-X
V457|fBodyGyro-skewness()-Y|frequency-body-gyroscope-skewness-Y
V458|fBodyGyro-kurtosis()-Y|frequency-body-gyroscope-kurtosis-Y
V459|fBodyGyro-skewness()-Z|frequency-body-gyroscope-skewness-Z
V460|fBodyGyro-kurtosis()-Z|frequency-body-gyroscope-kurtosis-Z
V461|fBodyGyro-bandsEnergy()-1,8|frequency-body-gyroscope-bandsEnergy-1,8
V462|fBodyGyro-bandsEnergy()-9,16|frequency-body-gyroscope-bandsEnergy-9,16
V463|fBodyGyro-bandsEnergy()-17,24|frequency-body-gyroscope-bandsEnergy-17,24
V464|fBodyGyro-bandsEnergy()-25,32|frequency-body-gyroscope-bandsEnergy-25,32
V465|fBodyGyro-bandsEnergy()-33,40|frequency-body-gyroscope-bandsEnergy-33,40
V466|fBodyGyro-bandsEnergy()-41,48|frequency-body-gyroscope-bandsEnergy-41,48
V467|fBodyGyro-bandsEnergy()-49,56|frequency-body-gyroscope-bandsEnergy-49,56
V468|fBodyGyro-bandsEnergy()-57,64|frequency-body-gyroscope-bandsEnergy-57,64
V469|fBodyGyro-bandsEnergy()-1,16|frequency-body-gyroscope-bandsEnergy-1,16
V470|fBodyGyro-bandsEnergy()-17,32|frequency-body-gyroscope-bandsEnergy-17,32
V471|fBodyGyro-bandsEnergy()-33,48|frequency-body-gyroscope-bandsEnergy-33,48
V472|fBodyGyro-bandsEnergy()-49,64|frequency-body-gyroscope-bandsEnergy-49,64
V473|fBodyGyro-bandsEnergy()-1,24|frequency-body-gyroscope-bandsEnergy-1,24
V474|fBodyGyro-bandsEnergy()-25,48|frequency-body-gyroscope-bandsEnergy-25,48
V475|fBodyGyro-bandsEnergy()-1,8|frequency-body-gyroscope-bandsEnergy-1,8
V476|fBodyGyro-bandsEnergy()-9,16|frequency-body-gyroscope-bandsEnergy-9,16
V477|fBodyGyro-bandsEnergy()-17,24|frequency-body-gyroscope-bandsEnergy-17,24
V478|fBodyGyro-bandsEnergy()-25,32|frequency-body-gyroscope-bandsEnergy-25,32
V479|fBodyGyro-bandsEnergy()-33,40|frequency-body-gyroscope-bandsEnergy-33,40
V480|fBodyGyro-bandsEnergy()-41,48|frequency-body-gyroscope-bandsEnergy-41,48
V481|fBodyGyro-bandsEnergy()-49,56|frequency-body-gyroscope-bandsEnergy-49,56
V482|fBodyGyro-bandsEnergy()-57,64|frequency-body-gyroscope-bandsEnergy-57,64
V483|fBodyGyro-bandsEnergy()-1,16|frequency-body-gyroscope-bandsEnergy-1,16
V484|fBodyGyro-bandsEnergy()-17,32|frequency-body-gyroscope-bandsEnergy-17,32
V485|fBodyGyro-bandsEnergy()-33,48|frequency-body-gyroscope-bandsEnergy-33,48
V486|fBodyGyro-bandsEnergy()-49,64|frequency-body-gyroscope-bandsEnergy-49,64
V487|fBodyGyro-bandsEnergy()-1,24|frequency-body-gyroscope-bandsEnergy-1,24
V488|fBodyGyro-bandsEnergy()-25,48|frequency-body-gyroscope-bandsEnergy-25,48
V489|fBodyGyro-bandsEnergy()-1,8|frequency-body-gyroscope-bandsEnergy-1,8
V490|fBodyGyro-bandsEnergy()-9,16|frequency-body-gyroscope-bandsEnergy-9,16
V491|fBodyGyro-bandsEnergy()-17,24|frequency-body-gyroscope-bandsEnergy-17,24
V492|fBodyGyro-bandsEnergy()-25,32|frequency-body-gyroscope-bandsEnergy-25,32
V493|fBodyGyro-bandsEnergy()-33,40|frequency-body-gyroscope-bandsEnergy-33,40
V494|fBodyGyro-bandsEnergy()-41,48|frequency-body-gyroscope-bandsEnergy-41,48
V495|fBodyGyro-bandsEnergy()-49,56|frequency-body-gyroscope-bandsEnergy-49,56
V496|fBodyGyro-bandsEnergy()-57,64|frequency-body-gyroscope-bandsEnergy-57,64
V497|fBodyGyro-bandsEnergy()-1,16|frequency-body-gyroscope-bandsEnergy-1,16
V498|fBodyGyro-bandsEnergy()-17,32|frequency-body-gyroscope-bandsEnergy-17,32
V499|fBodyGyro-bandsEnergy()-33,48|frequency-body-gyroscope-bandsEnergy-33,48
V500|fBodyGyro-bandsEnergy()-49,64|frequency-body-gyroscope-bandsEnergy-49,64
V501|fBodyGyro-bandsEnergy()-1,24|frequency-body-gyroscope-bandsEnergy-1,24
V502|fBodyGyro-bandsEnergy()-25,48|frequency-body-gyroscope-bandsEnergy-25,48
V503|fBodyAccMag-mean()|frequency-body-accelerometer-magnitude-mean-NA
V504|fBodyAccMag-std()|frequency-body-accelerometer-magnitude-std-NA
V505|fBodyAccMag-mad()|frequency-body-accelerometer-magnitude-mad-NA
V506|fBodyAccMag-max()|frequency-body-accelerometer-magnitude-max-NA
V507|fBodyAccMag-min()|frequency-body-accelerometer-magnitude-min-NA
V508|fBodyAccMag-sma()|frequency-body-accelerometer-magnitude-sma-NA
V509|fBodyAccMag-energy()|frequency-body-accelerometer-magnitude-energy-NA
V510|fBodyAccMag-iqr()|frequency-body-accelerometer-magnitude-iqr-NA
V511|fBodyAccMag-entropy()|frequency-body-accelerometer-magnitude-entropy-NA
V512|fBodyAccMag-maxInds|frequency-body-accelerometer-magnitude-maxInds-NA
V513|fBodyAccMag-meanFreq()|frequency-body-accelerometer-magnitude-meanFreq-NA
V514|fBodyAccMag-skewness()|frequency-body-accelerometer-magnitude-skewness-NA
V515|fBodyAccMag-kurtosis()|frequency-body-accelerometer-magnitude-kurtosis-NA
V516|fBodyBodyAccJerkMag-mean()|frequency-body-accelerometer-jerk-magnitude-mean-NA
V517|fBodyBodyAccJerkMag-std()|frequency-body-accelerometer-jerk-magnitude-std-NA
V518|fBodyBodyAccJerkMag-mad()|frequency-body-accelerometer-jerk-magnitude-mad-NA
V519|fBodyBodyAccJerkMag-max()|frequency-body-accelerometer-jerk-magnitude-max-NA
V520|fBodyBodyAccJerkMag-min()|frequency-body-accelerometer-jerk-magnitude-min-NA
V521|fBodyBodyAccJerkMag-sma()|frequency-body-accelerometer-jerk-magnitude-sma-NA
V522|fBodyBodyAccJerkMag-energy()|frequency-body-accelerometer-jerk-magnitude-energy-NA
V523|fBodyBodyAccJerkMag-iqr()|frequency-body-accelerometer-jerk-magnitude-iqr-NA
V524|fBodyBodyAccJerkMag-entropy()|frequency-body-accelerometer-jerk-magnitude-entropy-NA
V525|fBodyBodyAccJerkMag-maxInds|frequency-body-accelerometer-jerk-magnitude-maxInds-NA
V526|fBodyBodyAccJerkMag-meanFreq()|frequency-body-accelerometer-jerk-magnitude-meanFreq-NA
V527|fBodyBodyAccJerkMag-skewness()|frequency-body-accelerometer-jerk-magnitude-skewness-NA
V528|fBodyBodyAccJerkMag-kurtosis()|frequency-body-accelerometer-jerk-magnitude-kurtosis-NA
V529|fBodyBodyGyroMag-mean()|frequency-body-gyroscope-magnitude-mean-NA
V530|fBodyBodyGyroMag-std()|frequency-body-gyroscope-magnitude-std-NA
V531|fBodyBodyGyroMag-mad()|frequency-body-gyroscope-magnitude-mad-NA
V532|fBodyBodyGyroMag-max()|frequency-body-gyroscope-magnitude-max-NA
V533|fBodyBodyGyroMag-min()|frequency-body-gyroscope-magnitude-min-NA
V534|fBodyBodyGyroMag-sma()|frequency-body-gyroscope-magnitude-sma-NA
V535|fBodyBodyGyroMag-energy()|frequency-body-gyroscope-magnitude-energy-NA
V536|fBodyBodyGyroMag-iqr()|frequency-body-gyroscope-magnitude-iqr-NA
V537|fBodyBodyGyroMag-entropy()|frequency-body-gyroscope-magnitude-entropy-NA
V538|fBodyBodyGyroMag-maxInds|frequency-body-gyroscope-magnitude-maxInds-NA
V539|fBodyBodyGyroMag-meanFreq()|frequency-body-gyroscope-magnitude-meanFreq-NA
V540|fBodyBodyGyroMag-skewness()|frequency-body-gyroscope-magnitude-skewness-NA
V541|fBodyBodyGyroMag-kurtosis()|frequency-body-gyroscope-magnitude-kurtosis-NA
V542|fBodyBodyGyroJerkMag-mean()|frequency-body-gyroscope-jerk-magnitude-mean-NA
V543|fBodyBodyGyroJerkMag-std()|frequency-body-gyroscope-jerk-magnitude-std-NA
V544|fBodyBodyGyroJerkMag-mad()|frequency-body-gyroscope-jerk-magnitude-mad-NA
V545|fBodyBodyGyroJerkMag-max()|frequency-body-gyroscope-jerk-magnitude-max-NA
V546|fBodyBodyGyroJerkMag-min()|frequency-body-gyroscope-jerk-magnitude-min-NA
V547|fBodyBodyGyroJerkMag-sma()|frequency-body-gyroscope-jerk-magnitude-sma-NA
V548|fBodyBodyGyroJerkMag-energy()|frequency-body-gyroscope-jerk-magnitude-energy-NA
V549|fBodyBodyGyroJerkMag-iqr()|frequency-body-gyroscope-jerk-magnitude-iqr-NA
V550|fBodyBodyGyroJerkMag-entropy()|frequency-body-gyroscope-jerk-magnitude-entropy-NA
V551|fBodyBodyGyroJerkMag-maxInds|frequency-body-gyroscope-jerk-magnitude-maxInds-NA
V552|fBodyBodyGyroJerkMag-meanFreq()|frequency-body-gyroscope-jerk-magnitude-meanFreq-NA
V553|fBodyBodyGyroJerkMag-skewness()|frequency-body-gyroscope-jerk-magnitude-skewness-NA
V554|fBodyBodyGyroJerkMag-kurtosis()|frequency-body-gyroscope-jerk-magnitude-kurtosis-NA
V555|angle(tBodyAccMean,gravity)|angle-tBodyAccMean-gravityMean-NA-NA
V556|angle(tBodyAccJerkMean),gravityMean)|angle-tBodyAccJerkMean-gravityMean-NA-NA
V557|angle(tBodyGyroMean,gravityMean)|angle-tBodyGyroMean-gravityMean-NA-NA
V558|angle(tBodyGyroJerkMean,gravityMean)|angle-tBodyGyroJerkMean-gravityMean-NA-NA
V559|angle(X,gravityMean)|angle-X-gravityMean-NA-NA
V560|angle(Y,gravityMean)|angle-Y-gravityMean-NA-NA
V561|angle(Z,gravityMean)|angle-Z-gravityMean-NA-NA


## Data Source Documentation
### README.txt

```
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
```

### features_info.txt

```
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
```
### features.txt

```
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
7 tBodyAcc-mad()-X
8 tBodyAcc-mad()-Y
9 tBodyAcc-mad()-Z
10 tBodyAcc-max()-X
11 tBodyAcc-max()-Y
12 tBodyAcc-max()-Z
13 tBodyAcc-min()-X
14 tBodyAcc-min()-Y
15 tBodyAcc-min()-Z
16 tBodyAcc-sma()
17 tBodyAcc-energy()-X
18 tBodyAcc-energy()-Y
19 tBodyAcc-energy()-Z
20 tBodyAcc-iqr()-X
21 tBodyAcc-iqr()-Y
22 tBodyAcc-iqr()-Z
23 tBodyAcc-entropy()-X
24 tBodyAcc-entropy()-Y
25 tBodyAcc-entropy()-Z
26 tBodyAcc-arCoeff()-X,1
27 tBodyAcc-arCoeff()-X,2
28 tBodyAcc-arCoeff()-X,3
29 tBodyAcc-arCoeff()-X,4
30 tBodyAcc-arCoeff()-Y,1
31 tBodyAcc-arCoeff()-Y,2
32 tBodyAcc-arCoeff()-Y,3
33 tBodyAcc-arCoeff()-Y,4
34 tBodyAcc-arCoeff()-Z,1
35 tBodyAcc-arCoeff()-Z,2
36 tBodyAcc-arCoeff()-Z,3
37 tBodyAcc-arCoeff()-Z,4
38 tBodyAcc-correlation()-X,Y
39 tBodyAcc-correlation()-X,Z
40 tBodyAcc-correlation()-Y,Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
47 tGravityAcc-mad()-X
48 tGravityAcc-mad()-Y
49 tGravityAcc-mad()-Z
50 tGravityAcc-max()-X
51 tGravityAcc-max()-Y
52 tGravityAcc-max()-Z
53 tGravityAcc-min()-X
54 tGravityAcc-min()-Y
55 tGravityAcc-min()-Z
56 tGravityAcc-sma()
57 tGravityAcc-energy()-X
58 tGravityAcc-energy()-Y
59 tGravityAcc-energy()-Z
60 tGravityAcc-iqr()-X
61 tGravityAcc-iqr()-Y
62 tGravityAcc-iqr()-Z
63 tGravityAcc-entropy()-X
64 tGravityAcc-entropy()-Y
65 tGravityAcc-entropy()-Z
66 tGravityAcc-arCoeff()-X,1
67 tGravityAcc-arCoeff()-X,2
68 tGravityAcc-arCoeff()-X,3
69 tGravityAcc-arCoeff()-X,4
70 tGravityAcc-arCoeff()-Y,1
71 tGravityAcc-arCoeff()-Y,2
72 tGravityAcc-arCoeff()-Y,3
73 tGravityAcc-arCoeff()-Y,4
74 tGravityAcc-arCoeff()-Z,1
75 tGravityAcc-arCoeff()-Z,2
76 tGravityAcc-arCoeff()-Z,3
77 tGravityAcc-arCoeff()-Z,4
78 tGravityAcc-correlation()-X,Y
79 tGravityAcc-correlation()-X,Z
80 tGravityAcc-correlation()-Y,Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
87 tBodyAccJerk-mad()-X
88 tBodyAccJerk-mad()-Y
89 tBodyAccJerk-mad()-Z
90 tBodyAccJerk-max()-X
91 tBodyAccJerk-max()-Y
92 tBodyAccJerk-max()-Z
93 tBodyAccJerk-min()-X
94 tBodyAccJerk-min()-Y
95 tBodyAccJerk-min()-Z
96 tBodyAccJerk-sma()
97 tBodyAccJerk-energy()-X
98 tBodyAccJerk-energy()-Y
99 tBodyAccJerk-energy()-Z
100 tBodyAccJerk-iqr()-X
101 tBodyAccJerk-iqr()-Y
102 tBodyAccJerk-iqr()-Z
103 tBodyAccJerk-entropy()-X
104 tBodyAccJerk-entropy()-Y
105 tBodyAccJerk-entropy()-Z
106 tBodyAccJerk-arCoeff()-X,1
107 tBodyAccJerk-arCoeff()-X,2
108 tBodyAccJerk-arCoeff()-X,3
109 tBodyAccJerk-arCoeff()-X,4
110 tBodyAccJerk-arCoeff()-Y,1
111 tBodyAccJerk-arCoeff()-Y,2
112 tBodyAccJerk-arCoeff()-Y,3
113 tBodyAccJerk-arCoeff()-Y,4
114 tBodyAccJerk-arCoeff()-Z,1
115 tBodyAccJerk-arCoeff()-Z,2
116 tBodyAccJerk-arCoeff()-Z,3
117 tBodyAccJerk-arCoeff()-Z,4
118 tBodyAccJerk-correlation()-X,Y
119 tBodyAccJerk-correlation()-X,Z
120 tBodyAccJerk-correlation()-Y,Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
127 tBodyGyro-mad()-X
128 tBodyGyro-mad()-Y
129 tBodyGyro-mad()-Z
130 tBodyGyro-max()-X
131 tBodyGyro-max()-Y
132 tBodyGyro-max()-Z
133 tBodyGyro-min()-X
134 tBodyGyro-min()-Y
135 tBodyGyro-min()-Z
136 tBodyGyro-sma()
137 tBodyGyro-energy()-X
138 tBodyGyro-energy()-Y
139 tBodyGyro-energy()-Z
140 tBodyGyro-iqr()-X
141 tBodyGyro-iqr()-Y
142 tBodyGyro-iqr()-Z
143 tBodyGyro-entropy()-X
144 tBodyGyro-entropy()-Y
145 tBodyGyro-entropy()-Z
146 tBodyGyro-arCoeff()-X,1
147 tBodyGyro-arCoeff()-X,2
148 tBodyGyro-arCoeff()-X,3
149 tBodyGyro-arCoeff()-X,4
150 tBodyGyro-arCoeff()-Y,1
151 tBodyGyro-arCoeff()-Y,2
152 tBodyGyro-arCoeff()-Y,3
153 tBodyGyro-arCoeff()-Y,4
154 tBodyGyro-arCoeff()-Z,1
155 tBodyGyro-arCoeff()-Z,2
156 tBodyGyro-arCoeff()-Z,3
157 tBodyGyro-arCoeff()-Z,4
158 tBodyGyro-correlation()-X,Y
159 tBodyGyro-correlation()-X,Z
160 tBodyGyro-correlation()-Y,Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
167 tBodyGyroJerk-mad()-X
168 tBodyGyroJerk-mad()-Y
169 tBodyGyroJerk-mad()-Z
170 tBodyGyroJerk-max()-X
171 tBodyGyroJerk-max()-Y
172 tBodyGyroJerk-max()-Z
173 tBodyGyroJerk-min()-X
174 tBodyGyroJerk-min()-Y
175 tBodyGyroJerk-min()-Z
176 tBodyGyroJerk-sma()
177 tBodyGyroJerk-energy()-X
178 tBodyGyroJerk-energy()-Y
179 tBodyGyroJerk-energy()-Z
180 tBodyGyroJerk-iqr()-X
181 tBodyGyroJerk-iqr()-Y
182 tBodyGyroJerk-iqr()-Z
183 tBodyGyroJerk-entropy()-X
184 tBodyGyroJerk-entropy()-Y
185 tBodyGyroJerk-entropy()-Z
186 tBodyGyroJerk-arCoeff()-X,1
187 tBodyGyroJerk-arCoeff()-X,2
188 tBodyGyroJerk-arCoeff()-X,3
189 tBodyGyroJerk-arCoeff()-X,4
190 tBodyGyroJerk-arCoeff()-Y,1
191 tBodyGyroJerk-arCoeff()-Y,2
192 tBodyGyroJerk-arCoeff()-Y,3
193 tBodyGyroJerk-arCoeff()-Y,4
194 tBodyGyroJerk-arCoeff()-Z,1
195 tBodyGyroJerk-arCoeff()-Z,2
196 tBodyGyroJerk-arCoeff()-Z,3
197 tBodyGyroJerk-arCoeff()-Z,4
198 tBodyGyroJerk-correlation()-X,Y
199 tBodyGyroJerk-correlation()-X,Z
200 tBodyGyroJerk-correlation()-Y,Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
203 tBodyAccMag-mad()
204 tBodyAccMag-max()
205 tBodyAccMag-min()
206 tBodyAccMag-sma()
207 tBodyAccMag-energy()
208 tBodyAccMag-iqr()
209 tBodyAccMag-entropy()
210 tBodyAccMag-arCoeff()1
211 tBodyAccMag-arCoeff()2
212 tBodyAccMag-arCoeff()3
213 tBodyAccMag-arCoeff()4
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
216 tGravityAccMag-mad()
217 tGravityAccMag-max()
218 tGravityAccMag-min()
219 tGravityAccMag-sma()
220 tGravityAccMag-energy()
221 tGravityAccMag-iqr()
222 tGravityAccMag-entropy()
223 tGravityAccMag-arCoeff()1
224 tGravityAccMag-arCoeff()2
225 tGravityAccMag-arCoeff()3
226 tGravityAccMag-arCoeff()4
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
229 tBodyAccJerkMag-mad()
230 tBodyAccJerkMag-max()
231 tBodyAccJerkMag-min()
232 tBodyAccJerkMag-sma()
233 tBodyAccJerkMag-energy()
234 tBodyAccJerkMag-iqr()
235 tBodyAccJerkMag-entropy()
236 tBodyAccJerkMag-arCoeff()1
237 tBodyAccJerkMag-arCoeff()2
238 tBodyAccJerkMag-arCoeff()3
239 tBodyAccJerkMag-arCoeff()4
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
242 tBodyGyroMag-mad()
243 tBodyGyroMag-max()
244 tBodyGyroMag-min()
245 tBodyGyroMag-sma()
246 tBodyGyroMag-energy()
247 tBodyGyroMag-iqr()
248 tBodyGyroMag-entropy()
249 tBodyGyroMag-arCoeff()1
250 tBodyGyroMag-arCoeff()2
251 tBodyGyroMag-arCoeff()3
252 tBodyGyroMag-arCoeff()4
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
255 tBodyGyroJerkMag-mad()
256 tBodyGyroJerkMag-max()
257 tBodyGyroJerkMag-min()
258 tBodyGyroJerkMag-sma()
259 tBodyGyroJerkMag-energy()
260 tBodyGyroJerkMag-iqr()
261 tBodyGyroJerkMag-entropy()
262 tBodyGyroJerkMag-arCoeff()1
263 tBodyGyroJerkMag-arCoeff()2
264 tBodyGyroJerkMag-arCoeff()3
265 tBodyGyroJerkMag-arCoeff()4
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
272 fBodyAcc-mad()-X
273 fBodyAcc-mad()-Y
274 fBodyAcc-mad()-Z
275 fBodyAcc-max()-X
276 fBodyAcc-max()-Y
277 fBodyAcc-max()-Z
278 fBodyAcc-min()-X
279 fBodyAcc-min()-Y
280 fBodyAcc-min()-Z
281 fBodyAcc-sma()
282 fBodyAcc-energy()-X
283 fBodyAcc-energy()-Y
284 fBodyAcc-energy()-Z
285 fBodyAcc-iqr()-X
286 fBodyAcc-iqr()-Y
287 fBodyAcc-iqr()-Z
288 fBodyAcc-entropy()-X
289 fBodyAcc-entropy()-Y
290 fBodyAcc-entropy()-Z
291 fBodyAcc-maxInds-X
292 fBodyAcc-maxInds-Y
293 fBodyAcc-maxInds-Z
294 fBodyAcc-meanFreq()-X
295 fBodyAcc-meanFreq()-Y
296 fBodyAcc-meanFreq()-Z
297 fBodyAcc-skewness()-X
298 fBodyAcc-kurtosis()-X
299 fBodyAcc-skewness()-Y
300 fBodyAcc-kurtosis()-Y
301 fBodyAcc-skewness()-Z
302 fBodyAcc-kurtosis()-Z
303 fBodyAcc-bandsEnergy()-1,8
304 fBodyAcc-bandsEnergy()-9,16
305 fBodyAcc-bandsEnergy()-17,24
306 fBodyAcc-bandsEnergy()-25,32
307 fBodyAcc-bandsEnergy()-33,40
308 fBodyAcc-bandsEnergy()-41,48
309 fBodyAcc-bandsEnergy()-49,56
310 fBodyAcc-bandsEnergy()-57,64
311 fBodyAcc-bandsEnergy()-1,16
312 fBodyAcc-bandsEnergy()-17,32
313 fBodyAcc-bandsEnergy()-33,48
314 fBodyAcc-bandsEnergy()-49,64
315 fBodyAcc-bandsEnergy()-1,24
316 fBodyAcc-bandsEnergy()-25,48
317 fBodyAcc-bandsEnergy()-1,8
318 fBodyAcc-bandsEnergy()-9,16
319 fBodyAcc-bandsEnergy()-17,24
320 fBodyAcc-bandsEnergy()-25,32
321 fBodyAcc-bandsEnergy()-33,40
322 fBodyAcc-bandsEnergy()-41,48
323 fBodyAcc-bandsEnergy()-49,56
324 fBodyAcc-bandsEnergy()-57,64
325 fBodyAcc-bandsEnergy()-1,16
326 fBodyAcc-bandsEnergy()-17,32
327 fBodyAcc-bandsEnergy()-33,48
328 fBodyAcc-bandsEnergy()-49,64
329 fBodyAcc-bandsEnergy()-1,24
330 fBodyAcc-bandsEnergy()-25,48
331 fBodyAcc-bandsEnergy()-1,8
332 fBodyAcc-bandsEnergy()-9,16
333 fBodyAcc-bandsEnergy()-17,24
334 fBodyAcc-bandsEnergy()-25,32
335 fBodyAcc-bandsEnergy()-33,40
336 fBodyAcc-bandsEnergy()-41,48
337 fBodyAcc-bandsEnergy()-49,56
338 fBodyAcc-bandsEnergy()-57,64
339 fBodyAcc-bandsEnergy()-1,16
340 fBodyAcc-bandsEnergy()-17,32
341 fBodyAcc-bandsEnergy()-33,48
342 fBodyAcc-bandsEnergy()-49,64
343 fBodyAcc-bandsEnergy()-1,24
344 fBodyAcc-bandsEnergy()-25,48
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
351 fBodyAccJerk-mad()-X
352 fBodyAccJerk-mad()-Y
353 fBodyAccJerk-mad()-Z
354 fBodyAccJerk-max()-X
355 fBodyAccJerk-max()-Y
356 fBodyAccJerk-max()-Z
357 fBodyAccJerk-min()-X
358 fBodyAccJerk-min()-Y
359 fBodyAccJerk-min()-Z
360 fBodyAccJerk-sma()
361 fBodyAccJerk-energy()-X
362 fBodyAccJerk-energy()-Y
363 fBodyAccJerk-energy()-Z
364 fBodyAccJerk-iqr()-X
365 fBodyAccJerk-iqr()-Y
366 fBodyAccJerk-iqr()-Z
367 fBodyAccJerk-entropy()-X
368 fBodyAccJerk-entropy()-Y
369 fBodyAccJerk-entropy()-Z
370 fBodyAccJerk-maxInds-X
371 fBodyAccJerk-maxInds-Y
372 fBodyAccJerk-maxInds-Z
373 fBodyAccJerk-meanFreq()-X
374 fBodyAccJerk-meanFreq()-Y
375 fBodyAccJerk-meanFreq()-Z
376 fBodyAccJerk-skewness()-X
377 fBodyAccJerk-kurtosis()-X
378 fBodyAccJerk-skewness()-Y
379 fBodyAccJerk-kurtosis()-Y
380 fBodyAccJerk-skewness()-Z
381 fBodyAccJerk-kurtosis()-Z
382 fBodyAccJerk-bandsEnergy()-1,8
383 fBodyAccJerk-bandsEnergy()-9,16
384 fBodyAccJerk-bandsEnergy()-17,24
385 fBodyAccJerk-bandsEnergy()-25,32
386 fBodyAccJerk-bandsEnergy()-33,40
387 fBodyAccJerk-bandsEnergy()-41,48
388 fBodyAccJerk-bandsEnergy()-49,56
389 fBodyAccJerk-bandsEnergy()-57,64
390 fBodyAccJerk-bandsEnergy()-1,16
391 fBodyAccJerk-bandsEnergy()-17,32
392 fBodyAccJerk-bandsEnergy()-33,48
393 fBodyAccJerk-bandsEnergy()-49,64
394 fBodyAccJerk-bandsEnergy()-1,24
395 fBodyAccJerk-bandsEnergy()-25,48
396 fBodyAccJerk-bandsEnergy()-1,8
397 fBodyAccJerk-bandsEnergy()-9,16
398 fBodyAccJerk-bandsEnergy()-17,24
399 fBodyAccJerk-bandsEnergy()-25,32
400 fBodyAccJerk-bandsEnergy()-33,40
401 fBodyAccJerk-bandsEnergy()-41,48
402 fBodyAccJerk-bandsEnergy()-49,56
403 fBodyAccJerk-bandsEnergy()-57,64
404 fBodyAccJerk-bandsEnergy()-1,16
405 fBodyAccJerk-bandsEnergy()-17,32
406 fBodyAccJerk-bandsEnergy()-33,48
407 fBodyAccJerk-bandsEnergy()-49,64
408 fBodyAccJerk-bandsEnergy()-1,24
409 fBodyAccJerk-bandsEnergy()-25,48
410 fBodyAccJerk-bandsEnergy()-1,8
411 fBodyAccJerk-bandsEnergy()-9,16
412 fBodyAccJerk-bandsEnergy()-17,24
413 fBodyAccJerk-bandsEnergy()-25,32
414 fBodyAccJerk-bandsEnergy()-33,40
415 fBodyAccJerk-bandsEnergy()-41,48
416 fBodyAccJerk-bandsEnergy()-49,56
417 fBodyAccJerk-bandsEnergy()-57,64
418 fBodyAccJerk-bandsEnergy()-1,16
419 fBodyAccJerk-bandsEnergy()-17,32
420 fBodyAccJerk-bandsEnergy()-33,48
421 fBodyAccJerk-bandsEnergy()-49,64
422 fBodyAccJerk-bandsEnergy()-1,24
423 fBodyAccJerk-bandsEnergy()-25,48
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
430 fBodyGyro-mad()-X
431 fBodyGyro-mad()-Y
432 fBodyGyro-mad()-Z
433 fBodyGyro-max()-X
434 fBodyGyro-max()-Y
435 fBodyGyro-max()-Z
436 fBodyGyro-min()-X
437 fBodyGyro-min()-Y
438 fBodyGyro-min()-Z
439 fBodyGyro-sma()
440 fBodyGyro-energy()-X
441 fBodyGyro-energy()-Y
442 fBodyGyro-energy()-Z
443 fBodyGyro-iqr()-X
444 fBodyGyro-iqr()-Y
445 fBodyGyro-iqr()-Z
446 fBodyGyro-entropy()-X
447 fBodyGyro-entropy()-Y
448 fBodyGyro-entropy()-Z
449 fBodyGyro-maxInds-X
450 fBodyGyro-maxInds-Y
451 fBodyGyro-maxInds-Z
452 fBodyGyro-meanFreq()-X
453 fBodyGyro-meanFreq()-Y
454 fBodyGyro-meanFreq()-Z
455 fBodyGyro-skewness()-X
456 fBodyGyro-kurtosis()-X
457 fBodyGyro-skewness()-Y
458 fBodyGyro-kurtosis()-Y
459 fBodyGyro-skewness()-Z
460 fBodyGyro-kurtosis()-Z
461 fBodyGyro-bandsEnergy()-1,8
462 fBodyGyro-bandsEnergy()-9,16
463 fBodyGyro-bandsEnergy()-17,24
464 fBodyGyro-bandsEnergy()-25,32
465 fBodyGyro-bandsEnergy()-33,40
466 fBodyGyro-bandsEnergy()-41,48
467 fBodyGyro-bandsEnergy()-49,56
468 fBodyGyro-bandsEnergy()-57,64
469 fBodyGyro-bandsEnergy()-1,16
470 fBodyGyro-bandsEnergy()-17,32
471 fBodyGyro-bandsEnergy()-33,48
472 fBodyGyro-bandsEnergy()-49,64
473 fBodyGyro-bandsEnergy()-1,24
474 fBodyGyro-bandsEnergy()-25,48
475 fBodyGyro-bandsEnergy()-1,8
476 fBodyGyro-bandsEnergy()-9,16
477 fBodyGyro-bandsEnergy()-17,24
478 fBodyGyro-bandsEnergy()-25,32
479 fBodyGyro-bandsEnergy()-33,40
480 fBodyGyro-bandsEnergy()-41,48
481 fBodyGyro-bandsEnergy()-49,56
482 fBodyGyro-bandsEnergy()-57,64
483 fBodyGyro-bandsEnergy()-1,16
484 fBodyGyro-bandsEnergy()-17,32
485 fBodyGyro-bandsEnergy()-33,48
486 fBodyGyro-bandsEnergy()-49,64
487 fBodyGyro-bandsEnergy()-1,24
488 fBodyGyro-bandsEnergy()-25,48
489 fBodyGyro-bandsEnergy()-1,8
490 fBodyGyro-bandsEnergy()-9,16
491 fBodyGyro-bandsEnergy()-17,24
492 fBodyGyro-bandsEnergy()-25,32
493 fBodyGyro-bandsEnergy()-33,40
494 fBodyGyro-bandsEnergy()-41,48
495 fBodyGyro-bandsEnergy()-49,56
496 fBodyGyro-bandsEnergy()-57,64
497 fBodyGyro-bandsEnergy()-1,16
498 fBodyGyro-bandsEnergy()-17,32
499 fBodyGyro-bandsEnergy()-33,48
500 fBodyGyro-bandsEnergy()-49,64
501 fBodyGyro-bandsEnergy()-1,24
502 fBodyGyro-bandsEnergy()-25,48
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
505 fBodyAccMag-mad()
506 fBodyAccMag-max()
507 fBodyAccMag-min()
508 fBodyAccMag-sma()
509 fBodyAccMag-energy()
510 fBodyAccMag-iqr()
511 fBodyAccMag-entropy()
512 fBodyAccMag-maxInds
513 fBodyAccMag-meanFreq()
514 fBodyAccMag-skewness()
515 fBodyAccMag-kurtosis()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
518 fBodyBodyAccJerkMag-mad()
519 fBodyBodyAccJerkMag-max()
520 fBodyBodyAccJerkMag-min()
521 fBodyBodyAccJerkMag-sma()
522 fBodyBodyAccJerkMag-energy()
523 fBodyBodyAccJerkMag-iqr()
524 fBodyBodyAccJerkMag-entropy()
525 fBodyBodyAccJerkMag-maxInds
526 fBodyBodyAccJerkMag-meanFreq()
527 fBodyBodyAccJerkMag-skewness()
528 fBodyBodyAccJerkMag-kurtosis()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
531 fBodyBodyGyroMag-mad()
532 fBodyBodyGyroMag-max()
533 fBodyBodyGyroMag-min()
534 fBodyBodyGyroMag-sma()
535 fBodyBodyGyroMag-energy()
536 fBodyBodyGyroMag-iqr()
537 fBodyBodyGyroMag-entropy()
538 fBodyBodyGyroMag-maxInds
539 fBodyBodyGyroMag-meanFreq()
540 fBodyBodyGyroMag-skewness()
541 fBodyBodyGyroMag-kurtosis()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()
544 fBodyBodyGyroJerkMag-mad()
545 fBodyBodyGyroJerkMag-max()
546 fBodyBodyGyroJerkMag-min()
547 fBodyBodyGyroJerkMag-sma()
548 fBodyBodyGyroJerkMag-energy()
549 fBodyBodyGyroJerkMag-iqr()
550 fBodyBodyGyroJerkMag-entropy()
551 fBodyBodyGyroJerkMag-maxInds
552 fBodyBodyGyroJerkMag-meanFreq()
553 fBodyBodyGyroJerkMag-skewness()
554 fBodyBodyGyroJerkMag-kurtosis()
555 angle(tBodyAccMean,gravity)
556 angle(tBodyAccJerkMean),gravityMean)
557 angle(tBodyGyroMean,gravityMean)
558 angle(tBodyGyroJerkMean,gravityMean)
559 angle(X,gravityMean)
560 angle(Y,gravityMean)
561 angle(Z,gravityMean)
```

