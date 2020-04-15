
library(tidyverse)
library(lubridate)

vals_mob_regc_ch <- readRDS("out/vals_mob_regc.rds") %>%
    spread(key = week, value = mob_index) %>%
    mutate(eas_to_eas = 100 * ((`Easter Week 2020` / `Easter Week 2019`) - 1),
           before_to_eas = 100 * ((`Easter Week 2020` / `Week Before Easter Week 2020`) - 1)) %>%
    select(regc_2018_desc, eas_to_eas, before_to_eas) %>%
    gather(key = variant, value = value, eas_to_eas, before_to_eas)

saveRDS(vals_mob_regc_ch,
        file = "out/vals_mob_regc_ch.rds")



    

    


