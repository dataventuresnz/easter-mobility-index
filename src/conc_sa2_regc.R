
library(tidyverse)

conc_sa2_regc <- read_csv("data/Annual Areas 2018.csv") %>%
    mutate(sa2_2018_code = sprintf("%06.0f", SA22018_code),
           regc_2018_desc = REGC2018_name) %>%
    select(sa2_2018_code, regc_2018_desc) %>%
    unique() %>%
    filter(regc_2018_desc != "Area Outside Region") %>%
    mutate(regc_2018_desc = factor(regc_2018_desc, levels = unique(regc_2018_desc)))

saveRDS(conc_sa2_regc,
        file = "out/conc_sa2_regc.rds")


    
