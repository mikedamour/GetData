---
title: "Codebook for Coursera Getting & Cleaning Data"
author: "Michael R. D'Amour"
date: "Friday, September 19, 2014"
output: html_document
---


Project for the Getting & Cleaning Data Course offered by Johns Hopkins on Coursera.


This CodeBook describes the data and data manipulations for the Getting and 
Cleaning Data course project.

The components of this analysis, as directed by the Components of Tidy Data lecture,
are provided as follows:

1. The raw data is the UCI HAR Data set provided by the UCI Machine Learning
    laboratory and dated 2012-12-10.
    
    Data was downloaded from 
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    on 9/10/14, providing the file UCI HAR Dataset.
    
    The original codebook for that dataset is provided in feaures_info.txt and 
    is provided in whole at the end of this document for reference and convenience.
            - copyright UCI Machine Learning Laboratory 2012
    
    
2.  The processed dataset file, humSubjActMean.txt - Human Subject by Activity Mean
    text file -in which the mean and standard
    deviation variables of the HAR train and test datasets have been merged together 
    with their feature, subject, and activity identifiers.  
    
    They are then sorted by human subject and by activity. These variables themselves
    then have been averaged. The Subject and Activity columns - 1 and 2 - are
    sorted in ascending order and allow easy identification of the intersection
    of these variables and their mean by variable.
    
    No calculations of the data have been performed beyond finding
    the mean of these intersections over the mean and std data.
    
    Each 81 element feature vector makes up a row. The data used, taken from the 
    original set of 561 variables, include 
    79 mean and std variables. X, Y, and Z data remain as separate columns. Adding the
    two Subject and Activity identifier columns makes 81 elements per row. The 
    Descriptions of the variables follows in the appended original features_info.txt.
        
    Note that the file variable names are very close but not identical to the original
    variable names.  They were shortened for on-screen readability. The key for
    name condensing follows the variables.
    
 [1] "Subject"               
 [2] "Activity"              
 [3] "tBodAcc-mean-     X, Y, Z"      
 [6] "tBodAcc-std-      X, Y, Z"    
 [9] "tGrvAcc-mean-     X, Y, Z"    
[12] "tGrvAcc-std-      X, Y, Z"    
[15] "tBodAccJrk-mean-  X, Y, Z"    
[18] "tBodAccJrk-std-   X, Y, Z"    
[21] "tBodGyr-mean-     X, Y, Z"    
[24] "tBodGyr-std-      X, Y, Z"    
[27] "tBodGyrJrk-mean-  X, Y, Z"    
[30] "tBodGyrJrk-std-   X, Y, Z"    
[33] "tBodAccMag-mean"       
[34] "tBodAccMag-std"        
[35] "tGrvAccMag-mean"       
[36] "tGrvAccMag-std"        
[37] "tBodAccJrkMag-mean"    
[38] "tBodAccJrkMag-std"     
[39] "tBodGyrMag-mean"       
[40] "tBodGyrMag-std"        
[41] "tBodGyrJrkMag-mean"    
[42] "tBodGyrJrkMag-std"     
[43] "fBodAcc-mean-     X, Y, Z"    
[46] "fBodAcc-std-      X, Y, Z"    
[49] "fBodAcc-meanF-    X, Y, Z"    
[52] "fBodAccJrk-mean-  X, Y, Z"    
[55] "fBodAccJrk-std-   X, Y, Z"    
[58] "fBodAccJrk-meanF- X, Y, Z"    
[61] "fBodGyr-mean-     X, Y, Z"    
[64] "fBodGyr-std-      X, Y, Z"    
[67] "fBodGyr-meanF-    X, Y, Z"    
[70] "fBodAccMag-mean"       
[71] "fBodAccMag-std"        
[72] "fBodAccMag-meanF"      
[73] "fBodBodAccJrkMag-mean"    
[74] "fBodBodAccJrkMag-std"  
[75] "fBodBodAccJrkMag-meanF"   
[76] "fBodBodGyrMag-mean"    
[77] "fBodBodGyrMag-std"     
[78] "fBodBodGyrMag-meanF"   
[79] "fBodBodGyrJrkMag-mean"    
[80] "fBodBodGyrJrkMag-std"  
[81] "fBodBodGyrJrkMag-meanF"  

    Variable-name condensing key

        - "()" removed
        - Substitute "Body" with "Bod"
        - Substitute "Gyro"      "Gyr"
        - Substitute "gravity"   "grv"
        - Substitute "Gravity"   "Grv"
        - Substitute "Jerk"      "Jrk"
        - Substitute "Freq"      "F"

    Variable units:
    
        "Subject" units are integers 1 through 30 identifying the individual subject
        who participated in the study.
    
        "Activity" units are character strings identifying one of six activities 
        of the subjects being measured.  They are
            - Laying
            - Sitting
            - Standing
            - Walking
           - Walking_Downstairs
           - Walking_Upstairs
            
        Units for all other variables are described below in the appended original HAR
        codebook, features_info.txt.

    
3. A README.md file is provided to assist in reproducing this data transformation
    and generation of the humSubjActMean data and file.

4. The file run_analysis.R is provided giving the complete steps to produce the
    file humSubjActMean.txt.


*******
Appended below is the features_info.txt codebook provided with the UCI HAR Dataset.
This is done in the interest of submitting a codebook "that modifies and updates the codebooks available", per the course instructions, yet provide a separate CodeBook.md.

******

##UCI HAR Dataset "features_info.txt"

Human Activity Recognition Using Smartphones Dataset
Version 1.0

- copyright UCI Machine Learning Laboratory 2012

##Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMa- 
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

