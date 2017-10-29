*A.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\A.dta", clear
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\A.dta", replace

*B1.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\B1.dta", clear
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\B1.dta", replace

*B13.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\B13.dta", clear
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\B13.dta", replace


*K1.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\K1.dta", clear
gen hhid = hhidfirst
gen name = ka100namefirst
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\K1.dta", replace

*K2.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\K2.dta", clear
gen hhid = hhidfirst
gen name = ka200namefirst
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\K2.dta", replace

*K3.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\K3.dta", clear
gen hhid = hhidfirst
gen name = ka300namefirst
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\K3.dta", replace

*K4.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\K4.dta", clear
gen hhid = hhidfirst
gen name = ka400namefirst
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\K4.dta", replace

*K5A.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\K5A.dta", clear
drop hhid
gen hhid = hhidfirst
gen name = ka501namefirst
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\K5A.dta", replace

*K5B.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\K5B.dta", clear
drop hhid
gen hhid = hhidfirst
gen name = ka501namefirst
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\K5B.dta", replace

*K6.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\K6.dta", clear
gen hhid = hhidfirst
gen name = kb200namefirst
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\K6.dta", replace

*K7.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\K7.dta", clear
gen hhid = hhidfirst
gen name = kb300namefirst
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\K7.dta", replace

*K8.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\K8.dta", clear
gen name = kb400name
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\K8.dta", replace

*K10.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\K10.dta", clear
gen hhid = hhidfirst
gen name = kb600nameeleventh
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\K10.dta", replace

*L1.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\L1.dta", clear
gen name = la100name
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\L1.dta", replace

*L2.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\L2.dta", clear
gen name = la200name
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\L2.dta", replace

*L3.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\L3.dta", clear
gen name = la300name
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\L3.dta", replace

*L41.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\L41.dta", clear
gen name =   lb100name
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\L41.dta", replace

*L42.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\L42.dta", clear
gen name =   lb200name
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\L42.dta", replace

*L43.dta
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_dta_without_pid\L43.dta", clear
gen name =   lb300name
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\generating pid.do"
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\genhhid.do"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID\L43.dta", replace
*END
