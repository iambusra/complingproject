# Frequency Count and Wordclouds

# packages

library(stringr) # str_replace_all function, data cleaning
library(dplyr) # anti_join, inner_join, count, ungroup
library(magrittr) # pipe %>% 
library(ggplot2) # visuals
library(readr) # read data frames
library(tidytext) #unnest_tokens
library(wordcloud2) 
library(stopwords) 
library(coreNLP)# nlp stuff
library(tm) # removeNumbers()


# Preprocessing Function

clean<- function(x) {
  x %>%
    str_remove_all(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)") %>%
    str_replace_all("&amp;", "and") %>%
    str_replace("RT @[a-z,A-Z]*: ","") %>% 
    str_remove_all("[[:punct:]]") %>%
    str_replace_all("@[a-z,A-Z]*","") %>% 
    str_replace_all("#[a-z,A-Z]*","") %>% 
    str_remove_all("^RT:? ") %>%
    str_remove_all("@[[:alnum:]]+") %>%
    str_remove_all("#[[:alnum:]]+") %>%
    str_replace_all("\\\n", " ") %>%
    str_to_lower() %>%
    str_trim("both")
}

# Read and clean the data. Add column names

df <- read_excel("surucu_data.xlsx")
df$text <- df$text %>% clean
colnames(df) <- c("title","link","text", "score")

# Create Turkish stop words

stop_turkish <- data.frame(word = stopwords::stopwords("tr", source = "stopwords-iso"), 
                           stringsAsFactors = FALSE)

# Get a list of words

text_clean_all <- df %>%
  select(text) %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_turkish) %>% 
  count(word, sort = TRUE)

text_clean_kadın <- df %>%
  select(text) %>%
  filter(grepl("kadın",text))%>% 
  unnest_tokens(word, text) %>%
  anti_join(stop_turkish) %>% 
  count(word, sort = TRUE)

text_clean_bayan <- df %>%
  select(text) %>%
  filter(grepl("bayan",text))%>% 
  unnest_tokens(word, text) %>%
  anti_join(stop_turkish) %>% 
  count(word, sort = TRUE)

text_clean_0_score <- df %>% 
  select(text, score) %>%
  filter(score == "0") %>% 
  unnest_tokens(word, text) %>%
  anti_join(stop_turkish) %>% 
  count(word, sort = TRUE)

text_clean_3_score <- df %>% 
  select(text, score) %>%
  filter(score == "3") %>% 
  unnest_tokens(word, text) %>%
  anti_join(stop_turkish) %>% 
  count(word, sort = TRUE)

# Form a word cloud

wordcloud_all <- wordcloud2(text_clean_all, size = 0.90)
wordcloud_kadın <- wordcloud2(text_clean_kadın, size = 0.90)
wordcloud_bayan <- wordcloud2(text_clean_bayan, size = 0.90)
wordcloud_score_0 <- wordcloud2(text_clean_0_score, size = 0.90)
wordcloud_score_3 <- wordcloud2(text_clean_3_score, size = 0.90)
