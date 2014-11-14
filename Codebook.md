# Codebook Project Getting and Cleaning Data
josebescos  
This project is part of the "Getting and Cleaning Data" Coursera course, taught by John Hopkins University. Its purpose is "to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis."


### Process followed

####Raw data

We start with the raw data (data collected from the accelerometers from the Samsung Galaxy S smartphone, and found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).)

As specified by the data collectors, the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

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

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sam

NOTE: The run_analysis.R file shows how we have previously unzipped the data and located the files in our working directory. In that sense, to reproduce the process we will have to change "C:/Users/Jose/Dropbox/Coursera/Data Science/Getting and cleaning data/UCI HAR Dataset" in line 3 to our own working directory.

####Descriptive labels

While the different features where correctly identified, the subject and activity labels where missing. We solve that situation (lines 14-21 )

####Limiting measurements for mean and sd

As instructed, we reduce the dataset to those features expressing mean and standard deviation (lines 23-29). 

####Merge train and test sets

From this point (lines 31-35) we work with a unified, mean-sd simplified, well-labeled data frame ("dataCombined").

####Introducing descriptive names for the different activities

In our main data frame the activities are identified by id. We combine dataCombined with the table relating ids to the descriptions of activities and we substitute ids by descriptive names (we eliminate the activity id columns, since it becomes redundant). We do this in lines 37-42

####Create a tidy data set

Finally, we create a tidy data set ("tidySet") with the average of each variable for each activity and each subject and we save it in our working directory as "run_analysis.txt". We do these operations in lines 44-47.

"run_analysis.txt" is the outcome required in the project specifications.






