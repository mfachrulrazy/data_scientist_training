# exam 1
df <- data.frame(a = c(1, 2, 3), b = c(4, 5, 6), c = c(7, 8, 9))
df[[2]]
df[[1]][[1]]
df[[2]][[3]]

# exam 2
x <- c("red","blue","yellow","orange","green","purple")
y <- x[2:4]
y

# exam 3
x <- factor(c("grape","apples","pear","cherry","mango","panda"))
x[6] <- "apples"
x

# exam 4
add_numbers <- function(x,y) {
  x + y
}

add_numbers(3,3)

# exam 5
df <- c(1,2,3,4,5,6,NA,7,8,9,NA)
df
mean_replace <- function(x){
  ifelse(is.na(x),mean(x,na.rm=T),x)
}
df <- mean_replace(df)
df

#ref: https://www.edureka.co/community/8658/custom-function-which-replace-missing-values-vector-values

# exam 6
library(readr)
trees_df <- read_csv("https://storage.googleapis.com/dqlab-dataset/trees.csv")

# exam 7
names(trees_df)
# Menampilkan nama kolom dan tipe data setiap kolom.
str(trees_df)
# mengubah nama kolom Girth menjadi Diameter
names(trees_df)[1] <- "Diameter"
# mengubah satuan Diameter dari inch ke ft ke dalam kolom baru dengan nama diameter_ft
trees_df$diameter_ft <- trees_df$Diameter*0.08333
# memunculkan beberapa baris
head(trees_df)
# Menampilkan hasil statistik deskriptif (min, max, median, mean, dan quartil) untuk semua kolom
summary(trees_df)
# Mengecek missing value.
is.na(trees_df)

# Task 8
shapiro.test(trees_df$diameter_ft)
shapiro.test(trees_df$Height)
shapiro.test(trees_df$Volume)

# Task 9
plot(density(trees_df$Volume))

# Task 10 Mencari Hubungan
# hubungan antara Volume batang pohon Cherry dengan diameter dan ketinggian (height)
lm(formula = Volume ~ Height + diameter_ft, data = trees_df)
plot(trees_df$diameter_ft, trees_df$Volume)
plot(trees_df$Height, trees_df$Volume)

# Task 11
library(readr) #pre-defined
library(dplyr) #pre-defined

sleep_df <- read_csv('https://storage.googleapis.com/dqlab-dataset/sleep.csv') #pre-defined

# Save the data in two different dataframe/vector
group1 <- filter(sleep_df, sleep_df$group == 1)
group2 <- filter(sleep_df, sleep_df$group == 2)

# Compute t-test
t_test <- t.test(group1$extra, group2$extra)
t_test


# Task 12
library(ggplot2)
ggplot(sleep_df, aes(x=as.character(group), y=extra, fill=as.character(group))) + geom_boxplot()

# Task 13 Membuat model sederhana
library(readr)
electric_bill <- read_csv("https://storage.googleapis.com/dqlab-dataset/electric_bill.csv")
model <- lm(amount_paid ~ num_people + housearea, data=electric_bill)

model


# Task 14 Training dan Testing
library(readr)
library(caret)
set.seed(123)
iris <- read_csv("https://storage.googleapis.com/dqlab-dataset/iris.csv")

trainIndex <- createDataPartition(iris$Species, p=0.8, list=FALSE)
training_set <- iris[trainIndex,]
testing_set <- iris[-trainIndex,]

dim(training_set)
dim(testing_set)


# Task 15 Model Decision Tree
library(caret) #pre-defined 
library(rpart) #pre-defined
library(readr) #pre-defined
set.seed(123)  #pre-defined

suv_data <- read_csv("https://storage.googleapis.com/dqlab-dataset/suv_data.csv") #pre-defined

#split data to training & testing set
trainIndex <- createDataPartition(suv_data$Purchased, p=0.8, list=FALSE)
training_set <- suv_data[trainIndex,]
testing_set <- suv_data[-trainIndex,]

#build model with decision tree
model_dt <- rpart(Purchased ~ ., data=training_set, method="class")
predictions_dt <- predict(model_dt, newdata=testing_set, type="class")

#evaluate performance with new data/ testing_set
testing_purchased <- factor(testing_set$Purchased) #pre-defined 

#show the evaluation result 
evaluation_result <- confusionMatrix(predictions_dt, testing_purchased)
evaluation_result