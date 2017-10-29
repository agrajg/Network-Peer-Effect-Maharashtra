clear all
set more off
**** 1initial cleaning ****
**** FILES LOCATION ****
cd "C:\Users\Agraj\Documents\MDI\"
insheet using "District_markets_India_2004_Gaurav.csv",name clear
replace district = proper( district )


sort state
by state: gen StateID = 1 if _n==1
replace StateID = sum(StateID)
replace StateID = . if missing(state)

sort state district
by state district: gen DistrictID = 1 if _n==1
replace DistrictID = sum(DistrictID)
replace DistrictID = . if missing(district)

sort state district marketmandi
by state district marketmandi: gen MarketID = 1 if _n==1
replace MarketID = sum(MarketID)
replace MarketID = . if missing(marketmandi)



sort district
by district : gen tot_markets = _N

duplicates drop district, force
save "C:\Users\Agraj\Documents\MDI\2004datadist.dta", replace
clear all
insheet using "GISDistrict.csv"

drop if district==""

merge 1:1 state district using "2004datadist.dta"

drop v?
drop marketmandi- StateID

outsheet state - _merge using "totmkt_2004.csv",comma replace
