setwd("Dropbox/Coursera/Getting and Cleaning Data/UCI HAR Dataset")
library(dplyr)

var_names<-read.table("features.txt")

testdata<-read.table("test/X_test.txt")
names(testdata)<-var_names$V2
testsubjects<-read.table("test/subject_test.txt")
names(testsubjects)<-"subject"
testlabels<-read.table("test/y_test.txt")
names(testlabels)<-"activity_cd"
testdata2<-cbind(testsubjects,testlabels,testdata)

traindata<-read.table("train/X_train.txt")
names(traindata)<-var_names$V2
trainsubjects<-read.table("train/subject_train.txt")
names(trainsubjects)<-"subject"
trainlabels<-read.table("train/y_train.txt")
names(trainlabels)<-"activity_cd"
traindata2<-cbind(trainsubjects,trainlabels,traindata)

full_data<-rbind(testdata2,traindata2)

correct_columns<-grep('mean\\(|std|subject|activity',names(full_data))

full_data_2<-full_data[,correct_columns]

activities<-read.table("activity_labels.txt")
names(activities)<-c("activity_cd","activity")

full_data_3<-select(inner_join(full_data_2,activities,"activity_cd"),-activity_cd)
full_data_4<-group_by(full_data_3,subject,activity)

final<-summarize_each(full_data_4,funs(mean))

write.table(final,"final_tidy_data.txt",row.names=FALSE)