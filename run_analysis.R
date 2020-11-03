
library(data.table)
library(reshape2)
# cargar: activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
# cargar: data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
# Extraiga solo las medidas de la media y la desviación estándar de cada medida.
extract_features <- grepl("mean|std", features)
# cargar y procesar X_test & y_test data.
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(x_test) = features
# Extraiga solo las medidas de la media y la desviación estándar de cada medida.
x_test = x_test[,extract_features]
# cargar activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# combinmos los datos
test_data <- cbind(subject_test, y_test, x_test)

# cargar y procesar X_train & y_train data.
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(x_train) = features

#  Extraiga solo las medidas de la media y la desviación estándar de cada medida.
x_train = x_train[,extract_features]

# cargar activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# combinamos los datos
train_data <- cbind(subject_train, y_train, x_train)

# unimos test y train data
data = rbind(test_data, train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Aplicar la función media al conjunto de datos usando la función dcast
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt",row.names = F)
