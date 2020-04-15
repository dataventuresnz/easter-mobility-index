
library(tidyverse)
library(lubridate)

conc_sa2_regc <- readRDS("out/conc_sa2_regc.rds")

vals_mob_regc <- readRDS("out/subset_easter.rds") %>%
    left_join(conc_sa2_regc, by = "sa2_2018_code") %>%
    count(week, regc_2018_desc, segment, wt = count) %>%
    spread(key = segment, value = n) %>%
    mutate(mob_index = 100 * domestic / (local + domestic)) %>%
    select(week, regc_2018_desc, mob_index)

saveRDS(vals_mob_regc,
        file = "out/vals_mob_regc.rds")



    

    


