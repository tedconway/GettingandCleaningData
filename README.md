GettingandCleaningData
======================

Coursera Getting and Cleaning Data Course Project

__Introduction__
This project creates "tidy" datasets for the Coursera Getting and Cleaning Data course project from the Human Activity Recognition Using Smartphones Dataset.

__Original Data__
A full description of the original dataset is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

__Data Transformation__
The rules to create the "tidy" datatets are available at:
https://class.coursera.org/getdata-004/human_grading/view/courses/972137/assessments/3/submissions

__Steps Taken__
* Only the columns with means("means()" in the column name) and standard deviations("std()" in the column name) were retained from the measurements in the training ('train/X_train.txt') and test('test/X_test.txt') sets. Meaningful column names were provided for these unlabeled measures from the 'features.txt' set.

* A new column, __ActivityID__, was created from the 'train/y_train.txt' and 'test/y_test.txt' datasets. The 'activity_labels.txt' set was used to add a new column, __ActivityName__, with the corresponding description of the activity.

* A new column, __SubjectID__, was created from the 'train/subject_train.txt' and 'test/subject_test.txt' datasets.

* This first dataset is saved as R dataset __RDS1.rds__ and was not uploaded.

* Per the assignment, a second "tidy" dataset was created from the first (RDS1.rds) by taking the grouped means - by subject and activity - of all "feature" columns from RDS1.rds (i.e., means and std columns). To facilitate the use of ddply's numcolwise option, the subject and activity variables were translated to factors. ActivityName was retained from the original dataset to provide a meaningful description of the activity. This dataset, __RDS2.rds__, was uploaded to the Coursera site. 

__Code Book__
A description of the variables and data contained in the RDS2.rds dataset can be found in the GitHub repo:
https://github.com/tedconway/GettingandCleaningData
In file:
https://github.com/tedconway/GettingandCleaningData/blob/master/CodeBook.md

__Script__
The script that created both R datasets can be found in GitHub repo:
https://github.com/tedconway/GettingandCleaningData
The R code is in:
https://github.com/tedconway/GettingandCleaningData/blob/master/run_analysis.R
