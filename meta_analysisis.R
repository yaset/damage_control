library(readxl)
data <- read_excel("C:/Users/eyase/Dropbox/Damage_Control_Abdominal/Extracted information/extract-diverticulitis.xlsx")
library(dmetar)
library(robumeta)
library(metafor)
library(meta)
library(tidyverse)
library(dmetar)
library(cowplot)

data <- read_excel("C:/Users/eyase/Dropbox/Damage_Control_Abdominal/systematic review/Extracted information/extract-diverticulitis.xlsx", 
                   sheet = "DCS only")


data <- diverticuliti
data <- data %>%
  mutate(study_id = 1:length(Reference))

data$morta_anasto <- data$`Mortality in anastomisis group`
data$morta_ostomy <- data$`Mortality in colostomy group`
data$ostomies <- data$`Number of colostomy`
data$anastomies <- data$`Number of anastomosis`
data$n_patients <- data$`Number of patients`

data$morta_anasto <- as.numeric(data$morta_anasto)
data$morta_ostomy <- as.numeric(data$morta_anasto)

dat2 <- cbind(data$morta_anasto, data$morta_ostomy,
              data$ostomies, data$anastomies)


dat3 <- data %>%
  select(Reference,morta_anasto, anastomies, morta_ostomy,ostomies, n_patients)
View(dat3)

m.bin <- metabin(event.e = morta_ostomy,
                 n.e = ostomies,
                 event.c = morta_anasto,
                 n.c = anastomies,
                 data = dat3,
                 studlab = Reference,
                 sm = "OR")



forest(m.bin,
       lab.e = "Ostomy",
       lab.c = "Anastomosis",
       leftlabs = c("Author", "Dead", "Sample","Dead", "Sample"))

a <- eggers.test(m.bin)

dat3
ies <- escalc(xi = ostomies,
              ni = n_patients,
              data = dat3,
              measure = "PR")
ies2 <- escalc(xi = ostomies,
               ni = n_patients,
               data = dat3,
               measure = "PLO")

ies3 <- escalc(xi = anastomies,
               ni = n_patients,
               data = dat3,
               measure = "PLO")


pes <- rma(yi,vi, data = ies, method = "REML")

pes.logit <- rma(yi, vi, data = ies, method = "REML")

pes.anasto <- rma(yi,vi, data = ies, method = "REML")
pes.log2 <- predict(pes.logit, transf = transf.ilogit)
print(pes)                    


prop1 <- metaprop(event = ostomies,
                  n = n_patients,
                  studlab = Reference,
                  data = dat3,
                  comb.fixed = FALSE,
                  sm = "PLOGIT"
)
prop2 <- metaprop(event = anastomies,
                  n = n_patients,
                  studlab = Reference,
                  data = dat3,
                  comb.fixed = FALSE,
                  sm = "PLOGIT"
)

p1 <- forest(prop2)


par(mfrow = c(2,1))
forest(prop2)
forest(prop1)

data$morta_anasto <- as.numeric(data$morta_anasto)


dat4 <- dat3 %>%
  filter(morta_ostomy >= 0)

prop3 <- metaprop(event = morta_ostomy,
                  n = ostomies,
                  studlab = Reference,
                  data = dat4,
                  comb.fixed = FALSE,
                  sm = "PLOGIT")
prop4 <- metaprop(event = morta_anasto,
                  n = anastomies,
                  studlab = Reference,
                  data = dat4,
                  comb.fixed = FALSE,
                  sm = "PLOGIT")
eggers.test(prop2)
trimfill(prop2)
funnel(prop2, studlab = TRUE,
       contour = c(.95,.975,.99),
       col.contour=c("darkblue","blue","lightblue"))+
  legend(1, 0, c("p < 0.05", "p<0.025", "< 0.01"),bty = "n",
         fill=c("darkblue","blue","lightblue"))



png(filename = "number_anastomosis.png",
    width = 750, height = 500)
forest(prop4)
dev.off()
