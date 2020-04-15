
.PHONY: all
all: out/fig_mob_regc_eas_to_eas.pdf \
     out/fig_mob_regc_before_to_eas.pdf \
     out/fig_hourly_type.pdf \
     out/vals_mob_regc.csv \
     out/vals_mob_regc_ch.csv \
     out/vals_mob_regc_ch_overall.csv \
     out/vals_hourly_type.csv \
     out/vals_hourly_type_ch_overall.csv \
     out/sa2_type.csv


## Inputs

out/raw.rds : src/raw.R \
              data/easter_counts_20200414.RDS
	Rscript $<

out/conc_sa2_type.rds : src/conc_sa2_type.R \
                        data/sa_type.csv \
                        data/touristy.csv \
                        data/Mech\ turk\ classifications\ -\ transit\ areas.csv
	Rscript $<

out/conc_sa2_regc.rds : src/conc_sa2_regc.R \
                        data/Annual\ Areas\ 2018.csv
	Rscript $<


## Intermediate values

out/subset_easter.rds : src/subset_easter.R \
                        out/raw.rds
	Rscript $<

out/vals_mob_regc.rds : src/vals_mob_regc.R \
                        out/subset_easter.rds \
                        out/conc_sa2_regc.rds
	Rscript $<

out/vals_mob_regc_ch.rds : src/vals_mob_regc_ch.R \
                           out/vals_mob_regc.rds
	Rscript $<

out/vals_hourly_type.rds : src/vals_hourly_type.R \
                           out/subset_easter.rds \
                           out/conc_sa2_type.rds
	Rscript $<


## Figures

out/fig_mob_regc_eas_to_eas.pdf : src/fig_mob_regc.R \
                                  out/vals_mob_regc_ch.rds
	Rscript $< --variant=eas_to_eas

out/fig_mob_regc_before_to_eas.pdf : src/fig_mob_regc.R \
                                     out/vals_mob_regc_ch.rds
	Rscript $< --variant=before_to_eas


out/fig_hourly_type.pdf : src/fig_hourly_type.R \
                          out/vals_hourly_type.rds
	Rscript $<


## CSVs

out/vals_mob_regc.csv : src/write_vals_mob_regc.R \
                        out/vals_mob_regc.rds
	Rscript $<

out/vals_mob_regc_ch.csv : src/write_vals_mob_regc_ch.R \
                           out/vals_mob_regc_ch.rds
	Rscript $<

out/vals_mob_regc_ch_overall.csv : src/write_vals_mob_regc_ch_overall.R \
                                   out/subset_easter.rds
	Rscript $<

out/vals_hourly_type.csv : src/write_vals_hourly_type.R \
                           out/vals_hourly_type.rds
	Rscript $<

out/vals_hourly_type_ch_overall.csv : src/write_vals_hourly_type_ch_overall.R \
                                      out/subset_easter.rds \
                                      out/conc_sa2_type.rds
	Rscript $<

out/sa2_type.csv : src/write_sa2_type.R \
                   out/conc_sa2_type.rds
	Rscript $<


## Clean up

.PHONY: clean
clean:
	rm -rf out
	mkdir -p out


