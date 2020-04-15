
library(tidyverse)
library(lubridate)

conc_sa2_type <- readRDS("out/conc_sa2_type.rds")

vals_hourly_type <- readRDS("out/subset_easter.rds") %>%
    left_join(conc_sa2_type, by = "sa2_2018_code") %>%
    filter(sa2_type != "Unclassified") %>%
    count(week, sa2_type, timestamp, wt = count) %>%
    mutate(timestamp = ymd_hms(timestamp)) %>%
    group_by(week) %>%
    mutate(hour = difftime(timestamp, min(timestamp), unit = "hours"),
           hour = as.integer(hour)) %>%
    ungroup() %>%
    select(week, sa2_type, hour, count = n) %>%
    arrange(week, sa2_type, hour)

saveRDS(vals_hourly_type,
        file = "out/vals_hourly_type.rds")



    

    
    

