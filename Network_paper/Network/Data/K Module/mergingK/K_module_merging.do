clear all
log using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\mergeK.smcl", replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K1.dta", clear
merge m:1 id hhid using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K2.dta"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge12.dta", replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge12.dta", clear
rename _merge _merge12
merge m:1 id hhid using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K3.dta"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge123.dta", replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge123.dta", clear
rename _merge merge123
merge m:1 id hhid using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K4.dta"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge1234.dta", replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge1234.dta", clear
rename _merge merge1234
merge m:1 id hhid using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K5A.dta"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge12345.dta", replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge12345.dta", clear
rename _merge merge12345
merge m:1 id hhid using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K5B.dta"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge12345b.dta",replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge12345b.dta", clear
rename _merge merge12345b
merge m:1 id hhid using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K6i.dta"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge123456.dta",replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge123456.dta", clear
rename _merge merge123456
merge m:1 id hhid using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K7chk.dta"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge1234567.dta",replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge1234567.dta", clear
rename _merge merge1234567
merge m:1 id hhid using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K8.dta"
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge12345678.dta",replace

use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\merge12345678.dta", clear
rename _merge merge12345678
merge m:1 hhid using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K10mmmm.dta"
gen hh_head_dummy = 1 if id == kb600name
replace hh_head_dummy = 0 if hh_head_dummy != 1 & id !=""
label variable hh_head_dummy "Household head dummy"
drop _merge merge*
save "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\mergeK.dta",replace
log close

