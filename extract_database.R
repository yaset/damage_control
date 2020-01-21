rm(list = ls())
library(xlsx)
source("fix.R")
##### Definitions####

## Peritonitis in emergency patient (excluded trauma or post surgical related)

table(dcs$peritonitis_cause)

## Excluded 332 postsurgical and 59 post trauma

dcs1 <- dcs %>%
  filter(peritonitis_cause == "Médica o isquémica")

## Peritonitis related to pancreas or biliary ways excluded

table(dcs1$peritonitis_pancreas) ##13
table(dcs1$peritonitis_liver)    ##29

dcs1 <- dcs1 %>%
  filter(peritonitis_pancreas != "Si")
dcs1 <- dcs1 %>%
  filter(peritonitis_liver != "Si")

## Secondary peritonitis

table(dcs1$peritonitis_type)
dcs1 <- dcs1 %>%
  filter(peritonitis_type == "Secundaria")


dcs1$first_qx[dcs1$intervention_laparatomy == "Anastomosis"] <- 1
dcs1$first_qx[dcs1$intervention_laparatomy == "Ostomía"] <- 2
dcs1$first_qx[dcs1$intervention_laparatomy == "Sutura primaria"] <- 1
dcs1$first_qx[dcs1$intervention_laparatomy == "Ligadura intestinal" & 
                dcs1$type_laparatomy == "Laparotomía planeada"] <- 3


dcs1 <- dcs1 %>%
  filter(!(first_qx == is.na(first_qx)))

table(dcs1$first_qx)



dcs1$second_qx[dcs1$first_qx == 3 &
                 dcs1$reconstruct_ostomy == "Si"] <- 1
dcs1$second_qx[dcs1$first_qx == 3 &
                 dcs1$reconstruct_method != is.na(dcs1$reconstruct_method)] <- 2

table(dcs1$first_qx)



dcs2 <- read_excel("secondary.xlsx")
table(dcs2$first_qx)
table(dcs2$reconstruct_ostomy[dcs2$first_qx == 3])

dcs2$second_qx[dcs2$first_qx == 3 &
                 dcs2$reconstruct_ostomy == "Si"] <- 1
table(dcs2$second_qx)

dcs2$second_qx[dcs2$first_qx == 3 &
                 dcs2$reconstruct_method == "Anastomosis manual" ] <- 2
dcs2$second_qx[dcs2$first_qx == 3 &
                 dcs2$reconstruct_method == "Anastomosis mecánica" ] <- 2


table(dcs2$second_qx,dcs2$first_qx, useNA = "ifany")

dcs2 <- dcs2 %>%
  filter(second_qx == is.na(second_qx))



write.xlsx(dcs2,"secondary.xlsx")
####Erase 3 observations because have a description of damage control although don't describe second strategy
dcs2 <- read_excel("secondary.xlsx")

