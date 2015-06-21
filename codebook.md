

##Human Activity Recognition Using Smartphones Data Set



##Download: Data Folder, Data Set Description
 

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## Work Explanation:
#Data transformation
    run_analisys.R script is used to create a tidy data set .
   1.  Read the zip file from the link and unzip and store into the data folder
   2.  Merge training and test sets: 
        a) Test and training data (X_train.txt, X_test.txt), subject train and test data set (subject_train.txt, subject_test.txt) and activity data set (y_train.txt, y_test.txt) are merged using rbind to obtain a single data set. 
        b) Variables are labelled with the names assigned by original collectors (features.txt).
   2.   Extracts only the measurements on the mean and standard deviation for each measurement from the feature table. 
       a) Extract mean and standard deviation variable ( features_mean_sd )
       b) From the merged data set is extracted and intermediate data set with only the values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std").
   3.   Uses descriptive activity names after read data from the activities in the data set 
   -Converted all extracted variable to lower-case -Replaced - with . to make variables precise and readable 
   4.   Change the columnnames based on the merged data set and copy the merged data based on the mean and SD of subject and activity data
   5.   Crreates a second, independent tidy data set with the average of each variable for each activity and each subject
     Generated the tidy average dataset by calculating average of each mean and standard deviation feature for each activity and each subject -Written the extracted data sets to tidy-meas-extracted.txt file -Written the calculated data sets to tidy_aggregate.txt into the output folder


 
Label variables appropriately
