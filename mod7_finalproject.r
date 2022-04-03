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

