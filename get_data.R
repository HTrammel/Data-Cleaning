#
# get_data.R
#______________________________________________________________
# Obtains zipped data files from source and puts them in the 
# data folder
#______________________________________________________________
if(!file.exists("./data")) {dir.create("./data")}

sourceFile <- "UCI_HAR_Dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("UCI_HAR_Dataset.zip")) {
    download.file(fileURL,destfile=sourceFile)
    unzip(sourceFile,exdir="./data",junkpaths=TRUE)
}
