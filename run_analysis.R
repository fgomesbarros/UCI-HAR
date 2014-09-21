### Coursera
### Data Science Specialization
### Getting and Cleaning Data - getdata007

# Read needed libraries
library(reshape2)

## STEP 1 - Appropriately labels the data set with descriptive variable names. 

# Get the variable names from the features file.
var_names <- read.table("UCI HAR Dataset/features.txt", as.is = TRUE)
var_names <- var_names[, 2]

## STEP 2 - Merges the training and the test sets to create one data set.

# Read the test files. Set the column names with the apropriate labels.
X_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt", 
                            col.names = var_names,
                            check.names = FALSE,
                            colClasses= "numeric",  
                            stringsAsFactors = FALSE)
y_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt", 
                            col.names = "Activity")
subject_test  <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", 
                            col.names = "Subject",
                            colClasses = "numeric")

# Reading the train files. Set the column names with the apropriate labels.
X_train  <- read.table(file = "UCI HAR Dataset/train/X_train.txt",
                            col.names = var_names,
                            check.names = FALSE,
                            colClasses= "numeric",  
                            stringsAsFactors = FALSE)
y_train  <- read.table(file = "UCI HAR Dataset/train/y_train.txt", 
                            col.names = "Activity")
subject_train  <- read.table(file = "UCI HAR Dataset/train/subject_train.txt",
                             col.names = "Subject",
                             colClasses = "numeric")

# Create the test and train data sets.
df_test  <- cbind.data.frame(subject_test, y_test, X_test)
df_train  <- cbind.data.frame(subject_train, y_train, X_train)

# Merge the test and train sets.
uci_har_df <- rbind.data.frame(df_test, df_train)

## STEP 3 - Uses descriptive activity names to name the activities in the data set

# Get the activity labels
activity_labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt")
activity_labels <- activity_labels[, 2]

# Transform the Activity column in a factor, using the activity labels.
uci_har_df$Activity  <- factor(uci_har_df$Activity, labels = activity_labels)

## STEP 4 - Extracts only the measurements on the mean and standard deviation 
## for each measurement.

# Calculate the indexes of the columns corresponding the required measurements:
# mean() and std() and also the columns "Subject" and "Activity". 
var_names <- colnames(uci_har_df)
column_index <- grep("Subject|Activity|mean\\(\\)|std\\(\\)", var_names)

# Apply a filter in the data set, selecting the required variables.
uci_har_df <- uci_har_df[, column_index]

## STEP 5 - From the data set in step 4, creates a second, independent tidy data
## set with the average of each variable for each activity and each subject.

# Get the variable names to be calculated.
var_names <- colnames(uci_har_df)
var_names <- var_names[3:length(var_names)]

# Melt the UCI-HAR data frame.
uci_har_melt  <- melt(data = uci_har_df, id=c("Subject", "Activity"),
                      measure.vars = var_names)

# Cast the molten data frame, creating the tidy data.
uci_har_td <- dcast(data = uci_har_melt, 
                            formula = Subject + Activity ~ variable, 
                            fun.aggregate = mean)

# Order the tidy data by Subject.
uci_har_td <- uci_har_td[order(uci_har_td$Subject), ]

# Write the tidy data in a file.
write.table(uci_har_td, file = "UCI-HAR-TidyData.txt", row.names = FALSE)