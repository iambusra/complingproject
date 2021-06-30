library("purrr") # could use for data cleaning
library("stringr") # str_replace_all function, data cleaning
library(("dplyr") # anti_join, inner_join, count, ungroup
library(magrittr) # pipe %>% 
library(ggplot2) # visuals
# read data frames
library("readr")
library("rtweet") # Twitter magic
library("tidytext") #unnest_tokens
library("wordcloud2") 
library("stopwords") 
library("coreNLP")# nlp stuff
library("textdata") # lexicons
library("ggpubr") # combine plots
library("tm") # removeNumbers()
library("xlsx")

# Twitter API settings

token <- create_token(
)

# get tweets for kadın sürücü in Twitter
kadin_surucu <- search_fullarchive(
  "kadın sürücü",
  n = 3900,
  fromDate = "201201010000",
  toDate = "202010010000",
  env_name = "prod",
  safedir = NULL,
  parse = TRUE,
  token = NULL
)

# see how many unique screen names we have
unique(kadin_surucu$screen_name)

# make sure that only media agencies are kept
news1 <- kadin_surucu[!is.na(kadin_surucu$urls_expanded_url), 1:21]
news1 <- news1[!grepl(c("twitter"), news1$urls_expanded_url),]
news1 <- news1[!grepl("youtu", news1$urls_expanded_url),]
news1 <- news1[!grepl("dlvr", news1$urls_expanded_url),]
news1 <- news1[!grepl("ift", news1$urls_expanded_url),]
news1 <- news1[!grepl("eksi", news1$urls_expanded_url),]

# remove duplicates
news1 <- news1[!duplicated(news1$text),]
news1 <- news1[!duplicated(news1$urls_url),]

# check whether it looks good
unique(news1$screen_name)

# choose only relevant columns
news2 <- news1 %>% dplyr::select(text, urls_expanded_url)

# this is for file writing
news2 <- apply(news2,2,as.character)

write.xlsx(news2,"/Users/onurkeles/Desktop/BOUN FLED '21/Spring 2021/LING 484/Project/Data.xlsx", row.names = TRUE)


##-------## same operations for the string "sürücü"

# get tweets for sürücü in Twitter
surucu <- search_30day(
  "sürücü",
  n = 10000,
  env_name = "emotionwordchoice"
)

# see how many unique screen names we have
unique(surucu$screen_name)

# make sure that only media agencies are kept
news3 <- surucu[!is.na(surucu$urls_expanded_url), 1:21]
news3 <- news3[!grepl(c("twitter"), news3$urls_expanded_url),]
news3 <- news3[!grepl("youtu", news3$urls_expanded_url),]
news3 <- news3[!grepl("dlvr", news3$urls_expanded_url),]
news3 <- news1[!grepl("ift", news3$urls_expanded_url),]
news3 <- news3[!grepl("eksi", news3$urls_expanded_url),]
news3 <- news3[!grepl("bilgisayar", news3$urls_url),]
news3 <- news3[!grepl("laptop", news3$text),]

# remove duplicates
news3 <- news3[!duplicated(news3$text),]
news3 <- news3[!duplicated(news3$urls_url),]

# check whether it looks good
unique(news3$screen_name)

# choose only relevant columns
news4 <- news3 %>% dplyr::select(text, urls_expanded_url)

# this is for file writing
news4 <- apply(news3,2,as.character)

write.csv(news4,"/Users/onurkeles/Desktop/BOUN FLED '21/Spring 2021/LING 484/Project/surucu_data.csv", row.names = TRUE)

