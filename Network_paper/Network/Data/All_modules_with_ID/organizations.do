******************************************
clear all
cd "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID"
use "K10.dta", clear

* Organizations membership
gen org1 = kb603first
replace org1=0 if org1==. 
gen org2 = kb603second
replace org2=0 if org2==.
gen org3 = kb603third
replace org3=0 if org3==.
gen org4 = kb603fourth
replace org4=0 if org4==.
gen org5 = kb603fifth
replace org5=0 if org5==.
gen org6 = kb603sixth
replace org6=0 if org6==.
gen org7 = kb603seventh
replace org7=0 if org7==.
gen org8 = kb603eighth
replace org8=0 if org8==.
gen org9 = kb603ninth
replace org9=0 if org9==.
gen org10 = kb603tenth
replace org10=0 if org10==.
gen org11 = kb603eleventh
replace org11=0 if org11==.
gen total_time_org = 0
replace total_time_org = org1 +  org2 +  org3 +  org4 +   org5 +  org6 +  org7 +  org8 +  org9 +  org10 +  org11 +  org11
label variable total_time_org "Total time spent with organizations by each individual"
sort nhhid
gen test = total_time_org
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen time_org_per_ind = test1/cnt if cnt !=0
replace  time_org_per_ind = 0 if cnt ==0

label variable time_org_per_ind `"time spent with organizations per individual"'

drop test test1 cnt


kdensity total_time_org,addplot(kdensity (time_org_per_ind)) legend(label(1 "Total time spent with organizations by each individual") label(2 "time spent with organizations per individual"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\organizations", replace

univar total_time_org time_org_per_ind

/*
gen inf_org1 =  (0.5*kb606first/6) + (0.5*kb607first/6) + (0.5*kb608first) + (0.5*kb609first/6) + (0.5*kb610first/6) + (0.5*kb611first/6) + (0.5*kb612first/6)
gen inf_org2 =  (0.5*kb606second/6) + (0.5*kb607second/6) + (0.5*kb608second) + (0.5*kb609second/6) + (0.5*kb610second/6) + (0.5*kb611second/6) + (0.5*kb612second/6)
gen inf_org3 =  (0.5*kb606third/6) + (0.5*kb607third/6) + (0.5*kb608third) + (0.5*kb609third/6) + (0.5*kb610third/6) + (0.5*kb611third/6) + (0.5*kb612third/6)
gen inf_org4 =  (0.5*kb606fourth/6) + (0.5*kb607fourth/6) + (0.5*kb608fourth) + (0.5*kb609fourth/6) + (0.5*kb610fourth/6) + (0.5*kb611fourth/6) + (0.5*kb612fourth/6)
gen inf_org5 =  (0.5*kb606fifth/6) + (0.5*kb607fifth/6) + (0.5*kb608fifth) + (0.5*kb609fifth/6) + (0.5*kb610fifth/6) + (0.5*kb611fifth/6) + (0.5*kb612fifth/6)
gen inf_org6 =  (0.5*kb606sixth/6) + (0.5*kb607sixth/6) + (0.5*kb608sixth) + (0.5*kb609sixth/6) + (0.5*kb610sixth/6) + (0.5*kb611sixth/6) + (0.5*kb612sixth/6)
gen inf_org7 =  (0.5*kb606seventh/6) + (0.5*kb607seventh/6) + (0.5*kb608seventh) + (0.5*kb609seventh/6) + (0.5*kb610seventh/6) + (0.5*kb611seventh/6) + (0.5*kb612seventh/6)
gen inf_org8 =  (0.5*kb606eighth/6) + (0.5*kb607eighth/6) + (0.5*kb608eighth) + (0.5*kb609eighth/6) + (0.5*kb610eighth/6) + (0.5*kb611eighth/6) + (0.5*kb612eighth/6)
gen inf_org9 =  (0.5*kb606ninth/6) + (0.5*kb607ninth/6) + (0.5*kb608ninth) + (0.5*kb609ninth/6) + (0.5*kb610ninth/6) + (0.5*kb611ninth/6) + (0.5*kb612ninth/6)
gen inf_org10 =  (0.5*kb606tenth/6) + (0.5*kb607tenth/6) + (0.5*kb608tenth) + (0.5*kb609tenth/6) + (0.5*kb610tenth/6) + (0.5*kb611tenth/6) + (0.5*kb612tenth/6)
gen inf_org11 =  (0.5*kb606eleventh/6) + (0.5*kb607eleventh/6) + (0.5*kb608eleventh) + (0.5*kb609eleventh/6) + (0.5*kb610eleventh/6) + (0.5*kb611eleventh/6) + (0.5*kb612eleventh/6)

gen inf_allorg =0
replace inf_allorg = inf_org1+ inf_org2+  inf_org3+  inf_org4 +  inf_org5 + inf_org6 +  inf_org7 + inf_org8 + inf_org9+ inf_org10 +  inf_org11
gen org_time =  inf_org1*org1 +inf_org2*org2 +inf_org3*org3 +inf_org4*org4 +inf_org5*org5 +inf_org6*org6 +inf_org7*org7 +inf_org8*org8 +inf_org9*org9 +inf_org10*org10 +inf_org11*org11
replace org_time=0 if org_time == .
*/
