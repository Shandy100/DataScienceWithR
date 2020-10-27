#robottxt,rvest,dplyr
#install.packages("rvest")
#install.packages("dplyr")
#install.packages("robotstxt")

library(rvest)
library(robotstxt)
url<-"https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"
# Reading my website
My_web<-read_html(url)
#Let's extract the table
My_web_table = html_nodes(My_web, "table")
#Let me extract the table i am looking for
population<-html_table(My_web_table)[[1]]
View(population)
My_population<-population[,1:4]
names(My_population)<-c("Rank","Country","Population","World share")
View(My_population)
write.csv(My_population,"population_site")