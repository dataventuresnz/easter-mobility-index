
library(tidyverse)

raw <- readRDS("data/easter_counts_20200414.RDS") %>%
    as_tibble() %>%
    rename(sa2_2018_code = sa2_2018, count = cnt) %>%
    filter(!is.na(sa2_2018_code)) %>% ## SA2s with no sectors
    mutate(sa2_2018_code = sprintf("%06.0f", sa2_2018_code))

saveRDS(raw,
        file = "out/raw.rds")
