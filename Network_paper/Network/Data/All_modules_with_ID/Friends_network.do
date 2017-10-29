
clear all
cd "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID"
use "K3.dta", clear

*total tome spent with friends in a week
gen time_friends_week = 0
label variable time_friends_week "Total time spent with friends members in a week"
replace time_friends_week =  ka307first + ka307second + ka307third

*total time spent with friends in a day
gen  time_friends_day = 0
label variable time_friends_day "Total time spent with friends members in a day"
replace time_friends_day = ka306first + ka306second + ka306third

*time spent with friends on per capita basis in a week
gen test = ka307first + ka307second + ka307third

sort nhhid 
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen time_friends_per_ind_week = test1/cnt if cnt !=0
replace  time_friends_per_ind_week = 0 if cnt ==0

label variable time_friends_per_ind_week "Time spent with friends on per capita basis in a week"
drop test test1 cnt 

*time spent with friends on per capita basis in a day
gen test = ka306first + ka306second + ka306third
sort nhhid 
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen time_friends_per_ind_day = test1/cnt if cnt !=0
replace  time_friends_per_ind_day = 0 if cnt ==0

label variable time_friends_per_ind_day "Time spent with friends on per capita basis in a day"
drop test test1 cnt 

*k density plots
gen daysweek=7*time_friends_day
kdensity time_friends_week, addplot(kdensity (daysweek)) legend(label(1 "Total time spent with friends in a week") label(2 "Time spent with friends in days*7"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\friends_net", replace
drop daysweek

gen daysweek=7*time_friends_per_ind_day
kdensity time_friends_per_ind_week, addplot(kdensity (daysweek)) legend(label(1 "Total time spent per individual with friends in a week") label(2 "Time spent per individual with friends in days*7"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\friends_net_per", replace
drop daysweek

univar  time_friends_week time_friends_day time_friends_per_ind_week time_friends_per_ind_day
