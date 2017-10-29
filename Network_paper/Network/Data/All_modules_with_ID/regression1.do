*** Regresion 1
gen most_pop_var = 0
replace most_pop_var = 1 if b13 == 2
label var most_pop_var "Most popular dummy"
fsum  most_pop_var a13  a20 a21 a26 caste_SC  caste_OBC caste_OM caste_GEN educ_MIDSCH educ_HIGHSCH educ_GRAD  off_farm_inc farm_inc land_size, label
* G matrix
sort  group_geo nhhid

generate order_id = _n
label var order_id "Individual/Groups arranged ID"

outsheet nhhid group_geo group_geo_size group_geo_size_inverse group_caste group_caste_size group_caste_size_inverse order_id using "C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\A_m.csv", comma replace
outsheet  a13 a21 a26 land_size  off_farm_inc farm_inc educ_HIGHSCH educ_GRAD using "C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\X_m.csv", comma replace
outsheet group_block_dummy1 group_block_dummy2 group_block_dummy4 group_block_dummy5 group_block_dummy6 group_block_dummy7 group_block_dummy8 group_block_dummy9 group_block_dummy10 using "C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\BLK_m.csv", comma replace 
outsheet caste_OBC caste_SC using "C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\CST_m.csv", comma replace
outsheet most_pop_var using "C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\Y_m.csv", comma replace
** rum matlab code "independent.m"
insheet using "C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\Gmat_geo_reg.csv", clear 
label variable a13 "People in the household"
label variable a21 "No of male members 16-60 yrs of age"
label variable a26 "years lived in the village"
save "C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\Bram_reg_blkgrp.dta", replace


 
 
 
 *ivregress liml rent pcturban (hsngval = faminc i.region)
