## Install necessary packages
library(RCurl)

## Check to see if raw data file exists
if(!file.exists("./UCI HAR Dataset/")){
        
        ## Download data if not already present
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile="Dataset.zip", method="curl")
        
        ## Unzip downloaded zip file
        unzip("./Dataset.zip")
}

## Import activity and features information
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=F)[,2]

## Create test set
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectsTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testXY <- cbind(testY, subjectsTest, testX)
colnames(testXY) <- c("activity", "subject", features)
testXY$set <- c(rep("test", nrow(testXY)))

## Create train set
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectsTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainXY <- cbind(trainY, subjectsTrain, trainX)
colnames(trainXY) <- c("activity", "subject", features)
trainXY$set <- c(rep("train", nrow(trainXY)))

## Merge training and test sets
dat <- rbind(testXY, trainXY)

## Convert activity variable to named factor
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
dat$activity <- cut(dat$activity, breaks=6, labels=tolower(activities))
## Convert set and subject variables to factor
dat$set <- as.factor(dat$set)
dat$subject <- as.factor(dat$subject)

## Select mean and std columns
selectCol <- grep("mean\\(\\)|std\\(\\)", colnames(dat), ignore.case=TRUE)
finalCols <- c(564, 1, 2, selectCol)

## Subset data from those columns
datFinal <- dat[, finalCols]

## Properly name variable w/ repeat in name
colnames(datFinal) <- sub("BodyBody", "Body", colnames(datFinal))
## Rename variables with descriptive label names
colnames(datFinal) <- sub("^t", "Time", colnames(datFinal))
colnames(datFinal) <- sub("^f", "Freq", colnames(datFinal))
colnames(datFinal) <- gsub("-", "", colnames(datFinal))
colnames(datFinal) <- sub("\\(\\)", "", colnames(datFinal))
colnames(datFinal) <- sub("mean", ".Mean.", colnames(datFinal))
colnames(datFinal) <- sub("std", ".Std.", colnames(datFinal))
colnames(datFinal) <- sub("\\.$", "", colnames(datFinal))

## Create tidy data set w/ means for all columns subsetted by subject and activity
tidy <- aggregate(datFinal[,4:ncol(datFinal)], by=list(datFinal$subject, datFinal$activity), FUN="mean")
colnames(tidy)[1:2] <- c("subject", "activity")

## Export tidy data set
write.table(tidy, file="tidy.txt", sep="\t", row.names=FALSE)
