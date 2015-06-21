

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
   4.   Change the columnnames based on the merged data set and copy the merged data based on the mean and SD of subject and activity data. The column names are named appropriately based on labels.
   5.   Creates a second, independent tidy data set with the average of each variable for each activity and each subject
     Generated the tidy average dataset by calculating average of each mean and standard deviation feature for each activity and each subject -Written the extracted data sets to tidy-meas-extracted.txt file -Written the calculated data sets to tidy_aggregate.txt into the output folder


Column Names in the output file was:
names(tidyavg)
 [1] "activities"                "subject"                  
 [3] "tbodyacc-mean-x"           "tbodyacc-mean-y"          
 [5] "tbodyacc-mean-z"           "tbodyacc-std-x"           
 [7] "tbodyacc-std-y"            "tbodyacc-std-z"           
 [9] "tgravityacc-mean-x"        "tgravityacc-mean-y"       
[11] "tgravityacc-mean-z"        "tgravityacc-std-x"        
[13] "tgravityacc-std-y"         "tgravityacc-std-z"        
[15] "tbodyaccjerk-mean-x"       "tbodyaccjerk-mean-y"      
[17] "tbodyaccjerk-mean-z"       "tbodyaccjerk-std-x"       
[19] "tbodyaccjerk-std-y"        "tbodyaccjerk-std-z"       
[21] "tbodygyro-mean-x"          "tbodygyro-mean-y"         
[23] "tbodygyro-mean-z"          "tbodygyro-std-x"          
[25] "tbodygyro-std-y"           "tbodygyro-std-z"          
[27] "tbodygyrojerk-mean-x"      "tbodygyrojerk-mean-y"     
[29] "tbodygyrojerk-mean-z"      "tbodygyrojerk-std-x"      
[31] "tbodygyrojerk-std-y"       "tbodygyrojerk-std-z"      
[33] "tbodyaccmag-mean"          "tbodyaccmag-std"          
[35] "tgravityaccmag-mean"       "tgravityaccmag-std"       
[37] "tbodyaccjerkmag-mean"      "tbodyaccjerkmag-std"      
[39] "tbodygyromag-mean"         "tbodygyromag-std"         
[41] "tbodygyrojerkmag-mean"     "tbodygyrojerkmag-std"     
[43] "fbodyacc-mean-x"           "fbodyacc-mean-y"          
[45] "fbodyacc-mean-z"           "fbodyacc-std-x"           
[47] "fbodyacc-std-y"            "fbodyacc-std-z"           
[49] "fbodyaccjerk-mean-x"       "fbodyaccjerk-mean-y"      
[51] "fbodyaccjerk-mean-z"       "fbodyaccjerk-std-x"       
[53] "fbodyaccjerk-std-y"        "fbodyaccjerk-std-z"       
[55] "fbodygyro-mean-x"          "fbodygyro-mean-y"         
[57] "fbodygyro-mean-z"          "fbodygyro-std-x"          
[59] "fbodygyro-std-y"           "fbodygyro-std-z"          
[61] "fbodyaccmag-mean"          "fbodyaccmag-std"          
[63] "fbodybodyaccjerkmag-mean"  "fbodybodyaccjerkmag-std"  
[65] "fbodybodygyromag-mean"     "fbodybodygyromag-std"     
[67] "fbodybodygyrojerkmag-mean" "fbodybodygyrojerkmag-std" 
