# GLOBALS

# read the variable (column) names
featuresfile <- file.path("features.txt")
features <- read.table(featuresfile, sep="")
featurenames <- make.names(features$V2)
   
# set columns to read
cols <- rep("NULL", 561)
valcols <- grep("\\.(mean|std)\\.", featurenames)
cols[valcols] = "double"	

# function to read a data file
readdatafile <- function(dataset) {
	datafile <- paste("X_", dataset, ".txt", sep="")
	labelfile <- paste("y_", dataset, ".txt", sep="")
	subjectfile <- paste("subject_", dataset, ".txt", sep="")

    # Step 2. Read only cols that are mean() or std()
    datatable <- read.table(file.path(dataset, datafile), header=FALSE, sep="", stringsAsFactors=FALSE, fill=TRUE, comment.char="", colClasses= cols )
    # Step 4. Label the columns
    colnames(datatable) <- featurenames[valcols]

    # Step 3a. Read the labels
    labels <- read.table(file.path(dataset, labelfile), header=FALSE)
    datatable$label <- labels$V1

    # Read the subjects
    subjects <- read.table(file.path(dataset, subjectfile), header=FALSE)
    datatable$subject <- subjects$V1

    return(datatable);
}

# Step 1 - merge the datasets
bothsets <- rbind(readdatafile("test"), readdatafile("train"), make.row.names=FALSE)

# Step 3b. Assign the activity names
activities <- read.table(file.path("activity_labels.txt"))
colnames(activities) <- c("actID", "activity")
merged <- merge(bothsets, activities, by.x = "label", by.y="actID")

# clean up the data
library(dplyr)

# Step 5. calculate mean by group and dump to file
tidyset <- tbl_df(merged) %>%
	group_by(subject, activity) %>%
	summarise_each(funs(mean), matches("mean|std"))

#write.table(tidyset, file="tidydata.txt", sep="\t", row.name=FALSE )


