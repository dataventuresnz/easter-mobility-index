
library(readr)

vals <- readRDS("out/vals_hourly_type.rds")

write_csv(vals,
          path = "out/vals_hourly_type.csv")
