library(tidyverse)
library(janitor)
library(lubridate)

imported_data <- read_csv("processed_data/TXEthics_EmpowerTexans_ExpendituresByFilerID.csv", 
                                                         col_types = cols(REPNO = col_character(), 
                                                                          Zip = col_character()))
#clean up names and formats
empowertex_expends <- imported_data %>% 
  clean_names() %>% 
  mutate(
    date = mdy(date),
    payee_name = str_squish(payee_name)
  )
