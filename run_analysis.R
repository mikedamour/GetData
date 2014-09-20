## This is the project for the Getting & Cleaning Data Course offered by Johns 
## on Coursera.  
##
## The run_analysis.R script downloads the Human Activity dataset, extracts 
## specific data, cleans up the data, and performs certin analysis on that data.

## Description of data is at 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data for the project:
    
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Create one R script called run_analysis.R that does the following. 

library(data.table)
library(dplyr)
library(plyr)
library(reshape2)


## 1. Merges the training and the test sets to create one data set.

xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subjTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subjTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

feat <- read.table("./UCI HAR Dataset/features.txt")
actLabs <- read.table("./UCI HAR Dataset/activity_labels.txt")

testData <- cbind(xTest, yTest, subjTest)
trainData <- cbind(xTrain, yTrain, subjTrain)

humActData <- rbind(trainData, testData) 

##  Shorten variable names to improve readability but retain all information.
varNames <- as.character(feat$V2)
varNames <- c(varNames, "Activity", "Subject")
varNames <- gsub("()", "", varNames, fixed = TRUE)
varNames <- gsub("Body", "Bod", varNames, fixed = TRUE)
varNames <- gsub("Gyro", "Gyr", varNames, fixed = TRUE)
varNames <- gsub("gravity", "grv", varNames, fixed = TRUE)
varNames <- gsub("Gravity", "Grv", varNames, fixed = TRUE)
varNames <- gsub("Jerk", "Jrk", varNames, fixed = TRUE)
varNames <- gsub("Freq", "F", varNames, fixed = TRUE)

##  From 4. below, "Appropriately labels the data set with descriptive var names."
##          Done here to assist with extract of mean and std vars.
colnames(humActData) <- varNames

## 2. Extracts only the measurements on the mean and standard deviation for each 
##    measurement. Deliberately skip "angle" vars creating products with mean data.
meanVars <- grep("-mean", varNames, ignore.case = TRUE)
stdVars <- grep("-std", varNames, ignore.case = TRUE)
coreVars <- sort(c(meanVars, stdVars))
humActCore <- select(humActData, coreVars, Activity, Subject)

## 3. Uses descriptive activity names to name the activities in the data set.
humActCore$Activity <- actLabs[humActCore$Activity, "V2"]

## 4. Appropriately labels the data set with descriptive variable names. 

##  Already done with column names above to help with the extract process.

humActTidy <- humActCore    ## Just use core data with column names, no colnames row.

##  Complete first tidy data set saved for posterity :)
write.csv(humActTidy, "./humActTidy.txt", row.names = FALSE)

##  Not required for GetData assignment, just saving.
##  Command to read file, restore Activity to factor from character
humActTidyChk <- read.csv("./humActTidy.txt", as.is = TRUE)
humActTidyChk <- mutate(humActTidyChk, Activity = as.factor(Activity))


## 5. Creates a second, independent tidy data set with the average of each variable 
##    for each activity and each subject. 

##  Assuming "each activity and each subject" means sort by both in same table,
##  create and save Subject & Activity Means table.
humActMelt <- melt(humActCore, id = c("Subject", "Activity"),
                   measure.vars = c(colnames(humActCore[ , 1:79])))
humSubjActMean <- dcast(humActMelt, Subject + Activity ~ variable, mean)

## Insert a column-name row before saving, for universality.
humSubjActMean <- mutate(humSubjActMean, Activity = as.character(Activity))
humSubjActMean <- rbind(colnames(humSubjActMean), humSubjActMean)

write.csv(humSubjActMean, "./humSubjActMean.txt", row.names = FALSE)

##  Peer reviewer's command to read file, restore Activity to factor from character
humSAMChk <- read.csv("./humSubjActMean.txt", as.is = TRUE)
humSAMChk <- mutate(humSAMChk, Activity = as.factor(Activity))
        ## humSubjActMean and humSAMChk will not run identical command because reading 
        ## replaces "-" in column names with "." but data is identical.



