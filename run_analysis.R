####OBJECTIVES####

#Merges the training and the test sets to create one data set.#

#Extracts only the measurements on the mean and standard deviation for each measurement.#

#Uses descriptive activity names to name the activities in the data set#

#Appropriately labels the data set with descriptive variable names.#

#From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.#


####PROJECT####


#Libraries

library(plyr)
library(dplyr)
library(tidyr)

#Setting working Directory

if (getwd() != "C:/Users/arthu/Documents/Obtaining and Cleaning Data/UCI HAR Dataset"){
setwd('./Obtaining and Cleaning Data/UCI HAR Dataset/')
}

#Train DataSet - Reading and Primarily Tidying

trainx <- data.table::fread('./train/X_train.txt',
                            sep = " ",
                            col.names = as.character(c(1:561)))
trainy <- data.table::fread('./train/y_train.txt',
                            sep = " ",
                            col.names = "activity")
sub_train <- mutate(data.table::fread('./train/subject_train.txt',
                            sep = " ",
                            col.names = "subject"), datatype = "train")

train <- cbind(sub_train,trainy,trainx)

#Test DataSet - Reading and Primarily Tidying

testx <- data.table::fread('./test/X_test.txt',
                            sep = " ",
                            col.names = as.character(c(1:561)))
testy <- data.table::fread('./test/y_test.txt',
                            sep = " ",
                            col.names = "activity")
sub_test <- mutate(data.table::fread('./test/subject_test.txt',
                               sep = " ",
                               col.names = "subject"), datatype = "test")
test <- cbind(sub_test,testy,testx)


### 1 - Merging the training and the test sets to create one data set. ###

#using rbind to merge the rows of both "test" and "training" subject observation data

#features.txt contains variables id
features <- data.table::fread('./features.txt',
                              sep = " ",
                              col.names = c("id", "measure"))

df <- rbind(test,train) %>% arrange(subject)

newnames <- sapply(features[,2], as.character)
oldnames <- colnames(df[4:length(df)]) 

df1 <- rename_at(df,vars(oldnames), function(x) newnames)

### 2 - Extracting only the measurements on the mean and standard deviation for each measurement.###

#Acording to feature.txt, besides df, subject, activity, we
#have to add filter by grepl to extract those collumns

df2 <- df1[,grepl("mean|std|subject|activity|datatype",colnames(df1))]
               
### 3 -Using descriptive activity names to name the activities in the data set ###

# using the reference in "activity_labels.txt" we have the following equivalences:

af <- factor(df2$activity) 
df2$activity <- revalue(af, c("1" = "Walking", "2" = "walkingupstairs",
                                 "3" = "walkingdownstairs", "4" = "sitting",
                                 "5" = "standing", "6" = "laying"))
df3 <- df2

### 4 - Appropriately labeling the data set with descriptive variable names. ###

#There are two variables measured: time and frequency. The first thing to do is separate them:

#"features2.txt" is used to serve as an auxiliar df to create the correct labels

#Now that the names has changed, it is possible to use gather()
names(df3) <- gsub("\\(|\\)", "", names(df3), perl  = TRUE)
names(df3) <- gsub("Acc", "acceleration", names(df3))
names(df3) <- gsub("^t", "time", names(df3))
names(df3) <- gsub("^f", "frequency", names(df3))
names(df3) <- gsub("Body", "body", names(df3))
names(df3) <- gsub("mean", "mean", names(df3))
names(df3) <- gsub("std", "standarddeviation", names(df3))
names(df3) <- gsub("Freq", "frequency", names(df3))
names(df3) <- gsub("Mag", "magnitude", names(df3))
names(df3) <- gsub("G", "g", names(df3))
names(df3) <- gsub("J", "j", names(df3))


#Correcting the format
names(df3) <- make.names(names(df3))

tdf <- df3 #TidyDataSet

### 5 - From the data set in step 4, create a second, independent tidy data  ###
### set with the average of each variable for each activity and each subject. ###

avg_tdf <- tdf %>%
        group_by(subject, activity, datatype) %>%
        summarize_all(funs(mean))

write.table(avg_tdf, "OaCD_Project.txt", row.name=FALSE)
