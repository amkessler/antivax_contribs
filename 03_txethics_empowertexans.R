library(tidyverse)
library(janitor)
library(lubridate)

empowertex_expends <- read_csv("processed_data/TXEthics_EmpowerTexans_ExpendituresByFilerID.csv", 
                                                         col_types = cols(REPNO = col_character(), 
                                                                          Zip = col_character()))
#clean up names and formats
empowertex_expends <- empowertex_expends %>% 
  clean_names() %>% 
  mutate(
    date = mdy(date)
  )
