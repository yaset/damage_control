###### Analysis secondary peritonitis

rm(list = ls())
library(readxl)
library(tidyverse)

dcs <- read_excel("secondary.xlsx")

shapiro.test(dcs$age)

mean(dcs$age,na.rm = TRUE)

dcs %>%
  group_by(first_qx) %>%
  summarize(med = median(age), 
            P25 = quantile(age,0.25),
            P75 = quantile(age,0.75))

dcs$n_relapa_demand <- as.numeric(dcs$n_relapa_demand)
dcs %>%
  group_by(first_qx) %>%
  summarize(med = median(n_relapa_demand, na.rm = TRUE), 
            P25 = quantile(n_relapa_demand,0.25,na.rm = TRUE),
            P75 = quantile(n_relapa_demand,0.75,na.rm = TRUE))

dcs$ventilation_days <- as.numeric(dcs$ventilation_days)
dcs %>%
  group_by(first_qx) %>%
  summarize(med = median(ventilation_days, na.rm = TRUE), 
            P25 = quantile(ventilation_days,0.25,na.rm = TRUE),
            P75 = quantile(ventilation_days,0.75,na.rm = TRUE))

dcs$blood_transfusion_URB <- as.numeric(dcs$blood_transfusion_URB)


dcs %>%
  group_by(first_qx) %>%
  summarize(med = median(blood_transfusion_URB, na.rm = TRUE), 
            P25 = quantile(blood_transfusion_URB,0.25,na.rm = TRUE),
            P75 = quantile(blood_transfusion_URB,0.75,na.rm = TRUE))


####Anastomosis
dcs2 <- dcs %>%
  filter(!first_qx == 2)

wilcox.test(dcs2$age,dcs2$first_qx)
wilcox.test(dcs2$ventilation_days,dcs2$first_qx)
wilcox.test(dcs2$ventilation_days,dcs2$blood_transfusion_URB)


#### Ostomy
dcs3 <- dcs %>%
  filter(!first_qx == 1)

wilcox.test(dcs3$age ~ dcs3$first_qx)
wilcox.test(dcs3$ventilation_days,dcs3$blood_transfusion_URB)
