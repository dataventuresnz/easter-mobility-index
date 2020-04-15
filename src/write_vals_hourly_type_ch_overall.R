
library(tidyverse)
library(lubridate)

conc_sa2_type <- readRDS("out/conc_sa2_type.rds")

vals_hourly_type_ch_overall <- readRDS("out/subset_easter.rds") %>%
    left_join(conc_sa2_type, by = "sa2_2018_code") %>%
    filter(sa2_type != "Unclassified") %>%
    count(week, sa2_type, wt = count) %>%
    spread(key = week, value = n) %>%
    mutate(eas_to_eas = 100 * ((`Easter Week 2020` / `Easter Week 2019`) - 1),
           before_to_eas = 100 * ((`Easter Week 2020` / `Week Before Easter Week 2020`) - 1)) %>%
    select(sa2_type, eas_to_eas, before_to_eas) %>%
    gather(key = variant, value = value, eas_to_eas, before_to_eas) %>%
    mutate(variant = recode(variant,
                            "eas_to_eas" = "Easter to Easter",
                            "before_to_eas" = "Lockdown to Easter")) %>%
    mutate(value = round(value, 2))

                            
write_csv(vals_hourly_type_ch_overall,
          path = "out/vals_hourly_type_ch_overall.csv")



    

    
    

