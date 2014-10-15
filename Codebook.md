## Explanation of Variables 

**Activity:** 
The six activities experimenters studied are as follows:  

* Walking  
* Walking upstairs  
* Walking downstairs  
* Sitting  
* Standing  
* Laying  

**Subjects:**
Subjects consisted of 30 volunteers between the ages of 19-48.

**The calculations that were made for these activity/subject combinations are as follows:**  

* mean: Mean value  
* std: Standard deviation

**For each of these variables (each X,Y, and Z contain a separate measurement):**

* TimeBodyAcc-XYZ  
* TimeBodyAccJerk-XYZ  
* TimeBodyGyro-XYZ  
* TimeBodyGyroJerk-XYZ  
* TimeBodyAccMag  
* TimeGravityAccMag    
* TimeBodyAccJerkMag  
* TimeBodyGyroMag  
* TimeBodyGyroJerkMag  
* FreqBodyAcc-XYZ  
* FreqBodyAccJerk-XYZ  
* FreqBodyGyro-XYZ  
* FreqBodyAccMag  
* FreqBodyAccJerkMag  
* FreqBodyGyroMag  
* FreqBodyGyroJerkMag  

The variables selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals TimeAcc-XYZ and TimeGyro-XYZ. These time domain signals (prefix 'Time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccJerk-XYZ and TimeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccMag, TimeGravityAccMag, TimeBodyAccJerkMag, TimeBodyGyroMag, TimeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FreqBodyAcc-XYZ, FreqBodyAccJerk-XYZ, FreqBodyGyro-XYZ, FreqBodyAccJerkMag, FreqBodyGyroMag, FreqBodyGyroJerkMag. (Note the 'Freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
