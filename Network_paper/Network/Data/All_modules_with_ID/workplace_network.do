clear all
cd "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID"
use "K2.dta", clear

*total tome spent with Work place onfarm in a week
gen time_wponfarm_week = 0
label variable time_wponfarm_week "Total time spent with wponfarm members in a week"
replace time_wponfarm_week =  ka207first + ka207second + ka207third

*total time spent with Work place offarm in a day
gen  time_wpoffarm_week = 0
label variable time_wpoffarm_week "Total time spent with wpoffarm members in a day"
replace time_wpoffarm_week = ka208first + ka208second + ka208third

*time spent with Work place onfarm on per capita basis in a week
gen test =  ka207first + ka207second + ka207third

sort nhhid 
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen time_wponfarm_per_ind_week = test1/cnt if cnt !=0
replace  time_wponfarm_per_ind_week = 0 if cnt ==0

label variable time_wponfarm_per_ind_week "Time spent with wponfarm on per capita basis in a week"
drop test test1 cnt 

*time spent with Work place offarm on per capita basis in a week
gen test = ka208first + ka208second + ka208third
sort nhhid 
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen time_wpoffarm_per_ind_week = test1/cnt if cnt !=0
replace  time_wpoffarm_per_ind_week = 0 if cnt ==0

label variable time_wpoffarm_per_ind_week "Time spent with wponfarm on per capita basis in a day"
drop test test1 cnt 

*k density plots
kdensity time_wponfarm_week, addplot(kdensity (time_wpoffarm_week)) legend(label(1 "Total time spent with wponfarm members in a week") label(2 "Total time spent with wpoffarm members in a week"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\workplace_net", replace

kdensity time_wponfarm_per_ind_week, addplot(kdensity (time_wpoffarm_per_ind_week)) legend(label(1 "Time spent per capita with wponfarm members in a week") label(2 "Time spent per capita with wpoffarm members in a week"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\workplace_net_per", replace

univar  time_wponfarm_week time_wpoffarm_week time_wponfarm_per_ind_week time_wpoffarm_per_ind_week
