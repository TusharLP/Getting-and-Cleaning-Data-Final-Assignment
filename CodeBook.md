# Codebook for Getting and Cleaning Data Final Assignment
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

Source of original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Tasks performed by run_analysis.R:
* Reads the data from the folder in `X_train`-X_train.txt, `X_test`-X_test.txt, `y_train`-y_train.txt, `y_test`-y_test.txt, `subject_train`-subject_train.txt, `subject_test`-subject_test.txt and `features`-features.txt
* Finds relevant features, that features with mean and standard deviation of the measurements, in `features` dataframe
* Removes the irrelevant features from the `X_train` and `X_test` dataframes
* Merges the training and testing datasets: `train`-(`subject_train`, `y_train`, `X_train`) & `test`-(`subject_test`, `y_test`, `X_test`)
* Merges the training and testing datsets into a single dataset: `merged.data`-(`train`, `test`)
* Labels `merged.data` columns with names extracted from `features` and making it more descriptive uppercasing the 'mean' and 'std' in the names and removing brackets
* Changes the 'Activities' with descriptive names that are:
    * Walking
    * Walking_Ustairs
    * Walking_Downstairs
    * Sitting
    * Standing
    * Laying
*  Finally creates a second, independent tidy data set 'tidydata.txt' with the average of each variable for each activity and each subject

## Identifiers
* `Subject` - The ID of the test subject. There are a total of 30 subjects
* `Activities` - The type of activity performed when the corresponding measurements were taken

## Measurements
    [1] "tBodyAcc-MEAN-X"              
    [2] "tBodyAcc-MEAN-Y"              
    [3] "tBodyAcc-MEAN-Z"              
    [4] "tBodyAcc-STD-X"               
    [5] "tBodyAcc-STD-Y"               
    [6] "tBodyAcc-STD-Z"               
    [7] "tGravityAcc-MEAN-X"           
    [8] "tGravityAcc-MEAN-Y"           
    [9] "tGravityAcc-MEAN-Z"           
    [10] "tGravityAcc-STD-X"            
    [11] "tGravityAcc-STD-Y"            
    [12] "tGravityAcc-STD-Z"            
    [13] "tBodyAccJerk-MEAN-X"          
    [14] "tBodyAccJerk-MEAN-Y"          
    [15] "tBodyAccJerk-MEAN-Z"          
    [16] "tBodyAccJerk-STD-X"           
    [17] "tBodyAccJerk-STD-Y"           
    [18] "tBodyAccJerk-STD-Z"           
    [19] "tBodyGyro-MEAN-X"             
    [20] "tBodyGyro-MEAN-Y"             
    [21] "tBodyGyro-MEAN-Z"             
    [22] "tBodyGyro-STD-X"              
    [23] "tBodyGyro-STD-Y"              
    [24] "tBodyGyro-STD-Z"              
    [25] "tBodyGyroJerk-MEAN-X"         
    [26] "tBodyGyroJerk-MEAN-Y"         
    [27] "tBodyGyroJerk-MEAN-Z"         
    [28] "tBodyGyroJerk-STD-X"          
    [29] "tBodyGyroJerk-STD-Y"          
    [30] "tBodyGyroJerk-STD-Z"          
    [31] "tBodyAccMag-MEAN"             
    [32] "tBodyAccMag-STD"              
    [33] "tGravityAccMag-MEAN"          
    [34] "tGravityAccMag-STD"           
    [35] "tBodyAccJerkMag-MEAN"         
    [36] "tBodyAccJerkMag-STD"          
    [37] "tBodyGyroMag-MEAN"            
    [38] "tBodyGyroMag-STD"             
    [39] "tBodyGyroJerkMag-MEAN"        
    [40] "tBodyGyroJerkMag-STD"         
    [41] "fBodyAcc-MEAN-X"              
    [42] "fBodyAcc-MEAN-Y"              
    [43] "fBodyAcc-MEAN-Z"              
    [44] "fBodyAcc-STD-X"               
    [45] "fBodyAcc-STD-Y"               
    [46] "fBodyAcc-STD-Z"               
    [47] "fBodyAcc-MEANFreq-X"          
    [48] "fBodyAcc-MEANFreq-Y"          
    [49] "fBodyAcc-MEANFreq-Z"          
    [50] "fBodyAccJerk-MEAN-X"          
    [51] "fBodyAccJerk-MEAN-Y"          
    [52] "fBodyAccJerk-MEAN-Z"          
    [53] "fBodyAccJerk-STD-X"           
    [54] "fBodyAccJerk-STD-Y"           
    [55] "fBodyAccJerk-STD-Z"           
    [56] "fBodyAccJerk-MEANFreq-X"      
    [57] "fBodyAccJerk-MEANFreq-Y"      
    [58] "fBodyAccJerk-MEANFreq-Z"      
    [59] "fBodyGyro-MEAN-X"             
    [60] "fBodyGyro-MEAN-Y"             
    [61] "fBodyGyro-MEAN-Z"             
    [62] "fBodyGyro-STD-X"              
    [63] "fBodyGyro-STD-Y"              
    [64] "fBodyGyro-STD-Z"              
    [65] "fBodyGyro-MEANFreq-X"         
    [66] "fBodyGyro-MEANFreq-Y"         
    [67] "fBodyGyro-MEANFreq-Z"         
    [68] "fBodyAccMag-MEAN"             
    [69] "fBodyAccMag-STD"              
    [70] "fBodyAccMag-MEANFreq"         
    [71] "fBodyBodyAccJerkMag-MEAN"     
    [72] "fBodyBodyAccJerkMag-STD"      
    [73] "fBodyBodyAccJerkMag-MEANFreq" 
    [74] "fBodyBodyGyroMag-MEAN"        
    [75] "fBodyBodyGyroMag-STD"         
    [76] "fBodyBodyGyroMag-MEANFreq"    
    [77] "fBodyBodyGyroJerkMag-MEAN"    
    [78] "fBodyBodyGyroJerkMag-STD"     
    [79] "fBodyBodyGyroJerkMag-MEANFreq"
