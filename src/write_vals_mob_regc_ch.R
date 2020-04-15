
library(readr)
library(tidyverse)

vals <- readRDS("out/vals_mob_regc_ch.rds") %>%
    mutate(value = round(value, 2))

write_csv(vals,
          path = "out/vals_mob_regc_ch.csv")
