**** MARKET IFRASTRUCTURE INDEX *****
set more off
cd "C:\Users\Personal\Documents\IFPRI_Delhi_2013\MDI"
do "1initial_cleaning.do"

keep state marketmandi city district yearofestablishment
sort district
by district : gen tot_markets = _N


replace yearofestablishment=. if yearofestablishment==0
replace yearofestablishment= 1981 if yearofestablishment==29
replace yearofestablishment= 1965 if yearofestablishment==965
replace yearofestablishment= 1980 if yearofestablishment==198
replace yearofestablishment= 1950 if yearofestablishment==195
replace yearofestablishment= 1880 if yearofestablishment==122
replace yearofestablishment= 1977 if yearofestablishment==77
replace yearofestablishment= 1947 if yearofestablishment==47
replace yearofestablishment= 1965 if yearofestablishment==965
replace yearofestablishment= . if yearofestablishment==20
replace yearofestablishment= 1985 if yearofestablishment==25
replace yearofestablishment= 1991 if yearofestablishment==19
gen agemkt = 2010- yearofestablishment
replace agemkt = 0 if agemkt<0
by district : egen avg_age = mean(agemkt)



duplicates drop district, force
save "fortotalmkt.dta", replace
clear all


*****************************************************************************
insheet using "GISDistrict.csv"
drop if district==""
merge 1:1 state district using "Census_population_economic_activity_2011_Gaurav.dta"
drop v? v??
rename _merge _mm

merge 1:1 state district using "fortotalmkt.dta"

outsheet state - _merge using "tot_map.csv",comma replace



***END OF DO FILE***
