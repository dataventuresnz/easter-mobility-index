
library(readr)

vals <- readRDS("out/conc_sa2_type.rds")

write_csv(vals,
          path = "out/sa2_type.csv")
