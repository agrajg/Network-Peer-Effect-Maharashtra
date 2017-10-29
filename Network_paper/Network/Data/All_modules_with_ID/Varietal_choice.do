clear all
cd "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID"
use "B13.dta", clear

label variable b13 `"Variety of the seed"' 
* Indicator variable for Varietal Choice
gen ind_vc = 0 if b13==.
replace ind_vc=1 if ind_vc==.
*Land size in acer already created
*Village ID is also created 75 different villages identified 

*generating individual decision
gen var1_dec = 1 if b13==1
replace var1_dec = 0 if b13!=1

gen var2_dec = 1 if b13==2
replace var2_dec = 0 if b13!=2

gen var3_dec = 1 if b13==3
replace var3_dec = 0 if b13!=3

gen var4_dec = 1 if b13==4
replace var4_dec = 0 if b13!=4

gen var5_dec = 1 if b13!=1 & b13!=2 & b13!=3 & b13!=4 & b13!=. 
replace var5_dec = 0 if var5_dec==.

gen switchers = 1 if b15==1 
replace switchers = 0 if b15!=1
label variable switchers `"Individuals who have switched in the current period"'
gen fswitchers = 1 if b16==1
replace fswitchers = 0 if b16!=1
label variable fswitchers `"Individuals who might switch in the next period"'

gen top_one = 0
gen top_two = 0 
gen top_three = 0 
gen top_four = 0

replace top_one = 1 if b13 == 2 
replace top_two = 1 if b13 == 2 | b13 ==1
replace top_three = 1 if b13 == 2 | b13 ==1 | b13 == 3
replace top_four = 1 if b13 == 2 | b13 ==1 | b13 == 3 | b13 == 4 
