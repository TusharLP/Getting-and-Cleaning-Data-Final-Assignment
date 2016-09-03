## The working directory should be set in the unzipped folder

# Reading the data from the unzipped folder in R
X_train <- read.table("./train/X_train.txt")
X_test <- read.table("./test/X_test.txt")
y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")
subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")
features <- read.table("features.txt")


# Changing the class of 'features' to character so as to
# use text manipulation functions on it
features[, 2] <- as.character(features[, 2])


# Finding the relevant features, that is mean and
# standard deviation of each measurement
relevant.features.indices <- grep("mean|std", features[, 2])
relevant.features.names <- features[relevant.features.indices,2]


# Removing irrelevant features from the training and
# testing datasets
X_train <- X_train[, relevant.features.indices]
X_test <- X_test[, relevant.features.indices]


# Merging the training data
train <- cbind(subject_train, y_train, X_train)


# Similarly merging the testing data
test <- cbind(subject_test, y_test, X_test)


# Merging the training and testing data as required in
# the assignment
merged.data <- rbind(train, test)


# Making variable names more descriptive
relevant.features.names <- gsub('mean', 'MEAN', relevant.features.names)
relevant.features.names <- gsub('std', 'STD', relevant.features.names)
relevant.features.names <- gsub('[()]', '', relevant.features.names)


# Labeling with appropriate data labels to the variable
colnames(merged.data) <- c('Subject', 'Activities', relevant.features.names)


# Changing the class of 'Activities' column of
# 'merged.data' to character so as to use text
# manipulation functions on it
merged.data$Activities <- as.character(merged.data$Activities)


# Changing 'Activities' to descriptive names
merged.data[merged.data$Activities == '1',2] <- 'Walking'
merged.data[merged.data$Activities == '2',2] <- 'Walking_Upstairs'
merged.data[merged.data$Activities == '3',2] <- 'Walking_Downstairs'
merged.data[merged.data$Activities == '4',2] <- 'Sitting'
merged.data[merged.data$Activities == '5',2] <- 'Standing'
merged.data[merged.data$Activities == '6',2] <- 'Laying'


# Changing class of 'Activities' and 'Subject' to factor
merged.data$Activities <- as.factor(merged.data$Activities)
merged.data$Subject <- as.factor(merged.data$Subject)


# Splitting the 'merged.data' according the 'Subject'
split.data <- split(merged.data, merged.data$Subject)


# Finding means of the variables according to 'Acitivities'
# in all the split datasets and creating its dataframe
for (i in 1:30) {
  if (i == 1){
    mean.data <- data.frame(Subject = split.data[[i]][2,1], Activities = 'Walking', t(colMeans(split.data[[i]][split.data[[i]]$Activities == 'Walking', 3:81])))
    mean.data$Activities <- as.character(mean.data$Activities)
  }
  else {
    mean.data <- rbind(mean.data, c(split.data[[i]][2,1], 'Walking', colMeans(split.data[[i]][split.data[[i]]$Activities == 'Walking', 3:81])))
  }
  mean.data <- rbind(mean.data, c(split.data[[i]][2,1], 'Walking_Upstairs', colMeans(split.data[[i]][split.data[[i]]$Activities == 'Walking_Upstairs', 3:81])))
  mean.data <- rbind(mean.data, c(split.data[[i]][2,1], 'Walking_Downstairs', colMeans(split.data[[i]][split.data[[i]]$Activities == 'Walking_Downstairs', 3:81])))
  mean.data <- rbind(mean.data, c(split.data[[i]][2,1], 'Sitting', colMeans(split.data[[i]][split.data[[i]]$Activities == 'Sitting', 3:81])))
  mean.data <- rbind(mean.data, c(split.data[[i]][2,1], 'Standing', colMeans(split.data[[i]][split.data[[i]]$Activities == 'Standing', 3:81])))
  mean.data <- rbind(mean.data, c(split.data[[i]][2,1], 'Laying', colMeans(split.data[[i]][split.data[[i]]$Activities == 'Laying', 3:81])))
}


# Writing the 'mean.data' data frame into a file
write.table(mean.data, file = 'tinydata.txt', row.names = FALSE)


#####################################################