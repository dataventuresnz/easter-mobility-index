
# THIS METHOD HAS SINCE BEEN DEPRECATED

We have been developing our weekly mobility report and the methodology has since been changed. Our [weekly mobility repo](https://github.com/dataventuresnz/mobility-index) will have the latest methodology for mobility estimation.

# Mobility index for Easter mobility study

Data Ventures developed used our aggregated and anonymised cellphone data to estimate the amount of mobility within regional councils, or based on categories such as recreation, retail, workplace areas. This README briefly outlines how we developed our mobility index and the repository includes our code for data released on mobility over the Easter period in 2020 during level four lockdown.

## Background to the cellphone data

Our data is built off counts of people each hour at a Statistical Area Level Two  geography (SA2; a small neighbourhood size). Estimates are further segmented based on whether the counts of people are people who normally reside in the neighbourhood (local residents), or people who reside outside a given neighbourhood (domestic visitors). As an example, you would normally be considered local to your home neighbourhood, but you would be considered a domestic visitor when you visit another neighbourhood to shop at the supermarket.

We identified six categories which we report alongside regional council data: Retail, Transit, Residential, Tourism, Workplace, and Recreational categories. These categories were estimated using unsupervised time series clustering on SA2 level data and then qualitatively labelled based on subsequent exploratory analysis. We then aggregated up counts across the SA2s to get a total measure for each category.

## Converting aggregated counts to create a mobility index

The proportion of domestic travellers is eastimates at a regional council or category level, i.e., domestic / (local + domestic) and then we multiplied the proportion by 100 to make the result look more index-like. We then calculate the percentage difference in the proportions of domestic travellers during Easter to the previous week or to the previous Easter.
