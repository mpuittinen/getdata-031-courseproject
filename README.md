# getdata-031-courseproject
Coursera "Cleaning Data" course project
Human Activity Recognition Using Smartphones Dataset

## Dataset description

The dataset tidydata.txt is based on measurement data available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip [1]
The variables in the dataset are:

	subject : test person involved
	activity : activity performed (STANDING, WALKING, ...)

and the following values (means of the original measurements) for each subject / activity pair:

	tBodyAcc-XYZ mean and standard deviation (std)
	tGravityAcc-XYZ mean and standard deviation (std)
	tBodyAccJerk-XYZ mean and standard deviation (std)
	tBodyGyro-XYZ mean and standard deviation (std)
	tBodyGyroJerk-XYZ mean and standard deviation (std)
	tBodyAccMag mean and standard deviation (std)
	tGravityAccMag mean and standard deviation (std)
	tBodyAccJerkMag mean and standard deviation (std)
	tBodyGyroMag mean and standard deviation (std)
	tBodyGyroJerkMag mean and standard deviation (std)
	fBodyAcc-XYZ mean and standard deviation (std)
	fBodyAccJerk-XYZ mean and standard deviation (std)
	fBodyGyro-XYZ mean and standard deviation (std)
	fBodyAccMag mean and standard deviation (std)
	fBodyAccJerkMag mean and standard deviation (std)
	fBodyGyroMag mean and standard deviation (std)
	fBodyGyroJerkMag mean and standard deviation (std)

A more detailed description of the measurement methodolofy for the original dataset can be found in "features_info.txt" for the original dataset

## Recreating the tidy dataset

You can re-create the tidy dataset with the following sequence in RStudio (replace path_to_run_analysis with the actual path to the script):

	1. download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
	2. unzip("data.zip")
	3. setwd("UCI HAR Dataset") 
	4. source("DataScience/CleaningData/getdata-031-courseproject/run_analysis.R")

The resulting dataset will be available in tidyset

## Script logic

The script run_analysis does the following:

	1. For the train and test datasets, combines the test data (X_*.txt in the original datasets) with the activity variables (y_*.txt) and the subject variables (subject_*.txt). Only the mean and std deviation measurements are read from the original files.
	2. Merges the train and test datasets into one dataset
	3. Sets the merged dataset columns (based on features.txt in the original data)
	4. Assigns the activity labels (WALKING, ...) based on the activity (1,2,3...) set in step 1
	5. Using the "dplyr" package, groups the resulting dataset by activity and subject and calculates the mean value for each variable

## References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


