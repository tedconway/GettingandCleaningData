# Grab test data - x=features, y=activities, s=subjects - and bind up columns
setwd("C:/Users/tedco_000/Downloads/HAIR/UCI HAR Dataset/test")
x <- read.table("X_test.txt")
y <- read.table("y_test.txt")
s <- read.table("subject_test.txt")
T<-cbind(s, y, x)

# Do the same for training data
setwd("C:/Users/tedco_000/Downloads/HAIR/UCI HAR Dataset/train")
xTr <- read.table("X_train.txt")
yTr <- read.table("y_train.txt")
sTr <- read.table("subject_train.txt")
Tr<-cbind(sTr, yTr, xTr)

# Combine test, training rows
r<-rbind(T, Tr)

# Grab activity and feature labels
setwd("C:/Users/tedco_000/Downloads/HAIR/UCI HAR Dataset/")
a <- read.table("activity_labels.txt")
f <- read.table("features.txt")

# Give columns meaningful names - subject, activity, features
names(r) <- c("SubjectID", "ActivityID", as.vector(f[, 2]))

# Only keep subject, activity, means, standard deviations
r2 <- r[,grep("SubjectID|ActivityID|-mean\\(\\)|-std\\(\\)", colnames(r))] 

# Add a column with activity name
r2$ActivityName <- sapply(1:nrow(r2), function(i) {as.character(a[r2$ActivityID[i],2])})

# Save as R dataset 1
saveRDS(r2, file="RDS1.rds")

# Compute means for each group of SubjectID and Activity ID
library(plyr)
r2$SubjectID <- as.factor(r2$SubjectID)
r2$ActivityID <- as.factor(r2$ActivityID)
r3 <- ddply(r2, .(SubjectID, ActivityID, ActivityName), numcolwise(mean))

# Save as R dataset 2
saveRDS(r3, file="RDS2.rds")
