***CONTIGUOUS BLOCKS
clear all
set more off
***Change file location 
cd C:\Users\Personal\Documents\Network_paper\Network\Data\Maharashtra_long_data
do "groups.do"
sort  geo_group hhid
by geo_group : gen geo_group_size = _N - 1
by geo_group : gen inc_geo_group_size = _N
gen inc_geo_group_size_inverse = 1/inc_geo_group_size
gen geo_group_size_inverse = 1/geo_group_size

*************************VARIETY ID******************************
decode variety, generate(vt)

gen variety_ID =.
replace variety_ID = 1 if vt=="Dhanya 7870"
replace variety_ID = 2 if vt=="Mahyco 2210"
replace variety_ID = 3 if vt=="Mahyco 204"
replace variety_ID = 4 if vt=="Mahyco 167" | vt =="Mahyco 163" 
replace variety_ID = 5 if vt=="Pioneer 86M32"
replace variety_ID = 6 if vt=="Pioneer 86M52"
replace variety_ID = 7 if vt=="Nirmal 9"
replace variety_ID = 8 if vt=="Nirmal 40"
replace variety_ID = 9 if vt=="Nirmal Tulja 1579"
replace variety_ID = 10 if vt=="Nirmal Sindhu 2475"
replace variety_ID = 11 if vt=="Bayer-Proagro 9330"
replace variety_ID = 12 if vt=="Bayer-Proagro 9333"
replace variety_ID = 13 if vt=="Bayer-Proagro XL51"
replace variety_ID = 14 if vt=="Mahalaxmi 267"
replace variety_ID = 15 if vt=="Mahalaxmi 308"
replace variety_ID = 16 if vt=="Mahalaxmi 504"
replace variety_ID = 17 if vt=="Zuari 2021"
replace variety_ID = 18 if vt=="Mahabeej Shraddha 8609"
replace variety_ID = 19 if vt=="Mahabeej Saburi"
replace variety_ID = 20 if vt=="Mahabeej 1001"
replace variety_ID = 21 if vt=="Mahabeej ICTP 8203"
replace variety_ID = 22 if vt=="Maruti Biotech 565"
replace variety_ID = 23 if vt=="Grade Seed 520"
replace variety_ID = 24 if vt=="Gradeseeds 555"
replace variety_ID = 25 if vt=="Ganga Kaveri 1044"
replace variety_ID = 26 if vt=="I don’t know"





*****************************************************************
***OrderID
sort  geo_group hhid
generate order_id1 = _n
label var order_id1 "Individual/Contiguous Groups arranged ID"
sort order_id1 
rename hhid HHID
outsheet HHID variety_ID social_group  blockmapID districtID  geo_group farmexper hhsize2 highsch_dummy  totldsize  rainfed_pct offfarminc farminc bajraldarea croplandha agricwage pop_rur traveltimetocitiespop100kinhours  totharvestton landareahect1 soldharvton -otherharvton   tot_bajvaryld2 using "Abdul_variables_m.csv", comma replace



/*
outsheet farmexper hhsize2 caste_dummy2 caste_dummy3 highsch_dummy using "X_m.csv", comma replace
outsheet rank using "Y_m.csv", comma replace
outsheet caste_dummy2 caste_dummy3  using "CST_m.csv", comma replace
outsheet block_dummy* using "BLK_m.csv", comma replace

sort order_id1 
duplicates drop inc_geo_group_size , force

outsheet inc_geo_group_size using "A_m.csv", comma replace



***matlab code to generate G matrix and J matrix and multiply them
***Import back the multiplied stuff
*/

