---
title: "README for Course Project Getting and Cleaning Data"
author: "Michael R. D'Amour"
date: "Friday, September 19, 2014"
output: html_document
---

This file provides help in reproducing the course project submission generated by Michael D'Amour for the Getting and Cleaning Data course.

0. The submission includes a link to my Github repo containing the following files.

1. humSubjActMean.txt file

    This file, in .csv format, when read instantiates in memory the data.frame humSubjActMean.  The data.frame provides the averages of the mean and std data from the HAR dataset.  The training and test sets were merged and sorted according to the human subjects and their activities, each intersection of which produces an average.
    
2. run_analysis.R file
    
    The file giving all the steps to load and transform the HAR data into the
    mean-by-subject-by-activity table. It goes through the full 5 step process
    specified in the project assignment.
    
    This file provides commands to assist the peer reviewer read the humSubjActMean.txt file.

3. CodeBook.md file

    Giving a description of of the modifications made to the data to produce the
    analysis dataset in humSubjActMean.txt.
    
4. README.md

    Apparently you already found this.
    
5. NOT INCLUDED - UCI HAR Dataset files

    The UCI HAR Dataset top must reside in the working directory with 
    the run_analysis.R file, which uses relative path names to access these files.
    The hierarchy of the HAR dataset is assumed to have been preserved. Thus, example
    file reads from the working directory will be
    
        xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt") and
        feat <- read.table("./UCI HAR Dataset/features.txt")
        
    with the other similar files following the same pattern.