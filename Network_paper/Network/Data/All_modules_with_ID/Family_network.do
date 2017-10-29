clear all
cd "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID"
use "K1.dta", clear

*total tome spent with family in a week
gen time_family_week = 0
label variable time_family_week "Total time spent with family members in a week"
replace time_family_week =  ka104first + ka104second + ka104third

*total time spent with family in a day
gen  time_family_day = 0
label variable time_family_day "Total time spent with family members in a day"
replace time_family_day = ka103first + ka103second + ka103third

*time spent with family on per capita basis in a week
gen test = ka104first + ka104second + ka104third

sort nhhid 
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen time_family_per_ind_week = test1/cnt if cnt !=0
replace  time_family_per_ind_week = 0 if cnt ==0

label variable time_family_per_ind_week "Time spent with family on per capita basis in a week"
drop test test1 cnt 

*time spent with family on per capita basis in a day
gen test = ka103first + ka103second + ka103third
sort nhhid 
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen time_family_per_ind_day = test1/cnt if cnt !=0
replace  time_family_per_ind_day = 0 if cnt ==0

label variable time_family_per_ind_day "Time spent with family on per capita basis in a day"
drop test test1 cnt 

gen daysweek=7*time_family_day
kdensity time_family_week, addplot(kdensity (daysweek)) legend(label(1 "Total time spent with family members in a week") label(2 "Time spent with family members in days*7"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\family_net", replace
drop daysweek

gen daysweek=7*time_family_per_ind_day
kdensity time_family_per_ind_week, addplot(kdensity (daysweek)) legend(label(1 "Total time spent with family members in a week") label(2 "Time spent with family members in days*7"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\family_net_per", replace
drop daysweek

*k density plots
gen daysweek=7*time_family_day
kdensity time_family_week, addplot(kdensity (daysweek)) legend(label(1 "Total time spent with family in a week") label(2 "Time spent with family in days*7"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\family_net", replace
drop daysweek

gen daysweek=7*time_family_per_ind_day
kdensity time_family_per_ind_week, addplot(kdensity (daysweek)) legend(label(1 "Total time spent per individual with family in a week") label(2 "Time spent per individual with family in days*7"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\family_net_per", replace
drop daysweek

 univar  time_family_week time_family_per_ind_week time_family_per_ind_week time_family_per_ind_day
