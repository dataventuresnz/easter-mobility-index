
library(readr)
library(tidyverse)

vals <- readRDS("out/vals_mob_regc.rds") %>%
    mutate(mob_index = round(mob_index, 2))

write_csv(vals,
          path = "out/vals_mob_regc.csv")
