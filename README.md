#Getting and Cleaning Data Project
1. Download [(click this link)](
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip the file (you will get a folder named "UCI HAR Dataset")
2. Move [run_analysis.R](https://github.com/geyecha/CleaningDataCourseProject/blob/master/run_analysis.R) into "UCI HAR Dataset"
3. Fire up RStudio (or R)
4. Make sure "data.table" library has been installed (try command `library(data.table)`). If it has not been installed, please install it by using command `install.packages("data.table")`
5. Make sure your working directory is "UCI HAR Dataset".
6. Use `source("run_analysis.R")` to get merged dataset and tidy dataset required by this project. One result file, `tidyData_mean_of_each_SubjectAndActivity.txt`, will be generated in your working directory. This result file is the tidy dataset required to upload and it has 68 columns and 180 rows.
7. To read the tidy data, use command `read.table("tidyData_mean_of_each_SubjectAndActivity.txt")`
