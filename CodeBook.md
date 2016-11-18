---
title: "Code Book"
author: "Benjamin Milks"

output: html_document
---


### Code Book For The Cleaning Data Project

##Guide For Easy Understanding Of The Data

#Row Names

The data was taken from 30 subjects, with their activity being classified as one of six activities. In the row names you can see most of the row names take the form "Means for subject number", followed by a number 1-30. This corresponds to one of the subjects and it points out that the value you see is the mean of the column name. If it says "Means for subject number 5", you know that the value is subject five's mean for that column. The other rows take the form of, "Means for" and then the activity. It includes the data from all of the subjects when they were partaking in that activiity.

# Column Names 

The columns
The columns either begin with a "t" or an "f". If the name starts with a "t", it is a time measured category. For "f" they describe the categories as, "frequency domain signals". Next it either has "Body", or "Gravity". Body is the measure of the acceleration from the gyroscope with gravity subtracted. The force from gravity is always there pulling down on the phone, so it along with the total acceleration was used to estimate what the body was doing. Jerk is the derivative of acceleration, so they recorded the accelerations at different times to figure out the change of accelerations over time. This was done for linear and angular accelerations. So there will be "Acc" which means the linear acceleration, or "Gyro" which is the angular acceleration. The linear and angular accelerations were then used to figure out the change of acceleration over the time periods between recording, and these have "Jerk" in them. "Mag" is used to indicate the magnitude of the value. This corresponds to the "-x", "-y", and "-z" at the end of many column names. They indicate a direction of the acceleration or jerk. "Mag" is calculated with the formula sqrt(x^2+y^2+Z^2). Lastly there is either a "-std()" or a "-mean()" in the value. The mean means mean value, and std() means the standard deviation.

# Values Of The Means

For my data frame that is produce from "run_analysis.R", the values are the result of the function mean(), being given all of the data from the merged training and tests sets that corresponded to the row and column of the produced data set. Means and standard deviations keep the units from which they were measured. The values were all proportionally brought to be between -1 and 1. As the row names say, the data points are means, whose values come from a different data frame. 