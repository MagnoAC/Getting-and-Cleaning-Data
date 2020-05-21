# CodeBook

This CodeBook describes all the variables used on this project.

## The data

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

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

##run_analysis.R Variables

'trainx': X_train.txt read into R.

'trainy': y_train.txt read into R. It contains the activity Ids classified on 'activity_labels.txt'

'sub_train':'subject_train.txt' read into R. it contains the subjects ids

'train': all train datasets merged

'testx': X_train.txt read into R

'testy': y_testy.txt read into R. It contains the activity Ids classified on 'activity_labels.txt'

'sub_test':'subject_test.txt' read into R. it contains the subjects ids

'test': all test datasets merged

'features': features.txt read into R.

'df': primary data_frame containing the merged train and test data, arranged by subject.

'newnames': auxiliar variable used to substitute the features of the variables measured
'oldnames': features ids to be substituted

'df1':  final data frame generated for step 1

'df2': data frame after conclusion of step 2

'af': factor variable used to substitute "activityId" to the described activites.

'df3': data frame after conclusion of step 3

'tdf': tidy data frame resulted after conclusion of step 4

'avg_tdf': tidy data frame with the averages resulted from step 5.

