library(tidyverse)
library(janitor)
library(lubridate)
library(readxl)

#import ftm-supplied data for identified individuals and groups
#as well as other individuals who are employed by those groups

legislators <- read_excel("processed_data/FTM-legislator_vax_cleaned.xlsx")

legislators <- legislators %>% 
  clean_names() %>% 
  remove_empty(c("rows", "cols"))

names(legislators)
glimpse(legislators)

legislators %>% 
  count(candidate)
