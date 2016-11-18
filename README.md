# GettingAndCleaningData
Benjamin Milks's project for Getting and Cleaning Data
## Overview

I preformed a cleaning of data on a data set that was collected from Samsung Galaxy cell phones. The data was taken from 30 people who had their movements tracked in all directions, along with their activities, over time. I wrote a script called, "run_analysis.R" that takes the big data file in its raw form and turns it into a big data frame. It then takes the names of all of the variables from the files, and puts them as column names for the data frame. The columns that are not desired in the end data frame are then removed. Next, the activity and subject number are added to the data frame. From this I create a new data frame that has 36 rows, 1 of each of the 30 subjects and  6 activities. The Columns are filled out with the average of the data from that column in the original data frame, but it only includes the data corresponding to the specified subject or activity. The row names are then set properly, and the dataframe of averages is returned from the function "runanalysis". I have a codebook "CodeBook.md" that explains all of the column and row names, and all other relevant information. The download for the original data can be found using the link, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. All of my .md and .R files can be found in the following repository https://github.com/Diogenes2/GettingAndCleaningData.

## Notes

I did this project for a class called Getting and Cleaning Data. Thank you for reading my work. 
