# Getting-and-Cleaning-Data-Final-Assignment
Course end project of Coursera's 'Getting and Cleaning Data' course
The objective of the assignment was to get a tidy data set from the data provided through this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The Analysis in detail:<br>
First the zipped file is downloaded and unzipped <br>
After that the working directory of RStudio is set in this unzipped folder<br>
The R script run_analysis.R does following things:<br>
* Reading the data from the unzipped folder in R
* Finding and removing irrelevant features from the training and testing datasets
* Merging the training and testing data
* Labeling with appropriate data labels to the variable
* Changing 'Activities' to descriptive names
* Creating a second, independent tidy data set with the average of each variable for each activity and each subject

## To run the R script run_analysis.R:<br>
* Download the dataset from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip the folder to 'UCI HAR Dataset'
* Open RStudio and set the working directory in this folder
* Run the script and at the end tidydata.txt will be formed in this working directory
