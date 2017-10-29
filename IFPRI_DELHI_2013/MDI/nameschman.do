clear all
cd "C:\Users\Personal\Documents\IFPRI_Delhi_2013\MDI\"

insheet using wholemkt.csv, clear name
keep   state district marketmandi city yearofestablishment nameofchairmanadministrator nameofsecretary nameofofficerinchargeofmarketinf
drop if  marketmandi==""


drop if  nameofchairmanadministrator==""


drop if  nameofsecretary==""
gen serialno = _n
gen rand_match = 0

foreach x of numlist  271	558	1249	976	1066	31	329	1129	683	339	1037	1198	550	382	53	983	623	387	1206	239   {
replace rand_match=1 if  serialno==`x'
}
keep if rand_match==1

br

