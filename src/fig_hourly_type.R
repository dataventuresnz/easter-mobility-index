

library(tidyverse)

data <- readRDS("out/vals_hourly_type.rds") %>%
    mutate(hour = hour / 24)

p <- ggplot(data, aes(x = hour, y = count, color = week)) +
    facet_wrap(vars(sa2_type), scale = "free_y") +
    geom_line() +
    ylim(0, NA) +
    theme_classic() +
    xlab("") +
    ylab("") +
    theme(text = element_text(size = 12),
          legend.title = element_blank(),
          legend.position = "top",
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank())

graphics.off()
pdf(file = "out/fig_hourly_type.pdf",
    width = 10,
    height = 8)
plot(p)
dev.off()

