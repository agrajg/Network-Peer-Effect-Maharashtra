** Descriptives
** merge A and B module.
set more off
clear all 
cd "C:\Users\Agraj\Documents\Network\Data\All_modules_with_ID\"
use "A_m.dta", clear
merge m:1 nhhid using "B1.dta"
drop _merge
save "mergeAB1", replace
clear all
use  "mergeAB1.dta", clear
sort nhhid
merge nhhid using "B13.dta"
drop _merge
save "mergeAB1B13.dta", replace


* dropping all observation that do not have a varietal  choice.
drop if b13 ==.
label variable b13 "Choice of variety of seed" 



drop if a11 ==4 
* drop if Muslims and Christians



** Descriptive Stats 
log using "C:\Users\Agraj\Documents\Network\Data\All_modules_with_ID\Logfiles\Descriptives.smcl", replace

tab1 b13  group_block group_geo group_geo_caste
sort  group_block
by group_block: tab1 b13
sort  group_geo 
by group_geo: tab1 b13
sort  group_caste 
by group_caste: tab1 b13
*sort  group_geo_caste 
*by group_geo_caste: tab1 b13

tabulate b13 group_block , column 
tabulate b13 group_geo , column 
tabulate b13 group_caste, column 
sort group_block
by group_block  : fsum  a13  a20 a21 a26 caste_SC  caste_OBC caste_OM caste_GEN educ_MIDSCH educ_HIGHSCH educ_GRAD  off_farm_inc farm_inc, label

sort group_geo
by group_geo  : fsum  a13  a20 a21 a26 caste_SC  caste_OBC caste_OM caste_GEN educ_MIDSCH educ_HIGHSCH educ_GRAD  off_farm_inc farm_inc, label

sort group_caste
by group_caste   : fsum  a13  a20 a21 a26 caste_SC  caste_OBC caste_OM caste_GEN educ_MIDSCH educ_HIGHSCH educ_GRAD off_farm_inc farm_inc, label

log close


*** End of 3 Descriptives



