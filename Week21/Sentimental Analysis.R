#Sentimental Analysis
#Importing libraries
library(tidyverse)    
library(stringr)      
library(tidytext)       
library(harrypotter)
library(textdata)

#Sentiment dataset
View(sentiments)

#Lexicons
get_sentiments("afinn")
get_sentiments("bing")
get_sentiments("nrc")


View(get_sentiments("afinn"))
View(get_sentiments("bing"))
View(get_sentiments("nrc"))

titles <- c("Philosopher's Stone", "Chamber of Secrets", "Prisoner of Azkaban",
            "Goblet of Fire", "Order of the Phoenix", "Half-Blood Prince",
            "Deathly Hallows")

books <- list(philosophers_stone, chamber_of_secrets, prisoner_of_azkaban,
              goblet_of_fire, order_of_the_phoenix, half_blood_prince,
              deathly_hallows)

#Tokening
series <- tibble()

for(i in seq_along(titles)) {
  
  clean <- tibble(chapter = seq_along(books[[i]]),
                  text = books[[i]]) %>%
    unnest_tokens(word, text) %>%
    mutate(book = titles[i]) %>%
    select(book, everything())
  
  series <- rbind(series, clean)
}

# Factor to keep books in order of publication
series$book <- factor(series$book, levels = rev(titles))

View(series)

#nrc sentiment for HP books
nrcanalysis <- series %>%right_join(get_sentiments("nrc")) %>%
  filter(!is.na(sentiment)) %>%
  count(sentiment, sort = TRUE)
View(nrcanalysis)

#Sentiment across each novel
series %>%group_by(book) %>% 
  mutate(word_count = 1:n(),
         index = word_count %/% 500 + 1) %>% 
  inner_join(get_sentiments("bing")) %>%
  count(book, index = index , sentiment) %>%
  ungroup() %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative,
         book = factor(book, levels = titles)) %>%
  ggplot(aes(index, sentiment, fill = book)) +
  geom_bar(alpha = 0.5, stat = "identity", show.legend = FALSE) +
  facet_wrap(~ book, ncol = 2, scales = "free_x")
