clear all
set more off
**** 1initial cleaning ****
**** FILES LOCATION ****
cd "C:\Users\Personal\Documents\IFPRI_Delhi_2013\MDI"
insheet using "fin_mkt_raw.csv", name clear

replace district = proper( district )
*drop v?? v???
*drop availabilityof
*foreach x of varlist informationnoticeboardelectricdi- storagefacilitiesavailableinthem    {
*replace `x' = "No" if strmatch(`x',"*N?*")==1
*replace `x' = "Yes" if strmatch(`x',"*Y??*")==1
*}

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
