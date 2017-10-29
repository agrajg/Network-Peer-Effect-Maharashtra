*Start Group formation 
set more off

use "C:\Users\Agraj\Documents\Network\Data\All_modules_with_ID\A.dta", clear
gen caste_SC = 0
replace caste_SC = 1 if a11==1 | a11==2
label var caste_SC "Scheduled Caste dummy"

*gen caste_ST = 0
*replace caste_ST = 1 if a11==2
*label var caste_ST "Scheduled Tribe dummy"

gen caste_OBC = 0
replace caste_OBC = 1 if a11==3
label var caste_OBC "Other Backward Caste dummy"

gen caste_OM = 0
replace caste_OM = 1 if a11==4
label var caste_OM "Other Minority Groups dummy"

gen caste_GEN = 0
replace caste_GEN = 1 if a11==5
label var caste_GEN "Open General caste dummy"

gen educ_MIDSCH = 0
replace educ_MIDSCH = 1 if  a12==1 | a12==2 | a12==3
label var educ_MIDSCH "Educ dummy - No schooling to Mid School"

gen educ_HIGHSCH = 0
replace educ_HIGHSCH = 1 if a12==4
label var educ_HIGHSCH "Educ dummy - High Schooling"

gen educ_GRAD = 0
replace educ_GRAD = 1 if a12>=5
label var educ_GRAD "Educ dummy - Educ above High school"

gen land_size = 0
*Land size conversion into acres
replace land_size =  a27qty * 2.47105381613712 if  a27unit==2
replace land_size =  a27qty if  a27unit==1
replace land_size =  a27qty*0.025 if  a27unit==3
label var land_size "Land holding size in Acre"

* gen off farm income catagory  a28  a30 
gen off_farm_inc = a28
replace off_farm_inc =1000 if a29==1
replace off_farm_inc =3000 if a29==2
replace off_farm_inc =5000 if a29==3
replace off_farm_inc =7000 if a29==4
replace off_farm_inc =9000 if a29==5
replace off_farm_inc =11000 if a29==6
replace off_farm_inc =13000 if a29==7
replace off_farm_inc =15000 if a29==8
replace off_farm_inc =17000 if a29==9
replace off_farm_inc =19000 if a29==10
replace off_farm_inc =25000 if a29==11
replace off_farm_inc =30000 if a29==12
label variable off_farm_inc "Off- farm Income"

gen farm_inc = a30
replace farm_inc =1000 if a31==1
replace farm_inc =3000 if a31==2
replace farm_inc =5000 if a31==3
replace farm_inc =7000 if a31==4
replace farm_inc =9000 if a31==5
replace farm_inc =11000 if a31==6
replace farm_inc =13000 if a31==7
replace farm_inc =15000 if a31==8
replace farm_inc =17000 if a31==9
replace farm_inc =19000 if a31==10
replace farm_inc =25000 if a31==11
replace farm_inc =30000 if a31==12
label variable farm_inc "Farm Income"




*  Groups formation - Geographical Proximity
sort a7 a8 hhid

gen group_block = .
replace group_block = 1 if a7==1 & a8==1
replace group_block = 2 if a7==1 & a8==4
replace group_block = 3 if a7==1 & a8==2
replace group_block = 4 if a7==2 & a8==2
replace group_block = 5 if a7==7 & a8==1
replace group_block = 6 if a7==2 & a8==1
replace group_block = 7 if a7==2 & a8==3
replace group_block = 8 if a7==5 & a8==1
replace group_block = 9 if a7==3 & a8==1
replace group_block =10 if a7==4 & a8==1
label variable group_block "Block group ID"
 
 

gen group_block_dummy1 = 0
replace group_block_dummy1 = 1 if a7==1 & a8==1
gen group_block_dummy2 = 0
replace group_block_dummy2 = 1 if a7==1 & a8==4
gen group_block_dummy3 = 0
replace group_block_dummy3 = 1 if a7==1 & a8==2
gen group_block_dummy4 = 0
replace group_block_dummy4 = 1 if a7==2 & a8==2
gen group_block_dummy5 = 0
replace group_block_dummy5 = 1 if a7==7 & a8==1
gen group_block_dummy6 = 0
replace group_block_dummy6 = 1 if a7==2 & a8==1
gen group_block_dummy7 = 0
replace group_block_dummy7 = 1 if a7==2 & a8==3
gen group_block_dummy8 = 0
replace group_block_dummy8 = 1 if a7==5 & a8==1
gen group_block_dummy9 = 0
replace group_block_dummy9 = 1 if a7==3 & a8==1
gen group_block_dummy10 = 0
replace group_block_dummy10 = 1 if a7==4 & a8==1
*label variable group_block_dummy "Block group ID"



sort group_block nhhid
by group_block: generate group_block_size = _N
label variable group_block_size "Block level group size"

gen group_block_size_inverse = 1/(group_block_size - 1)
replace group_block_size_inverse = 0 if group_block_size_inverse ==.
label variable group_block_size_inverse "inverse of group block size - 1"





*  Groups formation - Geographical Proximity
sort a7 a8 hhid

gen group_geo = .
replace group_geo = 1 if a7==1 & a8==1
replace group_geo = 1 if a7==1 & a8==4
replace group_geo = 2 if a7==1 & a8==2
replace group_geo = 2 if a7==2 & a8==2
replace group_geo = 3 if a7==7 & a8==1
replace group_geo = 4 if a7==2 & a8==1
replace group_geo = 4 if a7==2 & a8==3
replace group_geo = 5 if a7==5 & a8==1
replace group_geo = 6 if a7==3 & a8==1
replace group_geo = 6 if a7==4 & a8==1
label variable group_geo "Geographical group ID"
 


sort group_geo nhhid
by group_geo: generate group_geo_size = _N
label variable group_geo_size "Geographical group size"

gen group_geo_size_inverse = 1/(group_geo_size - 1)
replace group_geo_size_inverse = 0 if group_geo_size_inverse ==.
label variable group_geo_size_inverse "inverse of group Geo size - 1"


*  Groups formation -  Caste
egen group_caste = group(a11)
label variable group_caste "Caste group ID"

sort group_caste group_geo nhhid
by group_caste: generate group_caste_size = _N
label variable group_caste_size "Geo + Caste group size"

gen group_caste_size_inverse = 1/(group_caste_size - 1)
replace group_caste_size_inverse = 0 if group_caste_size_inverse ==.
label variable group_caste_size_inverse "inverse of group Geo Caste size - 1"



*  Groups formation - Geographical Proximity + Caste
egen group_geo_caste = group( group_geo a11)
label variable group_geo_caste "Geo + Caste group ID"

sort group_geo_caste group_geo nhhid
by group_geo_caste: generate group_geo_caste_size = _N
label variable group_geo_caste_size "Geo + Caste group size"

gen group_geo_caste_size_inverse = 1/(group_geo_caste_size - 1)
replace group_geo_caste_size_inverse = 0 if group_geo_caste_size_inverse ==.
label variable group_geo_caste_size_inverse "inverse of group Geo Caste size - 1"


label variable nhhid "Unique HH ID"

replace a20 = 0 if a20 ==.	
replace a21 = 0 if a21 ==.





save "C:\Users\Agraj\Documents\Network\Data\All_modules_with_ID\A_m.dta", replace





* End of group formation and counting member in the group
* Exported to matlab for construction of G Matrix 
* matlab Code in gmatrix.m 
* Do the labeling of the A module.

