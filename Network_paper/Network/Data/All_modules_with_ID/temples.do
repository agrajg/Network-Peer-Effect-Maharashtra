******************************************
clear all
cd "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID"
use "K8.dta", clear

 
* Time spent in temples

gen temple_time= kb403
replace temple_time=0 if temple_time==.
label variable temple_time "Total time spent in temples by each individual"

sort nhhid
gen test = temple_time
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen temple_time_per_ind = test1/cnt if cnt !=0
replace  temple_time_per_ind = 0 if cnt ==0

label variable temple_time_per_ind `"time spent in temples per individual"'

drop test test1 cnt


kdensity temple_time,addplot(kdensity (temple_time_per_ind)) legend(label(1 "Total time spent in temples by each individual") label(2 "time spent in temples per individual"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\temples", replace

univar temple_time temple_time_per_ind






*gen inf_temple = (0.5*kb406opt1/6)+(0.5*kb406opt2/6)+(0.5*kb406opt3/1)+(0.5*kb406opt4/6)+(0.5*kb406opt5/6)+(0.5*kb406opt6/6)+(0.5*kb406opt7)
*gen com_temple = temple_time * inf_temple
*replace com_temple=0 if com_temple==.
