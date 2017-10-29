 
clear all
cd "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID"
use "K4.dta", clear
foreach var in ka407first ka407second ka407third {
gen `var'_freq_meeting = 0
replace `var'_freq_meeting = 24 if `var'==1
replace `var'_freq_meeting = 12 if `var'==2
replace `var'_freq_meeting = 2 if `var'==3
replace `var'_freq_meeting = 1 if `var'==4
}
foreach var in ka408first ka408second ka408third {
gen `var'_freq_phone = 0
replace `var'_freq_phone = 365 if `var'==1
replace `var'_freq_phone = 104 if `var'==2
replace `var'_freq_phone = 52 if `var'==3
replace `var'_freq_phone = 24 if `var'==4
replace `var'_freq_phone = 12 if `var'==5
replace `var'_freq_phone = 2 if `var'==6
replace `var'_freq_phone = 1 if `var'==7
}
*frequency of meeting in a year with LFI
gen freq_LFI_meeting = 0
label variable freq_LFI_meeting "frequency of meeting in a year with LFI"
replace freq_LFI_meeting =   ka407first_freq_meeting + ka407second_freq_meeting + ka407third_freq_meeting

*frequency of phone calls in a year with LFI
gen  freq_LFI_phone = 0
label variable freq_LFI_phone "frequency of phone calls in a year with LFI"
replace freq_LFI_phone =  ka408first_freq_phone + ka408second_freq_phone + ka408third_freq_phone

*frequency of meetings in a year with LFI per capita basis
gen test = ka407first_freq_meeting + ka407second_freq_meeting + ka407third_freq_meeting

sort nhhid 
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen freq_LFI_per_ind_meeting = test1/cnt if cnt !=0
replace  freq_LFI_per_ind_meeting = 0 if cnt ==0

label variable freq_LFI_per_ind_meeting "frequency of meetings in a year with LFI per capita basis"
drop test test1 cnt 

*frequency of phone calls in a year with LFI per capita basis
gen test = ka408first_freq_phone + ka408second_freq_phone + ka408third_freq_phone
sort nhhid 
by nhhid : egen test1 = total(test)
replace test1 =. if test1 ==0
by nhhid : egen cnt = count(test1)
gen freq_LFI_per_ind_phone = test1/cnt if cnt !=0
replace  freq_LFI_per_ind_phone = 0 if cnt ==0

label variable freq_LFI_per_ind_phone "frequency of phone calls in a year with LFI per capita basis"
drop test test1 cnt 

*k density plots
kdensity freq_LFI_meeting, addplot(kdensity (freq_LFI_phone)) legend(label(1 "frequency of meeting in a year with LFI") label(2 "frequency of phone calls in a year with LFI"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\LFI_net", replace

kdensity freq_LFI_per_ind_meeting, addplot(kdensity (freq_LFI_per_ind_phone)) legend(label(1 "frequency of meetings in a year with LFI per capita basis") label(2 "frequency of phone calls in a year with LFI per capita basis"))
graph save Graph "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\kdensity\LFI_net_per", replace

univar  freq_LFI_meeting freq_LFI_phone freq_LFI_per_ind_meeting freq_LFI_per_ind_phone
