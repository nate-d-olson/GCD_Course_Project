#script for getting and cleaning data project
library(stringr)
library(plyr)
library(reshape2)

# load required dataset
if(!file.exists("UCI HAR Dataset")){
    if(!file.exists("Dataset.zip")){
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                      destfile = "Dataset.zip", 
                      method = "curl") 
    unzip(zipfile = "Dataset.zip") 
    }
}

#getting subset of features with mean and standard deviation
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index","feature"))
features$FeatID <- str_c("F", 1:nrow(features),sep = "")
mean_features <- features[grepl("mean",features$feature) & !(grepl("Freq",features$feature)),]
mean_features$stat <- "mean"
stdev_features <- features[grep("std",features$feature),]
stdev_features$stat <- "stdev"
feature_names <- rbind(mean_features,stdev_features)
feature_names$feature_type <- str_replace(feature_names$feature, "-.*","")
subset_columns <- c(mean_features$FeatID, stdev_features$FeatID)

#merging the datasets
#function for reading the data
read_data <- function(i){
    df <- read.table(str_c("UCI HAR Dataset/",i,"/X_",i,".txt", sep = ""), stringsAsFactor = F)
    colnames(df) <- str_c("F",1:ncol(df), sep = "")
    df <- df[,subset_columns]
    df$subject <- readLines(str_c("UCI HAR Dataset/",i,"/subject_",i,".txt", sep = ""))
    df$activity <- readLines(str_c("UCI HAR Dataset/",i,"/y_",i,".txt", sep = ""))
    return(df)
}
full_data <- data.frame()
for(i in c("test","train")){
    df <- read_data(i)
    full_data <- rbind(full_data, df)
}

# adding activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activity", "activity_name")
full_data <- join(full_data, activity_labels)
full_data$activity <- NULL

# adding feature labels
full_data_melt <- melt(full_data,id.vars = .(subject, activity_name))
full_data_melt$feature_names <- feature_names$feature_type[match(full_data_melt$variable, feature_names$FeatID)]
full_data_melt$feature_stat <- feature_names$stat[match(full_data_melt$variable, feature_names$FeatID)]

#generating hte summary dataset
summary_ds <- ddply(full_data_melt, 
                    .(subject, activity_name, feature_names, feature_stat), 
                    summarize, average = mean(as.numeric(value)))
write.csv(summary_ds, "HAR_summarized_tidydata.csv")