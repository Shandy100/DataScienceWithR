#Check for access
library(robotstxt)
path<-paths_allowed("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating")
link<-"https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"
library(rvest)
library(dplyr)
web<-read_html(link)
Name<-web%>%html_nodes(".lister-item-header a")%>%html_text()
Director_Name<-web%>%html_nodes(".text-muted+ p a:nth-child(1)")%>%html_text()
View(Director_Name)
rating<-web%>%html_nodes(".ratings-imdb-rating strong")%>%html_text()
View(rating)

Fav_Movies<-data.frame(Name, Director_Name, rating, Votes)
View(Fav_Movies)
write.csv(Fav_Movies,"Hollywood.csv")