rm(list = ls())
source("fix.R")

table(dcs$peritonitis_pancreas)

dcs1 <- dcs %>%
  filter(peritonitis_pancreas != "Si")

dcs1 <- dcs1 %>%
  filter(peritonitis_liver != "Si")

dcs1 <- dcs1 %>%
  filter(peritonitis_cause == "Médica o isquémica")

dcs1 <- dcs1 %>%
  filter(intervention_laparatomy == "Ligadura intestinal")

table(dcs1$peritonitis_cause)
table(dcs$peritonitis_cause)
