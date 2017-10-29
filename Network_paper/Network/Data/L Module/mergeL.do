use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\L1.dta", clear
merge 1:1 hhid id using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\L2.dta"
rename _merge mergel12
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\mergeL.dta", replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\mergeL.dta", clear
merge m:1 hhid id using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\L3.dta"
rename _merge mergel123
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\mergeL.dta", replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\mergeL.dta", clear
merge m:1 hhid id using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\L41.dta"
rename _merge mergel12341
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\mergeL.dta", replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\mergeL.dta", clear
merge m:1 hhid id using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\L42.dta"
rename _merge mergel23412
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\mergeL.dta", replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\mergeL.dta", clear
merge m:1 hhid id using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\L43.dta"
rename _merge mergel234123
drop merge*

save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\mergeL.dta", replace
