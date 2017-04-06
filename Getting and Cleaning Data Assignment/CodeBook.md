## Source of the data
The source data originates from a project of the University of Genova: "Human Activity Recognition Using Smartphones Dataset". Visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for more information.

## Alterations
The original data set contains a set of 7352 observations for model training and 2947 observations for model testing. The variable of interest in this assignment was "activity" and values for this variable are available for all 10299 observations. Train and test data sets have been merged to create one data set containing all observations. Only the variables "activity", "subject" and technical variables that represent averages or standard deviations are contained in the tidy data set of this assignment, all other variables have been removed. The remaining variables have not been altered and are identical to the source data set.

## Variables
### activity
A factor containing one of the 6 distinguished activities: 
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### subject
A number between 1 and 30 representing the 30 subjects that participated in the study

### technical variables
Additionally, there is a set of 66 technical variables. They are a subset of the 561 variables of the original data set from the University of Genova project "Human Activity Recognition Using Smartphones Dataset". Visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for furhter information on all variables. The variables contained in this data set represent only mean and standard deviation values.

