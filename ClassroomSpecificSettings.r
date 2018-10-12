rm(list=ls())

library(rstudioapi)

my_work_dir = rstudioapi::getActiveDocumentContext()$path 


my_work_dir = gsub("\\\\", "/", my_work_dir)

pathParts = strsplit(my_work_dir,'/')[[1]]

my_work_dir = paste(pathParts[1:length(pathParts)-1],sep='', collapse = "/")

setwd(my_work_dir)

libPath = paste(my_work_dir,'/','my_libs', sep="")

if (!file.exists(libPath))
{
  dir.create(libPath, showWarnings = FALSE)  
}


dataPath = paste(my_work_dir,'/','Data', sep="")

if (!file.exists(dataPath))
{
  dir.create(dataPath, showWarnings = FALSE)  
}

twitterDataPath = paste(my_work_dir,'/','Data','/','Twitter', sep="")

if (!file.exists(twitterDataPath))
{
  dir.create(twitterDataPath, showWarnings = FALSE)  
}


stackDataPath = paste(my_work_dir,'/','Data','/','Stack', sep="")

if (!file.exists(stackDataPath))
{
  dir.create(stackDataPath, showWarnings = FALSE)  
}


scopusDataPath = paste(my_work_dir,'/','Data','/','Scopus', sep="")

if (!file.exists(scopusDataPath))
{
  dir.create(scopusDataPath, showWarnings = FALSE)  
}


if (libPath %in% .libPaths() == FALSE)
{
  .libPaths(c(libPath,.libPaths()))
}

sc_api_key = "9d8cf209ec6c67867bc44a5247ad0e52"

so_api_key = "9raZ36FkYGFHDSNrW)gdsw(("

tw_api_key = ""

getoldtweets_path = paste(my_work_dir,"/GetOldTweets-java-master", sep="")


## Stopwords are now here to only have them in one place
my_stopwords = c(stopwords::stopwords(language = "en", source = "snowball"),
                 "software", "testing", "test", "tests", "ci", "continuous",
                 "integration", "development", "paper", "using",
                 "used", "use", "systems", "system", "also", "can",
                 "study", "data", "based", "two", "well", "one",
                 "open", "new", "need", "large", "high", "twitter", "com",
                 "continuousintegration",
                 # weird words from twitter
                 "los", "octavio", "que", "dialogusci",
                 "por", "via", "les", "karma",
                 "çi", "de", "pic", "fi", "en", "la", "ai", "y", "v", "s", "el", "t",
                 "k", "d", "le", "maricruz", "f", "l", "e", "un", "serenaysarikaya", "w",
                 "cigars", "collagedeldia")

