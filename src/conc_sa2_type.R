
library(tidyverse)

key <- c("0" = "Unclassified",
         "1" = "Residential",
         "2" = "Workplace",
         "3" = "Recreational",
         "4" = "Retail",
         "5" = "Tourism",
         "6" = "Transit")

touristy <- read_csv("data/touristy.csv",
                     col_types = "c-") %>% ## ignoring time_p variable
    rename(sa2_2018_code = sa2) %>%
    mutate(sa2_type = 5)

transit <- read_csv("data/Mech turk classifications - transit areas.csv",
                    col_types = "-c--",
                    skip = 1) %>%
    rename(sa2_2018_code = SA2_code) %>%
    mutate(sa2_type = 6)

cluster <- read_csv("data/sa_type.csv",
                     col_types = "cn-----") %>%
    select(sa2_2018_code = sa,
           sa2_type = cluster)

conc_sa2_type <- bind_rows(touristy, transit, cluster) %>%
    mutate(sa2_type = recode(sa2_type, !!!key)) %>%
    mutate(sa2_type = factor(sa2_type, levels = c("Retail",
                                                  "Transit",
                                                  "Residential",
                                                  "Tourism",
                                                  "Workplace",
                                                  "Recreational",
                                                  "Unclassified")))

saveRDS(conc_sa2_type,
        file = "out/conc_sa2_type.rds")
