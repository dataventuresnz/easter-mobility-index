
library(tidyverse)
library(docopt)

'
Usage:
fig_mob_regc.R [options]

Options:
--variant (eas_to_eas|before_to_eas) [default: eas_to_eas]
' -> doc
opts <- docopt(doc)
variant <- opts$variant

data <- readRDS("out/vals_mob_regc_ch.rds") %>%
    filter(variant == !!variant) %>%
    mutate(regc_2018_desc = reorder(regc_2018_desc, value))

p <- ggplot(data, aes(x = regc_2018_desc, y = value)) +
    geom_point() +
    geom_hline(yintercept = 0) +
    xlab("") +
    ylab("Percent change") +
    theme_classic() +
    theme(text = element_text(size = 12),
          strip.text.x = element_text(margin = margin(2, 2, 2, 2, "pt")),
          strip.text.y = element_text(margin = margin(2, 2, 2, 2, "pt"))) +
    coord_flip()

graphics.off()
file <- sprintf("out/fig_mob_regc_%s.pdf", variant)
pdf(file = file,
    width = 8,
    height = 10)
plot(p)
dev.off()

