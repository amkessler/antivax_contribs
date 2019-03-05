library(tidyverse)
library(janitor)
library(lubridate)
library(readxl)

#import ftm-supplied data for identified individuals and groups
#as well as other individuals who are employed by those groups

donors <- read_excel("processed_data/FTM-vaxcontributors_cleaned.xlsx")

donors <- donors %>% 
  clean_names() %>% 
  remove_empty(c("rows", "cols"))

names(donors)
glimpse(donors)

# comparing set1 and set2
donors %>% 
  group_by(record_group) %>% 
  summarise(n(), sum(amount))

donors %>% 
  filter(contributor != "EMPOWER TEXANS") %>% 
  summarise(sum(amount))

# summaries ####

donors %>% 
  group_by(contributor) %>% 
  summarise(num = n(), sumamount = sum(amount)) %>% 
  arrange(desc(sumamount))

donors %>% 
  group_by(election_jurisdiction, candidate) %>% 
  summarise(num = n(), sumamount = sum(amount)) %>% 
  arrange(desc(sumamount))

#top contributors to each candidate
donors %>% 
  group_by(candidate, contributor) %>% 
  summarise(num = n(), sumamount = sum(amount)) %>% 
  arrange(candidate, desc(sumamount))

#by state
donors %>% 
  group_by(election_jurisdiction) %>% 
  summarise(num = n(), sumamount = sum(amount)) %>% 
  arrange(desc(sumamount))


# summaries WITHOUT Empower Texans ####

donors %>% 
  filter(contributor != "EMPOWER TEXANS") %>% 
  group_by(contributor) %>% 
  summarise(num = n(), sumamount = sum(amount)) %>% 
  arrange(desc(sumamount))

donors %>% 
  filter(contributor != "EMPOWER TEXANS") %>% 
  group_by(election_jurisdiction, candidate) %>% 
  summarise(num = n(), sumamount = sum(amount)) %>% 
  arrange(desc(sumamount))

#top contributors to each candidate
donors %>% 
  filter(contributor != "EMPOWER TEXANS") %>% 
  group_by(election_jurisdiction, candidate, contributor) %>% 
  summarise(num = n(), sumamount = sum(amount)) %>% 
  arrange(candidate, desc(sumamount))

#by state
donors %>% 
  filter(contributor != "EMPOWER TEXANS") %>% 
  group_by(election_jurisdiction) %>% 
  summarise(num = n(), sumamount = sum(amount)) %>% 
  arrange(desc(sumamount))


