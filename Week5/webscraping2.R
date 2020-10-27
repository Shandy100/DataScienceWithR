# importing packages
library(robotstxt)
Path<-paths_allowed("https://www.imdb.com/chart/top/")
#import rvest library
library(rvest)
url<-"https://www.imdb.com/chart/top/"
My_web<-read_html(url)
# Import all tables
My_table<-html_nodes(My_web,"table")
Movie_basic<-html_table(My_table)[[1]]
View(Movie_basic)
Movie_final<-Movie_basic[,2:3]
View(Movie_final)
write.csv(Movie_final,"My_practice.csv")