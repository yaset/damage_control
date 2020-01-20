###### Fix database
rm(list = ls())
library(readxl)
library(tidyverse)
library(hablar)
library(xlsx)
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


####Management of abdominal wall
dcs <- dcs %>%
  rename(abdomwall_demanda = PERIT084,
         abdomwall_demanda_primary_fascia = PERIT085,
         abdomwall_demanda_primary_skin = PERIT086,
         abdomwall_planeado = PERIT087,
         abdomwall_planeado_bogotabag = PERIT088,
         abdomwall_planeado_mesh = PERIT089,
         abdomwall_planeado_vacuumpak = PERIT090,
         abdomwall_planeado_VAC = PERIT091,
         abdomwall_planeado_VAC_volume = PERIT092,
         abdomwall_planeado_VAC_days = PERIT093)

for(i in 85:92){
  dcs[i] <- as.factor(dcs[[i]])
}

dcs$abdomwall_planeado_VAC_days <- as.numeric(dcs$abdomwall_planeado_VAC_days)
dcs$abdomwall_planeado_VAC_volume <- as.numeric(dcs$abdomwall_planeado_VAC_volume)


##### Complications of planed method

dcs <- dcs %>%
  rename(abdomwall_planeado_compli = PERIT094,
         abdomwall_planeado_compli_fistula = PERIT095,
         abdomwall_planeado_compli_evisceration = PERIT097,
         abdomwall_planeado_compli_haemorrhage = PERIT098,
         abdomwall_planeado_compli_infx = PERIT099,
         abdomwall_planeado_compli_walldamage = PERIT100)

for(i in 95:101){
  dcs[i] <- as.factor(dcs[[i]])
}

###### Posterior to planed method 

dcs <- dcs %>%
  rename(abdomwall_planeado_post_fasciaclosure = PERIT103,
         abdomwall_planeado_post_onlyclosure = PERIT105,
         abdomwall_planeado_post_graft = PERIT107,
         abdomwall_planeado_post_granulation = PERIT109)

for(i in 104:110){
  dcs[i] <- as.factor(dcs[[i]])
}


###### UCI

dcs <- dcs %>%
  rename(uci_admision_date = PERIT111,
         uci_admision_date_hour = PERIT112,
         initial_apache = PERIT113,
         initial_ati = PERIT114,
         initial_iss = PERIT115,
         initial_mods = PERIT116,
         initial_sofa = PERIT117,
         initial_svo2 = PERIT118,
         initial_lactate = PERIT119,
         six_pia = PERIT120,
         twelve_pia = PERIT121,
         twelve_svo2 = PERIT122,
         twelve_lactate = PERIT123,
         tfour_pia = PERIT124,
         tfour_svo2 = PERIT125,
         tfour_lactate = PERIT126,
         tfour_waterbalance = PERIT127,
         feight_pia = PERIT128,
         nseix_pia = PERIT129)

dcs$uci_admision_date <- as.Date(dcs$uci_admision_date)

for(i in 114:130){
  dcs[i] <- as.numeric(dcs[[i]])
}

##### Microbiology

dcs <- dcs %>%
  rename(hemoculture = PERIT130,
         hemoculture_date = PERIT131,
         hemoculture_pos_number = PERIT132,
         hemoculture_pos_1 = PERIT133,
         hemoculture_pos_2 = PERIT134)

dcs$hemoculture <- as.factor(dcs$hemoculture)
dcs$hemoculture_date <- as.Date(dcs$hemoculture_date)
dcs$hemoculture_pos_number <- as.numeric(dcs$hemoculture_pos_number)

for(i in 134:135){
  dcs[i] <- as.factor(dcs[[i]])
}

dcs <- dcs %>%
  rename(culture_laparatomy = PERIT137,
         culture_laparatomy_date = PERIT138,
         culture_laparatomy_pos_number = PERIT139,
         culture_laparatomy_pos_1 = PERIT140,
         culture_laparatomy_pos_2 = PERIT141)

dcs$culture_laparatomy <- as.factor(dcs$culture_laparatomy)
dcs$culture_laparatomy_date <- as.Date(dcs$culture_laparatomy_date)
dcs$culture_laparatomy_pos_number <- as.numeric(dcs$culture_laparatomy_pos_number)

for(i in 141:142){
  dcs[i] <- as.factor(dcs[[i]])
}

#### Previous antibiotics

dcs <- dcs %>%
  rename(antibiotic_previous = PERIT151,
         antibiotic_previous_date = PERIT152,
         antibiotic_previous_pos_number = PERIT153,
         antibiotic_previous_pos_1 = PERIT154,
         antibiotic_previous_pos_2 = PERIT155,
         antibiotic_previous_pos_3 = PERIT156)

dcs$antibiotic_previous <- as.factor(dcs$antibiotic_previous)
dcs$antibiotic_previous_date <- as.Date(dcs$antibiotic_previous_date)
dcs$antibiotic_previous_pos_number <- as.numeric(dcs$antibiotic_previous_pos_number)

for(i in 154:156){
  dcs[i] <- as.factor(dcs[[i]])
}

##### antibiotic UCI

dcs <- dcs %>%
  rename(antibiotic_uci_empiric = PERIT159,
         antibiotic_uci_empiric_date = PERIT160,
         antibiotic_uci_empiric_pos_number = PERIT161,
         antibiotic_uci_empiric_pos_1 = PERIT162,
         antibiotic_uci_empiric_pos_2 = PERIT163)

dcs$antibiotic_uci_empiric <- as.factor(dcs$antibiotic_uci_empiric)
dcs$antibiotic_uci_empiric_date <- as.Date(dcs$antibiotic_uci_empiric_date )
dcs$antibiotic_uci_empiric_pos_number <- as.numeric(dcs$antibiotic_uci_empiric_pos_number)

for(i in 163:164){
  dcs[i] <- as.factor(dcs[[i]])
}

### antibiotic UCI according to cultures

dcs <- dcs %>%
  rename(antibiotic_culture = PERIT164,
         antibiotic_culture_date = PERIT165,
         antibiotic_culture_pos_number = PERIT166,
         antibiotic_culture_pos_1 = PERIT167,
         antibiotic_culture_pos_2 = PERIT168)

dcs$antibiotic_culture <- as.factor(dcs$antibiotic_culture)
dcs$antibiotic_culture_date <- as.Date(dcs$antibiotic_culture_date)
dcs$antibiotic_culture_pos_number <- as.numeric(dcs$antibiotic_culture_pos_number)
for(i in 168:169){
  dcs[i] <- as.factor(dcs[[i]])
}

#### Management

dcs <- dcs %>%
  rename(nutrition_support = PERIT170,
         nutrition_support_enteral = PERIT171,
         nutrition_support_enteral_days = PERIT172,
         nutrition_support_parenteral = PERIT173,
         nutrition_support_parenteral_days = PERIT174,
         ventilation = PERIT175,
         ventilation_days = PERIT176,
         tracheotomy = PERIT177,
         tracheotomy_days_ventilation = PERIT178)

for(i in c(171,172,174,176,178)){
  dcs[i] <- as.factor(dcs[[i]])
}
for(i in c(173,175,177,179)){
  dcs[i] <- as.numeric(dcs[[i]])
}


###### hospital discharge

dcs <- dcs %>%
  rename(hos_out_date = PERIT179,
         hos_out_state = PERIT180,
         hos_out_readmission_UCI = PERIT181,
         hos_out_readmission_UCI_date = PERIT182,
         hos_out_reqx = PERIT183,
         hos_out_reqx_date = PERIT184,
         hos_out_reqx_peritonitis = PERIT185,
         hos_out_reqx_abscess = PERIT186,
         hos_out_reqx_haemorrhage = PERIT187,
         hos_out_reqx_obstruction = PERIT188,
         hos_out_reqx_evisceration = PERIT189)

for(i in c(180,183,185)){
  dcs[i] <- as.Date(dcs[[i]])
}

for(i in c(181,182,184,186:190)){
  dcs[i] <- as.factor(dcs[[i]])
}



#Lenght_hospital
dcs$hos_out_date <- as.Date(dcs$hos_out_date)

dcs$lenght_hospital_days <- dcs$hos_out_date - dcs$admission_date
dcs$lenght_hospital_days <- as.numeric(dcs$lenght_hospital_days)



###### Transfusion de hemocomponentes
dcs <- dcs %>%
  rename(blood_transfusion = PERIT192,
         blood_transfusion_Red = PERIT193,
         blood_transfusion_URB = PERIT194,
         blood_transfusion_platelet = PERIT195,
         blood_transfusion_UPB = PERIT196,
         blood_transfusion_FFP = PERIT197,
         blood_transfusion_UFFP = PERIT198,
         blood_transfusion_cryoprecipitade = PERIT199,
         blood_transfusion_Ucryoprecipitade = PERIT200)
for(i in c(193,194,196,198,200)){
  dcs[i] <- as.factor(dcs[[i]])
}

for(i in c(195,197,199,201)){
  dcs[i] <- as.numeric(dcs[[i]])
}

dcs <- dcs %>%
  rename(inotropic = PERIT201)


