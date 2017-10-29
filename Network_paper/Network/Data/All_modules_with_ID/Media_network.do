******************************************
clear all
cd "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID"
use "K6.dta", clear

gen me_np_week = 0
gen me_agnp_week = 0
gen me_rd_week = 0
gen me_tv_week = 0
gen me_np_day = 0
gen me_agnp_day = 0
gen me_rd_day = 0
gen me_tv_day = 0

gen inf_np=.
gen inf_agnp=.
gen inf_rd=.
gen inf_tv=.

foreach var of varlist  kb206* {
replace `var' = 0 if `var'!=1
}
replace me_np_week= kb203first
replace me_np_day= kb202first
replace inf_np =  (0.5*kb206opt1first/6)+(0.5*kb206opt2first /6)+(0.5*kb206opt3first)+(0.5*kb206opt4first /6)+(0.5*kb206opt5first /6)+(0.5*kb206opt6first /6)+(0.5*kb206opt7first/6)

replace me_agnp_day =  kb202second if  kb200second == 2 
replace me_agnp_day =  kb202third if  kb200third == 2
replace me_agnp_day =  kb202fourth if  kb200fourth == 2

replace me_agnp_week = kb203second if kb200second == 2 
replace me_agnp_week = kb203third if kb200third== 2 
replace me_agnp_week = kb203fourth if kb200fourth == 2 

replace me_rd_day =  kb202second if  kb200second == 3 
replace me_rd_day =  kb202third if  kb200third == 3
replace me_rd_day =  kb202fourth if  kb200fourth == 3

replace me_rd_week = kb203second if kb200second == 3
replace me_rd_week = kb203third if kb200third== 3
replace me_rd_week = kb203fourth if kb200fourth == 3 


replace me_tv_day =  kb202second if  kb200second == 4 
replace me_tv_day =  kb202third if  kb200third == 4
replace me_tv_day =  kb202fourth if  kb200fourth == 4

replace me_tv_week = kb203second if kb200second == 4
replace me_tv_week = kb203third if kb200third== 4
replace me_tv_week = kb203fourth if kb200fourth == 4

replace me_np_week = 0 if me_np_week ==.
replace me_agnp_week = 0 if me_agnp_week ==.
replace me_rd_week = 0 if me_rd_week ==.
replace me_tv_week = 0 if me_tv_week ==.
replace me_np_day = 0 if me_np_day ==.
replace me_agnp_day = 0 if me_agnp_day ==.
replace me_rd_day = 0 if me_rd_day ==.
replace me_tv_day = 0 if me_tv_day ==.



sort nhhid
** Newspaper per individial per day

gen test = me_np_day
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen np_day_per_ind = test1/cnt if cnt !=0
replace  np_day_per_ind = 0 if cnt ==0

label variable np_day_per_ind `"Newspaper per individual in a day"'

gen np_day_each_ind = test
label variable np_day_each_ind `"Newspaper at each individual level in a day"'

drop test test1 cnt

** Ag Newspaper per individial per day
gen test = me_agnp_day
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen agnp_day_per_ind = test1/cnt if cnt !=0
replace  agnp_day_per_ind = 0 if cnt ==0

label variable agnp_day_per_ind `"Ag Newspaper per individual in a day"'

gen agnp_day_each_ind = test
label variable agnp_day_each_ind `" Ag Newspaper at each individual level in a day"'

drop test test1 cnt
gen np_agnp_per_ind_day = np_day_per_ind + agnp_day_per_ind
label variable np_agnp_per_ind_day `"Time spent with NP and AGNP in a day per individual"'
gen np_agnp_each_ind_day = np_day_each_ind + agnp_day_each_ind
label variable np_agnp_each_ind_day "Time spent with NP and AGNP by each individual in a day"

** Radio per individial per day

gen test = me_rd_day
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen rd_day_per_ind = test1/cnt if cnt !=0
replace  rd_day_per_ind = 0 if cnt ==0


label variable rd_day_per_ind `"Radio per individual in a day"'

gen rd_day_each_ind = test
label variable rd_day_each_ind `" Radio at each individual level in a day"'

drop test test1 cnt

**Television per individial per day

gen test = me_tv_day
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen tv_day_per_ind = test1/cnt if cnt !=0
replace  tv_day_per_ind = 0 if cnt ==0

label variable tv_day_per_ind `"Television per individual in a day"'

gen tv_day_each_ind = test
label variable tv_day_each_ind `" Television at each individual level in a day"'

drop test test1 cnt
gen tv_rd_each_ind_day = tv_day_each_ind + rd_day_each_ind
label variable tv_rd_each_ind_day `"Time spent with TV and radio by each individual in a day"'
gen tv_rd_per_ind_day = tv_day_per_ind + rd_day_per_ind
label variable tv_rd_per_ind_day `"Time spent with TV and radio per individual in a day"'

 ** Newspaper per individial per week

gen test = me_np_week
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen np_week_per_ind = test1/cnt if cnt !=0
replace  np_week_per_ind = 0 if cnt ==0

label variable np_week_per_ind `"Newspaper per individual in a week"'

gen np_week_each_ind = test
label variable np_week_each_ind `"Newspaper at each individual level  in a week"'

drop test test1 cnt

** Ag Newspaper per individial per week
gen test = me_agnp_week
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen agnp_week_per_ind = test1/cnt if cnt !=0
replace  agnp_week_per_ind = 0 if cnt ==0

label variable agnp_week_per_ind `"Ag Newspaper per individual in a week"'

gen agnp_week_each_ind = test
label variable agnp_week_each_ind `" Ag Newspaper at each individual level in a week"'

drop test test1 cnt
gen np_agnp_per_ind_week = np_week_per_ind + agnp_week_per_ind
label variable np_agnp_per_ind_week `"Time spent with NP and AGNP in a week per individual"'
gen np_agnp_each_ind_week = np_week_each_ind + agnp_week_each_ind
label variable np_agnp_each_ind_week "Time spent with NP and AGNP by each individual in a week"

** Radio per individial per week

gen test = me_rd_week
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen rd_week_per_ind = test1/cnt if cnt !=0
replace  rd_week_per_ind = 0 if cnt ==0


label variable rd_week_per_ind `"Radio per individual in a week"'

gen rd_week_each_ind = test
label variable rd_week_each_ind `" Radio at each individual level in a week"'

drop test test1 cnt

**Television per individial per week

gen test = me_tv_week
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen tv_week_per_ind = test1/cnt if cnt !=0
replace  tv_week_per_ind = 0 if cnt ==0

label variable tv_week_per_ind `"Television per individual in a week"'

gen tv_week_each_ind = test
label variable tv_week_each_ind `" Television at each individual level in a week"'

drop test test1 cnt
gen tv_rd_each_ind_week = tv_week_each_ind + rd_week_each_ind
label variable tv_rd_each_ind_week `"Time spent with TV and radio by each individual in a week"'
gen tv_rd_per_ind_week = tv_week_per_ind + rd_week_per_ind
label variable tv_rd_per_ind_week `"Time spent with TV and radio per individual in a week"'



*k density plots
kdensity np_agnp_per_ind_day, addplot(kdensity (np_agnp_per_ind_week)) legend(label(1 "Time spent with NP and AGNP in a day per individual") label(2 "Time spent with NP and AGNP in a week per individual"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\np_agnp_per_ind", replace 

kdensity np_agnp_each_ind_day, addplot(kdensity (np_agnp_each_ind_week)) legend(label(1 "Time spent with NP and AGNP by each individual in a day") label(2 "Time spent with NP and AGNP by each individual in a day"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\np_agnp_each_ind", replace
  
kdensity tv_rd_per_ind_day, addplot(kdensity (tv_rd_per_ind_week)) legend(label(1 "Time spent with TV and radio per individual in a day") label(2 "Time spent with TV and radio per individual in a week"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\tv_rd_per_ind", replace

kdensity tv_rd_each_ind_day, addplot(kdensity (tv_rd_each_ind_week)) legend(label(1 "Time spent with TV and radio by each individual in a day") label(2 "Time spent with TV and radio by each individual in a week"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\tv_rd_each_ind", replace


univar  np_day_per_ind np_day_each_ind agnp_day_per_ind agnp_day_each_ind np_agnp_per_ind_day np_agnp_each_ind_day rd_day_per_ind rd_day_each_ind tv_day_per_ind tv_day_each_ind tv_rd_each_ind_day tv_rd_per_ind_day np_week_per_ind np_week_each_ind agnp_week_per_ind agnp_week_each_ind np_agnp_per_ind_week np_agnp_each_ind_week rd_week_per_ind rd_week_each_ind tv_week_per_ind tv_week_each_ind tv_rd_each_ind_week tv_rd_per_ind_week
   
 
