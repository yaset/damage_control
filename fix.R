###### Fix database
rm(list = ls())
library(readxl)
library(tidyverse)
library(vignettes)
library(hablar)
dcs <- read_excel("data/last_version.xlsx")


##Demographics
dcs <- dcs %>%
  rename(age = PERIT001,
         sex = PERIT002,
         admission_date = PERIT003)

dcs$sex <- as.factor(dcs$sex)
dcs$admission_date <- as.Date(dcs$admission_date)

#comorbidities

dcs <- dcs %>%
  rename(dm2 = PERIT005,
         heart_diseases = PERIT006,
         cancer = PERIT007,
         desnutrition = PERIT008,
         ERC = PERIT009,
         cirrosis = PERIT010,
         steroids_chronic = PERIT011,
         remision_other_hos = PERIT012)

dcs <- dcs %>%
  convert(fct(dm2,heart_diseases,
              cancer, desnutrition,
              ERC, cirrosis,
              steroids_chronic,
              remision_other_hos))

##Peritonitis

dcs <- dcs %>%
  rename(peritonitis_cause = PERIT014,
         peritonitis_type = PERIT015,
         peritonitis_place = PERIT016,
         peritonitis_material = PERIT017,
         peritonitis_absceso = PERIT018,
         peritonitis_absceso_type = PERIT019)

dcs <- dcs %>%
  convert(fct(peritonitis_cause,
              peritonitis_type,
              peritonitis_place,
              peritonitis_material,
              peritonitis_absceso,
              peritonitis_absceso_type))

###organos_peritonitis

dcs <- dcs %>%
  rename(peritonitis_liver = PERIT020,
         peritonitis_pancreas = PERIT021,
         peritonitis_bowel = PERIT022,
         peritonitis_colon = PERIT023,
         peritonitis_stomach.duodenum = PERIT024,
         peritonitis_apendice = PERIT025,
         peritonitis_gineco = PERIT026,
         peritonitis_urologic = PERIT027,
         peritonitis_other = PERIT028,
         peritonitis_other_type = PERIT029)

for(i in 21:30){
  dcs[i] <- as.factor(dcs[[i]])
}


###Laparatomy features

dcs <- dcs %>%
  rename(type_laparatomy = PERIT030,
         date_laparatomy = PERIT031,
         packing_laparatomy = PERIT032,
         intervention_laparatomy = PERIT033,
         intervention_laparatomy_bowel = PERIT034,
         intervention_laparatomy_colon = PERIT035)

dcs$type_laparatomy <- as.factor(dcs$type_laparatomy)
dcs$date_laparatomy <- as.Date(dcs$date_laparatomy)

for(i in 33:36){
  dcs[i] <- as.factor(dcs[[i]])
}


####Complications of primary suture or primary anastomosis

dcs <- dcs %>%
  rename(anasto_filtration = PERIT036,
         anasto_fistula = PERIT037,
         anasto_peritonitis = PERIT038,
         anasto_obstruction = PERIT039,
         anasto_haemorrhage = PERIT040,
         anasto_other = PERIT041,
         anasto_other_type = PERIT042)

#####Instetinal reconstruction

dcs <- dcs %>%
  rename(reconstruct_method = PERIT043,
         reconstruct_ostomy = PERIT044,
         reconstruct_ostomy_bowel = PERIT045,
         reconstruct_ostomy_colon = PERIT046,
         reconstruct_time = PERIT047)

for(i in 44:48){
  dcs[i] <- as.factor(dcs[[i]])
}

###### Complications of instetinal reconstruction 
dcs <- dcs %>%
  rename(recons_compli_filtration = PERIT048,
         recons_compli_fistula = PERIT049,
         recons_compli_peritonitis = PERIT050,
         recons_compli_obstruction = PERIT051,
         recons_compli_haemorrhage = PERIT052,
         recons_compli_other = PERIT053,
         recons_compli_other_type = PERIT054)

for(i in 49:55){
  dcs[i] <- as.factor(dcs[[i]])
}

##### Manage of complications of instetinal reconstruction

dcs <- dcs %>%
  rename(recons_compli_tto_ostomy = PERIT055,
         recons_compli_tto_ligadure = PERIT056,
         recons_compli_tto_fistule = PERIT057,
         recons_compli_tto_other = PERIT058,
         recons_compli_tto_other_type = PERIT059)

for(i in 56:60){
  dcs[i] <- as.factor(dcs[[i]])
}

##### Ostomy complications

dcs <- dcs %>%
  rename(ostomie_compli_hernia = PERIT060,
         ostomie_compli_absceparaostomal = PERIT061,
         ostomie_compli_invagination = PERIT062,
         ostomie_compli_filtrationinterna = PERIT063,
         ostomie_compli_haemorrhage = PERIT064,
         ostomie_compli_isquemia = PERIT065,
         ostomie_compli_date_closure = PERIT066)

for(i in 61:66){
  dcs[i] <- as.factor(dcs[[i]])
}

dcs$ostomie_compli_date_closure <- as.factor(dcs$ostomie_compli_date_closure)


##### Closure of ostomy complications

dcs <- dcs %>%
  rename(ostomie_closure_filtration = PERIT067,
         ostomie_closure_haemorrhage = PERIT068,
         ostomie_closure_peritonitis = PERIT069,
         ostomie_closure_death = PERIT070)

for(i in 68:71){
  dcs[i] <- as.factor(dcs[[i]])
}


#### Number of laparatomies after first laparatomy

dcs <- dcs %>%
  rename(n_lapar_after = PERIT071)

dcs$n_lapar_after <- as.factor(dcs$n_lapar_after)

#### Turn of strategy 

dcs <- dcs %>%
  rename(change_strategy = PERIT072,
         change_strategy_type = PERIT073,
         n_relapa_demand = PERIT074)

for(i in 72:75){
  dcs[i] <- as.factor(dcs[[i]])
}

#### Cause relaparatomy demanda

dcs <- dcs %>%
  rename(relapa_dema_fever = PERIT075,
         relapa_dema_abdomen = PERIT076,
         relapa_dema_ileo = PERIT077,
         relapa_dema_shock = PERIT078,
         relapa_dema_disforg = PERIT079,
         relapa_dema_leucocitos = PERIT080,
         relapa_dema_radiologic = PERIT081,
         relapa_dema_dirigida = PERIT082,
         relapa_dema_juntamedica = PERIT083)
for(i in 76:84){
  dcs[i] <- as.factor(dcs[[i]])
}

