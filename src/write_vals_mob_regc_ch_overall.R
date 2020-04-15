
library(tidyverse)
library(lubridate)

vals_mob_regc_ch_overall <- readRDS("out/subset_easter.rds") %>%
    count(week, segment, wt = count) %>%
    spread(key = segment, value = n) %>%
    mutate(mob_index = 100 * domestic / (local + domestic)) %>%
    select(week, mob_index) %>%
    spread(key = week, value = mob_index) %>%
    mutate(eas_to_eas = 100 * ((`Easter Week 2020` / `Easter Week 2019`) - 1),
           before_to_eas = 100 * ((`Easter Week 2020` / `Week Before Easter Week 2020`) - 1)) %>%
    select(eas_to_eas, before_to_eas) %>%
    gather(key = variant, value = value, eas_to_eas, before_to_eas) %>%
    mutate(variant = recode(variant,
                            "eas_to_eas" = "Easter to Easter",
                            "before_to_eas" = "Lockdown to Easter")) %>%
    mutate(value = round(value, 2))
                            
write_csv(vals_mob_regc_ch_overall,
          path = "out/vals_mob_regc_ch_overall.csv")



    

    
    

