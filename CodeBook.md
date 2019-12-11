# Code book for Coursera *Getting and Cleaning Data* course project

The data set that this code book pertains to is located in the `FinalData.txt` file of this repository.

See the `README.md` file of this repository for background information on this data set.

The structure of the data set is described in the [Data](#data) section, its variables are listed in the [Variables](#variables) section, and the transformations that were carried out to obtain the data set based on the source data are presented in the [Transformations](#transformations) section.

## Data <a name=data></a>

The `FinalData.txt` data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the [Variables](#variables) section, and the following rows contain the values of these variables. 

## Variables <a name=variables></a>

Each row contains, for a given subject and activity, 66 averaged measurements.

### Identifiers <a name=identifiers></a>

- `subject`

	Subject identifier, integer, ranges from 1 to 30.

- `activity`

	Activity identifier, string with 6 possible values: 
	- `WALKING`: subject was walking
	- `WALKING_UPSTAIRS`: subject was walking upstairs
	- `WALKING_DOWNSTAIRS`: subject was walking downstairs
	- `SITTING`: subject was sitting
	- `STANDING`: subject was standing
	- `LAYING`: subject was laying

### Time-domain signals

- Average time-domain body acceleration in the X, Y and Z directions:

        - TimeBodyAccelerometerMeanX
        - TimeBodyAccelerometerMeanY 
        - TimeBodyAccelerometerMeanZ 

- Standard deviation of the time-domain body acceleration in the X, Y and Z directions:

        -TimeBodyAccelerometerSTDX
        -TimeBodyAccelerometerSTDY 
        -TimeBodyAccelerometerSTDZ 

- Average time-domain gravity acceleration in the X, Y and Z directions:

        - TimeGravityAccelerometerMeanX 
        - TimeGravityAccelerometerMeanY 
        - TimeGravityAccelerometerMeanZ
        
- Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions:

        - TimeGravityAccelerometerSTDX 
        - TimeGravityAccelerometerSTDY 
        - TimeGravityAccelerometerSTDZ 

- Average time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

        -TimeBodyAccelerometerJerkMeanX 
        -TimeBodyAccelerometerJerkMeanY 
        -TimeBodyAccelerometerJerkMeanZ 

- Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

        -TimeBodyAccelerometerJerkSTDX 
        -TimeBodyAccelerometerJerkSTDY 
        -TimeBodyAccelerometerJerkSTDZ 

- Average time-domain body angular velocity in the X, Y and Z directions:

        -TimeBodyGyroscopeMeanX 
        -TimeBodyGyroscopeMeanY 
        -TimeBodyGyroscopeMeanZ 

- Standard deviation of the time-domain body angular velocity in the X, Y and Z directions:

        -TimeBodyGyroscopeSTDX 
        -TimeBodyGyroscopeSTDY 
        -TimeBodyGyroscopeSTDZ 

- Average time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:

        -TimeBodyGyroscopeJerkMeanX 
        -TimeBodyGyroscopeJerkMeanY 
        -TimeBodyGyroscopeJerkMeanZ 

- Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:

        -TimeBodyGyroscopeJerkSTDX 
        -TimeBodyGyroscopeJerkSTDY 
        -TimeBodyGyroscopeJerkSTDZ 

- Average and standard deviation of the time-domain magnitude of body acceleration:

        -TimeBodyAccelerometerMagnitudeMean 
        -TimeBodyAccelerometerMagnitudeSTD 

- Average and standard deviation of the time-domain magnitude of gravity acceleration:

       		TimeGravityAccelerometerMagnitudeMean 
		TimeGravityAccelerometerMagnitudeSTD 
        
Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time):

        -TimeBodyAccelerometerJerkMagnitudeMean                                  
	-TimeBodyAccelerometerJerkMagnitudeSTD 

- Average and standard deviation of the time-domain magnitude of body angular velocity:

        -TimeBodyGyroscopeMagnitudeMean 
        -TimeBodyGyroscopeMagnitudeSTD 

- Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):

        -TimeBodyGyroscopeJerkMagnitudeMean 
        -TimeBodyGyroscopeJerkMagnitudeSTD 

### Frequency-domain signals

- Average frequency-domain body acceleration in the X, Y and Z directions:

        FrequencyBodyAccelerometerMeanX 
        FrequencyBodyAccelerometerMeanY 
        FrequencyBodyAccelerometerMeanZ 

- Standard deviation of the frequency-domain body acceleration in the X, Y and Z directions:

        FrequencyBodyAccelerometerSTDX 
        FrequencyBodyAccelerometerSTDY 
        FrequencyBodyAccelerometerSTDZ 

- Weighted average of the frequency components of the frequency-domain body acceleration in the X, Y and Z directions:

        FrequencyBodyAccelerometerJerkMeanX 
        FrequencyBodyAccelerometerJerkMeanY 
        FrequencyBodyAccelerometerJerkMeanZ 

- Average frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

        FrequencyBodyAccelerometerJerkSTDX 
        FrequencyBodyAccelerometerJerkSTDY 
        FrequencyBodyAccelerometerJerkSTDZ 

- Standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

        FrequencyBodyGyroscopeMeanX 
        FrequencyBodyGyroscopeMeanY 
        FrequencyBodyGyroscopeMeanZ 

- Weighted average of the frequency components of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

        FrequencyBodyGyroscopeSTDX 
        FrequencyBodyGyroscopeSTDY 
        FrequencyBodyGyroscopeSTDZ 

- Average and standard deviation of the Frequency magnitude of body acceleration:

	FrequencyBodyAccelerometerMagnitudeMean
	FrequencyBodyAccelerometerMagnitudeSTD 

- Average and standard deviation of the Frequency magnitude of body acceleration jerk:

        FrequencyBodyAccelerometerJerkMagnitudeMean 
        FrequencyBodyAccelerometerJerkMagnitudeSTD 

- Average and standard deviation of the Frequency magnitude of body gyroscope:

        FrequencyBodyGyroscopeMagnitudeMean 
        FrequencyBodyGyroscopeMagnitudeSTD 

- Average and standard deviation of the Frequency magnitude of body gyroscope jerk:

        FrequencyBodyGyroscopeJerkMagnitudeMean
		FrequencyBodyGyroscopeJerkMagnitudeSTD

## Transformations <a name=transformations></a>

The zip file containing the source data is located at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The following transformations were applied to the source data:

1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the data set
4. Appropriately labeled the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

