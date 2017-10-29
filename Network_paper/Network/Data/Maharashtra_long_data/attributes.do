**** ATTRIBUTES ****


**FILE LOCATION
cd C:\Users\Personal\Documents\Network_paper\Network\Data\Maharashtra_long_data\

use "MOD_I1.dta", clear
sort  HHID I1A I1B
gen trait_ID = 100*I1A + I1B


duplicates drop HHID  trait_ID, force
drop  HHIDold I1A I1B PDANAME ENUMERATOR SDATE STIME ETIME
rename I2 valuation
reshape wide  valuation, i(HHID) j(trait_ID) 
duplicates drop HHID , force
save "MOD_I1_m.dta", replace
outsheet HHID-valuation504 using  "Attribute_valuation_m.csv", comma replace


use "MOD_I2.dta", clear
sort  HHID I1A I1B
gen trait_ID = 100*I1A + I1B
drop if trait_ID==.

keep  HHID trait_ID I3A I3B
rename I3A variety_ID
rename I3B performnce
save "MOD_I2_A.dta", replace

use "MOD_I2.dta", clear
sort  HHID I1A I1B
gen trait_ID = 100*I1A + I1B
drop if trait_ID==.

keep  HHID trait_ID I4A I4B
rename I4A variety_ID
rename I4B performnce
save "MOD_I2_B.dta", replace

use "MOD_I2.dta", clear
sort  HHID I1A I1B
gen trait_ID = 100*I1A + I1B
drop if trait_ID==.

keep  HHID trait_ID I5A I5B
rename I5A variety_ID
rename I5B performnce
save "MOD_I2_C.dta", replace

use "MOD_I2.dta", clear
sort  HHID I1A I1B
gen trait_ID = 100*I1A + I1B
drop if trait_ID==.

keep  HHID trait_ID I6A I6B
rename I6A variety_ID
rename I6B performnce
save "MOD_I2_D.dta", replace

use "MOD_I2_A", clear 
append using "MOD_I2_B.dta"
append using "MOD_I2_C.dta"
append using "MOD_I2_D.dta"
save "perfor_temp.dta", replace



duplicates drop HHID  trait_ID, force
*drop  I1A I1B I4A I4B I5A I5B I6A I6B PDANAME ENUMERATOR SDATE STIME ETIME

reshape wide variety_ID performnce, i(HHID) j(trait_ID) 
*duplicates drop HHID , force
save "MOD_I2_m.dta", replace
outsheet HHID- performnce504 using  "Seed_performance_m.csv", comma replace
**************************************************************************

*clear all
/********************MERGING WITH THE LONG DATA****************************
insheet using "Abdul_variables_m.csv", comma
rename hhid HHID
duplicates drop HHID , force
merge 1:1 HHID using MOD_I1_m.dta
rename _merge _mergepre
merge 1:1 HHID using MOD_I2_m.dta
drop if  variety==""
drop if  I3A101==.
drop _merge


save "MOD_mahalong_I1_I2_m.dta", replace

************************MERGING THE INDEPENDENT SIDE*********************


*rename hhid HHID
*duplicates drop HHID , force

*merge 1:1 HHID using MOD_mahalong_I1_I2_m.dta
