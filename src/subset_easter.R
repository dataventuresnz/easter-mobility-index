
library(tidyverse)
library(lubridate)

start_easter_2019 <- ymd_hms("2019-04-16 00:00:00")
start_pre_2020  <- date("2020-03-31 00:00:00")
start_easter_2020 <- date("2020-04-07 00:00:00")

end_easter_2019 <- ymd_hms("2019-04-23 00:00:00")
end_pre_2020  <- date("2020-04-07 00:00:00")
end_easter_2020 <- date("2020-04-14 00:00:00")




raw <- readRDS("out/raw.rds")

easter_2019 <- raw %>%
    filter(timestamp >= start_easter_2019,
           timestamp < end_easter_2019) %>%
    mutate(week = "Easter Week 2019")

pre_easter_2020 <- raw %>%
    filter(timestamp >= start_pre_2020,
           timestamp < end_pre_2020) %>%
    mutate(week = "Week Before Easter Week 2020")

easter_2020 <- raw %>%
    filter(timestamp >= start_easter_2020,
           timestamp < end_easter_2020) %>%
    mutate(week = "Easter Week 2020")

subset_easter <- bind_rows(easter_2019, pre_easter_2020, easter_2020) %>%
    mutate(week = factor(week,
                         levels = c("Easter Week 2019",
                                    "Week Before Easter Week 2020",
                                    "Easter Week 2020")))

saveRDS(subset_easter,
        file = "out/subset_easter.rds")

