# Getting and Cleaning Data Course Project

This R script and all associated files and datasets were created as part of the course project for the Johns Hopkins Coursera course "Getting and Cleaning Data." 

Data were obtained from the Human Activity Recognition Using Smartphones Dataset, version 1.0, from Smartlab at Universit degli Studi di Genova in Genoa, Italy. More information about these data can be found by contacting activityrecognition@smartlab.ws

Their description of the data are as follows:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

"For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment"

# Updates made for Coursera Project:

To accomplish the goals of this project and create a tidy dataset in .txt format, the included R script follows the following steps:
- Set the working directory to the folder containing the appropriate datasets
- Load the dplyr library
- read in the "features.txt" file and assign this to a list called var_names
- For the test and training datasets:
  - Read in the dataset
  - set the variable names of this dataset from the var_names list created above
  - read in the list of subjects and assign the variable name as "subject"
  - read in the list of activity codes and assign the variable name as "activity_cd"
  - Column-bind these two datasets (subjects and activity codes) to the test/train dataset
- Row-bind the test and training sets together
- Create a list of the appropriate column names to keep, using the grep function, keeping columns with the substrings "mean(", "std", "subject", or "activity"
- Limit the dataset to just include these columns, using the select function
- Group this dataset by subject and activity
- Summarize the dataset by calculating the mean for each variable, by subject and activity
- Write the final table to a .txt file called "final_tidy_data.txt"
