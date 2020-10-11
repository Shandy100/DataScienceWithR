#Function
force=function(m,a)
{
  f=m*a
  print(f)
}
#ohm's law
voltage=function(i,r){
  v=i*r
  print(v)
}

#Turn on a library
library(MASS)
#Check available data in R
data()
# View a dataset
View(mtcars)
names(iris)
View(iris)
dim(Melanoma)
str(Melanoma)
head(Melanoma)
tail(Melanoma)
colnames(Melanoma)
rownames(Melanoma)

#readline method is used for reading input from user
my.name <- readline(prompt="Enter name: ")
my.age <- readline(prompt="Enter age: ")
# convert character into integer
my.age <- as.integer(my.age) #characterVector is converted into integer.
print(paste("Hi,", my.name, "next year you will be", my.age+1, "years old."))

#matrix mul and det
mat_a<-matrix(c(25,14,36,51,36,98,9,7,1),ncol = 3)
determinant = det(mat_a)
Mat_mul = mat_a%*%mat_a

View(My_friends)
str(My_friends)
dim(My_friends)
names(My_friends)
My_friends$Height<-as.factor(My_friends$Height)
str(My_friends)
levels(My_friends$Height)
#I want to check who is eligible for military
#age<26
My_friends$Eligibility=My_friends$Age<26
View(My_friends)
Eligible=subset(My_friends,My_friends$age<26)

#Simple_ifelse_program
evenorodd=function(x){
  ifelse(x%%2==0,"even","odd")
}

#vector
x <- c(1, 5, 4, 9, 0) #c() is used for combining all the element.
print(x)

my_friends<-c("B","C")
Nat_no=c(1:100)
summary(Nat_no)