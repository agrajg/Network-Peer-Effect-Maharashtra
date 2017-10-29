***September 14 , 2012
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\K Module\mergingK\K_module_merging.do"
br  hhid id  ka100id ka100name hh_head_dummy ka200id ka200name ka300id ka300name ka400id ka400name ka500id ka501name kb200id kb200name kb300idfirst kb300idseventh kb300name kb400id kb400name kb400pid kb400pname kb600idfirst kb600name
* huge mess in individual ID . Best option would be to use names as individual ID. 
do "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\L Module\mergeL.do"
br hhid id  la100name la200name  la300name lb100name lb200name lb300name
* name goes well with social attitude data too
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\A.dta", clear
br hhid
use "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\B1.dta", clear
merge 1:1 hhid using "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\Stata_data\B13.dta"
br hhid
