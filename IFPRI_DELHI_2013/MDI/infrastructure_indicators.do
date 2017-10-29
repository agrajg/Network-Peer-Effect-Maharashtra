**** MARKET IFRASTRUCTURE INDEX *****
set more off
cd "C:\Users\Personal\Documents\IFPRI_Delhi_2013\MDI"
do "1initial_cleaning.do"

keep state marketmandi city district informationnoticeboardelectricdi publicaddresssystem arethepricesdisplayedonthenotice internalroads parking fencing postoffice bank inputsundryshops electricity auctionplatform gradingandanalysinglaboratory mechanicalgraders sieves garbagedisposalsystem sweepingfacilities informationunit extensionunit audiovisualside

***CORE INFRASTRUCTURE INDICATORS *** 
sort district
by district : gen tot_markets = _N


rename informationnoticeboardelectricdi info_notice
rename arethepricesdisplayedonthenotice price_notice_board
rename gradingandanalysinglaboratory grading_lab

local infrastructure "info_notice- audiovisualside"

foreach x of varlist `infrastructure'    {
gen yes_`x'=0 
replace yes_`x' = 1 if `x' =="Yes"
replace yes_`x' = 0 if `x' =="No"
by district : egen cnt_`x' = total(yes_`x')
*by district : gen frac_`x' = cnt_`x'/tot_markets
*by district : gen frac_`x' = cnt_`x'/tot_markets
by district : egen frac_`x' = mean(yes_`x')

}

gen core_infra_indicator = yes_auctionplatform + yes_grading_lab + yes_publicaddresssystem + yes_info_notice + yes_price_notice_board + yes_electricity + yes_mechanicalgraders + yes_sieves  + yes_garbagedisposalsystem + yes_sweepingfacilities + yes_informationunit + yes_extensionunit + yes_audiovisualside              
*yes_auctionplatform + yes_grading_lab + yes_publicaddresssystem + yes_info_notice + yes_price_notice_board + yes_electricity + yes_mechanicalgraders + yes_sieves  + yes_garbagedisposalsystem + yes_sweepingfacilities + yes_informationunit + yes_extensionunit + yes_audiovisualside
gen comp_infra_indicator = yes_internalroads+ yes_parking + yes_fencing + yes_postoffice + yes_bank
by district : egen cnt_core_infra_indicator = total(core_infra_indicator)
by district : gen frac_core_infra_indicator = cnt_core_infra_indicator/(13 * tot_markets)

by district : egen cnt_comp_infra_indicator = total(comp_infra_indicator)
by district : gen frac_comp_infra_indicator = cnt_comp_infra_indicator/(tot_markets * 5)



drop marketmandi city
drop info_notice - audiovisualside
duplicates drop district, force

save "infrastructure_indicators.dta", replace
clear all
insheet using "GISDistrict.csv"
drop if district==""
merge 1:1 state district using "infrastructure_indicators.dta"

drop v?


outsheet state - _merge using "Infrastructure_map.csv",comma replace


***END OF DO FILE***
