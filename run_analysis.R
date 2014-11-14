## read files

setwd("C:/Users/Jose/Dropbox/Coursera/Data Science/Getting and cleaning data/UCI HAR Dataset")

features = read.table("features.txt",header=FALSE)
activityLabels = read.table("activity_labels.txt",header=FALSE)
subjectTest = read.table("./test/subject_test.txt",header=FALSE)
xTest = read.table("./test/x_test.txt",header=FALSE)
yTest = read.table("./test/y_test.txt",header=FALSE)
subjectTrain = read.table("./train/subject_train.txt",header=FALSE)
xTrain = read.table("./train/x_train.txt",header=FALSE)
yTrain = read.table("./train/y_train.txt",header=FALSE)

## label columns

colnames(xTest) = features$V2
colnames(xTrain) = features$V2
colnames(yTest) = "activity"
colnames(yTrain) = "activity"
colnames(subjectTest) = "subject"
colnames(subjectTrain) = "subject"

## extract measurements for mean and sd

colwithmean = grep("mean()", features$V2)
colwithstd = grep("std()", features$V2)
colwithmeanorstd = c(colwithmean, colwithstd)
xTrainmeanstd = xTrain[ , colwithmeanorstd]
xTestmeanstd = xTest[ , colwithmeanorstd]

## merge train and test sets

trainCombined = cbind(subjectTrain,yTrain, xTrainmeanstd)
testCombined = cbind(subjectTest,yTest, xTestmeanstd)
dataCombined = rbind(trainCombined, testCombined)

## introduce descriptive names for the different activities

colnames(activityLabels)[1] = "activity"
dataCombined = merge(dataCombined, activityLabels)
dataCombined$activity = NULL
colnames(dataCombined)[81] = "activity"

##  create a tidy data set with the average of each variable for each activity and each subject

tidySet = aggregate(dataCombined[,names(dataCombined) != "subject" & names(dataCombined) != "activity"], list(subject = dataCombined$subject, activity = dataCombined$activity), mean)
write.table(tidySet, "run_analysis.txt", row.name = FALSE)

