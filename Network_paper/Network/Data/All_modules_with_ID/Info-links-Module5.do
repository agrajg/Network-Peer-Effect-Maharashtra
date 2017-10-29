clear all
cd "C:\Users\Personal\Documents\IFPRI DELHI\Network\Data\All_modules_with_ID"
use "K5Bi.dta", clear
label variable ka502 "type of network 1-family, 2-workplace, 3-friends, 4-LFI"

gen info_croprotation = 0
replace info_croprotation = 1 if  ka506a ==1
label variable info_croprotation "Information dummy - crop rotation"

gen info_spacingcrops = 0
replace info_spacingcrops = 1 if  ka506b ==1
label variable info_spacingcrops "Information dummy - Spacing of crops "

gen info_newseeds = 0
replace info_newseeds = 1 if  ka506c ==1
label variable info_newseeds "Information dummy - information on seeds"

gen info_irrigation = 0
replace info_irrigation = 1 if  ka506d ==1
label variable info_irrigation "Information dummy - New irrigation technology"

gen info_soilmanagement = 0
replace info_soilmanagement = 1 if  ka506e ==1
label variable info_soilmanagement "Information dummy - Soil management"

gen info_othinputuse = 0
replace info_othinputuse = 1 if  ka506f ==1
label variable info_othinputuse "Information dummy - other input use(pesticides, fertilizers etc)"

gen info_othfarmingmet = 0
replace info_othfarmingmet = 1 if  ka506g ==1
label variable info_othfarmingmet "Information dummy - Other farming methods"


sort nhhid pid ka502
by nhhid pid ka502: egen info_croprotation_nbd = total(info_croprotation)
by nhhid pid ka502: egen info_spacingcrops_nbd = total(info_spacingcrops)
by nhhid pid ka502: egen info_newseeds_nbd = total(info_newseeds)
by nhhid pid ka502: egen info_irrigation_nbd = total(info_irrigation)
by nhhid pid ka502: egen info_soilmanagement_nbd = total(info_soilmanagement)
by nhhid pid ka502: egen info_othinputuse_nbd = total(info_othinputuse)
by nhhid pid ka502: egen info_othfarmingmet_nbd = total(info_othfarmingmet)

sort nhhid pid ka502
by nhhid pid ka502: gen count = _n
drop if count >=2

br nhhid pid  ka502 ka501name info_croprotation_nbd info_spacingcrops_nbd info_newseeds_nbd info_irrigation_nbd info_soilmanagement_nbd info_othinputuse_nbd info_othfarmingmet_nbd
 **END - Info-links-Module5.do

