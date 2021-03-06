#Merge X_train.txt and X_test.txt
xtrain = read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
xtest = read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
xall = rbind(xtrain, xtest)

#Add column names: the feature names. Retain only columns with "mean" or "std"
#but not "meanF", to exclude meanFrequency
features = read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = F)
colnames(xall) = features$V2
xallslim = xall[,grep("mean[^F]|std", names(xall))]

#Merge train and test activity vectors and make it a factor with descrpitive levels
ytrain = read.table("./UCI HAR Dataset/train/Y_train.txt")
ytest = read.table("./UCI HAR Dataset/test/Y_test.txt")
yall = c(ytrain$V1, ytest$V1)
activities = as.factor(yall)
levels(activities) = c("walk", "upstairs", "downstairs", "sit", "stand", "lay")

#Add activities and subjets as a column to xallslim
xallslim$activity = activities
sbjtrain = read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = "integer")
sbjtest = read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = "integer")
sbjall = c(sbjtrain$V1, sbjtest$V1)
xallslim$subject = sbjall

#xallslim is now a tidy data set and can be stored
write.table(xallslim, "X_all_tidy.txt", row.names = F)

#Create tidy data sets for the averages by activity and subject
meansbyactsbj = aggregate.data.frame(xallslim[,1:66], list(xallslim$activity, xallslim$subject), mean)
names(meansbyactsbj)[1] = "activity"
names(meansbyactsbj)[2] = "subject"

#meansbyactsbj is a tidy data set and can be stored
write.table(meansbyactsbj, "featuremeansbyactivitysubject.txt", row.names = F)
meansbyactsbj
