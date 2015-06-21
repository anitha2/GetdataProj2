runanalysis <- function() {

      library(RCurl)
      
        dataFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
        dir.create('./data/UCI HAR Dataset')
        download.file(dataFile, './data/UCI-HAR-dataset.zip', method='auto')
        unzip('./data/UCI-HAR-dataset.zip')
  
	## 1.read training and test of X , Y and subject from the folder

	x_train <- read.table('./data/UCI HAR Dataset/train/X_train.txt')
	x_test <- read.table('./data/UCI HAR Dataset/test/X_test.txt')
	x <- rbind(x_train, x_test)

	subj_train <- read.table('./data/UCI HAR Dataset/train/subject_train.txt')
	subj_test <- read.table('./data/UCI HAR Dataset/test/subject_test.txt')
	subj <- rbind(subj_train, subj_test)

	y_train <- read.table('./data/UCI HAR Dataset/train/y_train.txt')
	y_test <- read.table('./data/UCI HAR Dataset/test/y_test.txt')
	y <- rbind(y_train, y_test)

	# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
	features <- read.table('./data/UCI HAR Dataset/features.txt')
	features_mean_sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

	###Combine feature and subject
	combine <- x[, features_mean_sd]

	# 3.Uses descriptive activity names to name the activities in the data set


	names(combine) <- gsub("\\(|\\)", "", tolower(features[features_mean_sd, 2]))

	activities <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

	activities[, 2] <- gsub("_", "", tolower(as.character(activities[, 2])))

	y[, 1] = activities[y[, 1], 2]
	colnames(y) <- 'activity'
	colnames(subj) <- 'subject'

	# 4. Appropriately labels the data set with descriptive activity names.
	data <- cbind(subj, combine, y) 
	write.table(data, './output/tidy_combine_mean_sdalone.txt', row.names = F)

	#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	tidyavg <- aggregate(x=data, by=list(activities=data$activity, subj=data$subject), FUN=mean)
	tidyavg <- tidyavg[, !(colnames(tidyavg) %in% c("subj", "activity"))]
	write.table(data, './output/tidy_aggregate.txt', row.names = F)

	  cat("./output/tidy_aggregate.txt has been saved in", getwd())
}
runanalysis()