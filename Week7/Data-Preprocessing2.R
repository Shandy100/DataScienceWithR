#Read a Text File
person<-read.csv(file="Sample.txt",
                 header = FALSE,
                 col.names = c("age","Height"))
View(person)

str(person)

data<-read.csv(file="Sample.txt",
               header = FALSE,
               col.names = c("age","height"),
               stringsAsFactors = FALSE)
str(data)
data$height<-as.numeric(data$height)
str(data)
#Reading data with Read Lines
data2<-readLines("Sample-2.txt")
View(data2)
#Remove comments
I<-grepl("^%",data2)
Dats<-data2[!I]
View(Dats)
#Split arguments
My_list<-strsplit(Dats,split = ",")
View(My_list)

assignFields<-function(x){
  out<-character(3)
  i<-grepl("[[:alpha:]]",x)
  out[1]<-x[i]
  i<-which(as.numeric(x)<1890)
  out[2]<-ifelse(length(i)>0,x[i],NA)
  i<-which(as.numeric(x)>1890)
  out[3]<-ifelse(length(i)>0,x[i],NA)
  out
}
#Apply the function
Standard_data<-lapply(My_list, assignFields)
View(Standard_data)
#?lapply()
#Transform to dataframe
M<-matrix(unlist(Standard_data),
          nrow = length(Standard_data),
          byrow = TRUE)
colnames(M)<-c("Name","birth","death")
daltons<-as.data.frame(M,stringsAsFactors = FALSE)
View(daltons)
