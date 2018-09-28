## install.packages("text2vec")
## install.packages("tm")
## install.packages("magrittr")
## install.packages("wordcloud")
## install.packages("stopwords", dependencies = TRUE)
library("stopwords")
library(text2vec)
library(tm)
library(magrittr)
library(wordcloud)

#EDIT this row
##my_file <- "my_Scopus_ci_data.RData"
##my_file <- "my_twitter_ci_data.RData"
my_file <- "my_STO_continuous_integration_data.RData"

#draw_myWordCloud = function(my_file){
  
  my_temp_file = paste(my_data_dir, "/", sep="")
  my_temp_file = paste(my_temp_file, my_file, sep="")
  load(my_temp_file)
  
  print(paste("Creating Word cloud, my_file: ", my_file))
  
  my_text <- paste(my_articles$Title, my_articles$Abstract_clean)
  my_text = tolower(my_text)
  
  #remove more words that we do not care about 
my_stopwords = c(stopwords::stopwords(language = "en", source = "snowball"),
                 "software", "testing", "test", "continuous",
                 "integration", "development", "paper", "using",
                 "used", "use", "systems", "system", "also", "can",
                 "study", "data", "based", "two", "well", "one",
                 "open", "new", "need", "large", "high", "twitter", "com",
                 "continuousintegration", "los", "octavio", "que", "dialogusci",
                 "por", "via", "les", "karma")
  
  
  my_text = removeWords(my_text, my_stopwords)

                                        # scale can help here
png()
  wordcloud(my_text, max.words=50, min.freq=5, random.order=FALSE, rot.per=0)
  dev.off()
  rm(my_text)
  print("Finished Word cloud")
#}
