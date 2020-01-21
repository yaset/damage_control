import excel "C:\Users\eyase\Documents\GIT\damage_control\secondary.xlsx", sheet("Sheet1") firstrow
mean age
mean age if first_qx == 1
swilk age
tab sex  first_qx
tab sex  first_qx if first_qx != 1
tab sex  first_qx if first_qx != 2
tab sex  first_qx if first_qx != 2, chi2 expect
tab sex  first_qx if first_qx != 2, chi2 expect col
tab sex  first_qx if first_qx != 1, chi2 expect
tab sex  first_qx if first_qx != 1, chi2 expect col
sum age
return list
gen agemean = r(mean)
tab agemean
sum age age age
return list
egen agemean = mean(age)
egen agemean2 = mean(age)
tab agemean2
initial_apache
mean initial_apache
egen asd = mean(age initial_apache)
egen asd = mean(age,initial_apache)
egen asd = mean(age + initial_apache)
egen asd2 = sd(age + initial_apache)
tab asd2
drop asd2 asd agemean2
tab dm2  first_qx if first_qx != 1, chi2 expect col
label define first 1 "Anastomosis" 2 "Ostomy" 3 "DCS"
label values first_qx first
tab dm2  first_qx if first_qx != 1, chi2 expect col
tab dm2  first_qx if first_qx != 2, chi2 expect col
tab dm2  first_qx if first_qx != 2, chi2 expect col exact
tab dm2  first_qx if first_qx != 2, chi2 col exact
tab dm2  first_qx if first_qx != 1, chi2 col exact
tab heart_diseases  first_qx if first_qx != 1, chi2 col exact
tab heart_diseases  first_qx if first_qx != 1, chi2 col exact expect
tab heart_diseases  first_qx if first_qx != 2, chi2 col exact expect
tab cancer first_qx if first_qx != 1, chi2 col exact
tab cancer first_qx if first_qx != 1, chi2 col exact expect
tab cancer first_qx if first_qx != 2, chi2 col exact
tab desnutrition first_qx if first_qx != 1, chi2 col exact
tab ERC first_qx if first_qx != 1, chi2 col exact
tab ERC first_qx if first_qx != 2, chi2 col exact
tab ERC first_qx if first_qx != 1, chi2 col exact
tab cirrosis first_qx if first_qx != 1, chi2 col exact
tab dm2  first_qx if first_qx != 1, chi2 expect col missing
tab cirrosis first_qx if first_qx != 1, chi2 col exact
tab cirrosis first_qx if first_qx != 1, chi2 col exact
tab ERC first_qx if first_qx != 1, chi2 col exact
tab ERC first_qx if first_qx != 2, chi2 col exact
tab steroids_chronic first_qx if first_qx != 2, chi2 col exact
tab steroids_chronic first_qx if first_qx != 1, chi2 col exact
tab peritonitis_place first_qx if first_qx != 2, chi2 col exact
tab peritonitis_place first_qx if first_qx != 1, chi2 col exact
tab peritonitis_material first_qx if first_qx != 2, chi2 col exact
tab peritonitis_material first_qx if first_qx != 1, chi2 col exact
tab peritonitis_bowel first_qx if first_qx != 2, chi2 col exact
tab peritonitis_bowel first_qx if first_qx != 1, chi2 col exact
tab peritonitis_colon first_qx if first_qx != 1, chi2 col exact
tab peritonitis_colon first_qx if first_qx != 2, chi2 col exact
tab peritonitis_apendice first_qx if first_qx != 1, chi2 col exact
tab peritonitis_stomachduodenum first_qx if first_qx != 1, chi2 col exact
tab peritonitis_apendice first_qx if first_qx != 2, chi2 col exact
tab peritonitis_stomachduodenum first_qx if first_qx != 2, chi2 col exact
tab peritonitis_stomachduodenum first_qx if first_qx != 1, chi2 col exact
tab anasto_filtration
tab anasto_fistula
tab anasto_peritonitis
tab anasto_obstruction
tab anasto_haemorrhage
tab ostomie_compli_hernia
tab ostomie_compli_hernia if first_qx == 2
tab ostomie_compli_absceparaostomal if first_qx == 2
tab ostomie_compli_invagination if first_qx == 2
tab ostomie_compli_filtrationinterna if first_qx == 2
tab ostomie_compli_haemorrhage if first_qx == 2
tab ostomie_compli_isquemia if first_qx == 2
tab abdomwall_demanda first_qx if first_qx != 1, chi2 col exact
tab abdomwall_demanda first_qx if first_qx != 2, chi2 col exact
tab abdomwall_planeado first_qx if first_qx != 2, chi2 col exact
tab abdomwall_planeado first_qx if first_qx != 1, chi2 col exact
tab abdomwall_planeado_bogotabag first_qx if first_qx != 2, chi2 col exact
tab abdomwall_planeado_vacuumpak first_qx if first_qx != 2, chi2 col exact
tab abdomwall_planeado_VAC first_qx if first_qx != 2, chi2 col exact
tab abdomwall_planeado_vacuumpak first_qx if first_qx != 2, chi2 col exact
tab abdomwall_planeado_vacuumpak first_qx if first_qx != 1, chi2 col exact
tab abdomwall_planeado_VAC_volume first_qx if first_qx != 1, chi2 col exact
tab abdomwall_planeado_VAC_volume first_qx if first_qx != 1, chi2 col exact
tab abdomwall_planeado_VAC first_qx if first_qx != 1, chi2 col exact
tab abdomwall_planeado_VAC first_qx if first_qx != 2, chi2 col exact
tab nutrition_support first_qx if first_qx != 2, chi2 col exact
tab nutrition_support first_qx if first_qx != 2, chi2 col exact missing
tab nutrition_support first_qx if first_qx != 1, chi2 col exact missing
tab ventilation first_qx if first_qx != 1, chi2 col exact missing
tab ventilation first_qx if first_qx != 2, chi2 col exact missing
tab inotropic first_qx if first_qx != 1, chi2 col exact missing
tab inotropic first_qx if first_qx != 2, chi2 col exact missing
tab blood_transfusion first_qx if first_qx != 2, chi2 col exact missing
tab blood_transfusion first_qx if first_qx != 3, chi2 col exact missing
tab blood_transfusion first_qx if first_qx != 1, chi2 col exact missing
tab blood_transfusion_Red first_qx if first_qx != 1, chi2 col exact missing
tab blood_transfusion_Red first_qx if first_qx != 1, chi2 col exact
tab blood_transfusion_Red first_qx if first_qx != 2, chi2 col exact
tab hos_out_state first_qx if first_qx != 1, chi2 col exact
tab hos_out_state first_qx if first_qx != 2, chi2 col exact
tab lenght_hospital_days first_qx if first_qx != 2, chi2 col exact
tab hos_out_state second_qx, chi2 col exact
label values second_qx first
label define second 1 "Ostomy" 2 "Anastomosis"
label values second_qx second
tab hos_out_state second_qx, chi2 col exact
