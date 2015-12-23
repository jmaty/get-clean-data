library(reshape2)

# -----------------------------------------------------------------------------
# STEP 0: Prepare data
# -----------------------------------------------------------------------------

# Read features
features <- read.table("features.txt")

# Read activity labels
activity_labels <- read.table("activity_labels.txt")

# Read train data
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

# Read test data
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

# Label the training data set with descriptive variable names
names(subject_train) <- "subjectID"
names(y_train) <- "activity"
names(X_train) <- features$V2

# Label the test data set with descriptive variable names
names(subject_test) <- "subjectID"
names(y_test) <- "activity"
names(X_test) <- features$V2

# -----------------------------------------------------------------------------
# STEP 1: Merges the training and the test sets to create one data set
# -----------------------------------------------------------------------------
train_data <- cbind(subject_train, y_train, X_train)
test_data <- cbind(subject_test, y_test, X_test)
data <- rbind(train_data, test_data)

# -----------------------------------------------------------------------------
# STEP 2: Extracts only the measurements on the mean and standard deviation for
#         each measurement
# -----------------------------------------------------------------------------

# Regular expression for keeping only mean and stdev related measurements
meanstd_regexp <- ".*mean.*|.*std.*"

# Filter variables related to mean and stdev related measurements
meanstd_cols <- grepl(meanstd_regexp, names(data))

# Keep only variables related to mean and stdev related measurements plus
# subjectID and activity columns
data <- data[c("subjectID", "activity", names(data[meanstd_cols]))]

# -----------------------------------------------------------------------------
# STEP 3: Uses descriptive activity names to name the activities in the data set
# -----------------------------------------------------------------------------
data$activity <- factor(data$activity, labels=activity_labels$V2)

# -----------------------------------------------------------------------------
# STEP 4: Appropriately labels the data set with descriptive variable names
# -----------------------------------------------------------------------------

# This step was already performed within the previous steps

# -----------------------------------------------------------------------------
# STEP 5: From the data set in step 4, creates a second, independent tidy data
#         set with the average of each variable for each activity and each subject
# -----------------------------------------------------------------------------

# Melt data for each subject and activity
melted_data <- melt(data, id=c("subjectID", "activity"))

# Make tidy data by averaging each variable for each activity and each subject
tidy_data <- dcast(melted_data, subjectID+activity ~ variable, mean)

# Write the tidy data to a CSV file
write.table(tidy_data, "tidy.txt", row.names=FALSE, quote=FALSE)
