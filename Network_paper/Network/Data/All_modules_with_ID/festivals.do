set more off

******************************************
clear all
cd "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID"
use "K7.dta", clear

* time spent during Festivals 


 *kb304qtyfirst kb304qtysecond kb304qtythird kb304qtyfourth kb304qtyfifth kb304qtysixth kb304qtyseventh 
 *kb304unitfirst kb304unitsecond kb304unitthird kb304unitfourth kb304unitfifth kb304unitsixth kb304unitseventh
drop kb306osecond kb306ofirst
foreach var of varlist kb306* {
replace `var' = 0 if `var'!=1
}  
gen nav_days= kb304qtyfirst if kb304unitfirst==1
replace nav_days = (kb304qtyfirst/24) if kb304unitfirst==2
replace nav_days = 0 if nav_days==.
gen inf_nav = (0.5*kb306opt1first/6)+(0.5*kb306opt2first/6)+(0.5*kb306opt3first/1)+(0.5*kb306opt4first/6)+(0.5*kb306opt5first/6)+(0.5*kb306opt6first/6)+(0.5*kb306opt7first)


gen diw_days= kb304qtysecond if kb304unitsecond==1
replace diw_days = (kb304qtysecond/24) if kb304unitsecond==2
replace diw_days = 0 if diw_days==.
gen inf_diwali =(0.5*kb306opt1second/6)+(0.5*kb306opt2second/6)+(0.5*kb306opt3second/1)+(0.5*kb306opt4second/6)+(0.5*kb306opt5second/6)+(0.5*kb306opt6second/6)+(0.5*kb306opt7second)


gen holi_days= kb304qtythird if kb304unitthird==1
replace holi_days = (kb304qtythird/24) if kb304unitthird==2
replace holi_days = 0 if holi_days==.
gen inf_holi =(0.5*kb306opt1third/6)+(0.5*kb306opt2third/6)+(0.5*kb306opt3third/1)+(0.5*kb306opt4third/6)+(0.5*kb306opt5third/6)+(0.5*kb306opt6third/6)+(0.5*kb306opt7third)

 
gen id_days= kb304qtyfourth if kb304unitfourth==1
replace id_days = (kb304qtyfourth/24) if kb304unitfourth==2
replace id_days = 0 if id_days==.
gen inf_id =(0.5*kb306opt1fourth/6)+(0.5*kb306opt2fourth/6)+(0.5*kb306opt3fourth/1)+(0.5*kb306opt4fourth/6)+(0.5*kb306opt5fourth/6)+(0.5*kb306opt6fourth/6)+(0.5*kb306opt7fourth)


gen teej_days= kb304qtyfifth if kb304unitfifth==1
replace teej_days = (kb304qtyfifth/24) if kb304unitfifth==2
replace teej_days = 0 if teej_days==.
gen inf_teej= (0.5*kb306opt1fifth/6)+(0.5*kb306opt2fifth/6)+(0.5*kb306opt3fifth/1)+(0.5*kb306opt4fifth/6)+(0.5*kb306opt5fifth/6)+(0.5*kb306opt6fifth/6)+(0.5*kb306opt7fifth)

gen lohri_days= kb304qtysixth if kb304unitsixth==1
replace lohri_days = (kb304qtysixth/24) if kb304unitsixth==2
replace lohri_days = 0 if lohri_days==.
gen inf_lohri= (0.5*kb306opt1sixth/6)+(0.5*kb306opt2sixth/6)+(0.5*kb306opt3sixth/1)+(0.5*kb306opt4sixth/6)+(0.5*kb306opt5sixth/6)+(0.5*kb306opt6sixth/6)+(0.5*kb306opt7sixth)



gen oth_days= kb304qtyseventh if kb304unitseventh==1
replace oth_days = (kb304qtyseventh/24) if kb304unitseventh==2
replace oth_days = 0 if oth_days==.
gen inf_othf= (0.5*kb306opt1seventh/6)+(0.5*kb306opt2seventh/6)+(0.5*kb306opt3seventh/6)+(0.5*kb306opt4seventh/6)+(0.5*kb306opt5seventh/6)+(0.5*kb306opt6seventh/6)+(0.5*kb306opt7seventh)    

*total information nodes
gen info_fest_total =  inf_nav +  inf_diwali +  inf_holi +  inf_id +  inf_teej +  inf_lohri +  inf_othf
gen time_fest_total =  nav_days +   diw_days +   holi_days +   id_days +   teej_days +   lohri_days +   oth_days
label variable time_fest_total "Total time spent in festivals by each individual"
sort nhhid
gen test = time_fest_total
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen time_fest_per_ind = test1/cnt if cnt !=0
replace  time_fest_per_ind = 0 if cnt ==0

label variable time_fest_per_ind `"time spent in festivals per individual"'

drop test test1 cnt


kdensity time_fest_total,addplot(kdensity (time_fest_per_ind)) legend(label(1 "Total time spent in festivals by each individual") label(2 "time spent in festivals per individual"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\festivals", replace

univar time_fest_total time_fest_per_ind
