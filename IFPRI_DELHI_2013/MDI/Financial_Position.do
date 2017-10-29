**** MARKET Finanacial Position INDEX *****
set more off
cd "C:\Users\Personal\Documents\IFPRI_Delhi_2013\MDI"
do "2initialcleaning.do"
*keep state marketmandi city district 
***Financial Indicatores ****	
*keep state district annualincome annualexpenditure surplusdeficit totalreserveswithapmcon31stmarch totalliabilitiesloanetcwithapmco
sort district
by district : gen tot_markets = _N
destring  ann_inc ann_exp sul_def tot_res  tot_lia, replace force
*replace ann_inc=0 if annualincome=="0"  
*replace ann_exp=0 if annualexpenditure=="0"
*replace sul_def=0 if surplusdeficit=="0"
*replace tot_res=0 if totalreserveswithapmcon31stmarch=="0"
*replace tot_lia=0 if totalliabilitiesloanetcwithapmco=="0"

destring annualincome annualexpenditure surplusdeficit totalreserveswithapmcon31stmarch totalliabilitiesloanetcwithapmco, replace force
replace ann_inc=annualincome if annualincome!=.
replace ann_exp=annualexpenditure if annualexpenditure!=.
replace sul_def=surplusdeficit if surplusdeficit!=.
replace tot_res=totalreserveswithapmcon31stmarch if totalreserveswithapmcon31stmarch!=.
replace tot_lia=totalliabilitiesloanetcwithapmco if totalliabilitiesloanetcwithapmco!=.






local financial "ann_inc - tot_lia"

foreach x of varlist `financial'    {
by district : egen mean_`x' = mean(`x')
}

gen surplus_dummy=1 if  mean_sul_def>=0
replace surplus_dummy=0 if mean_sul_def<0
replace surplus_dummy=. if mean_sul_def==.
by district : gen surplus_dist_m =  mean_sul_def/100000 if surplus_dummy==1
by district : gen deficit_dist_m = -1* mean_sul_def/100000 if surplus_dummy==0


gen annual_income_m = mean_ann_inc/100000
gen annual_exp_m= mean_ann_exp/100000





duplicates drop district, force

save "financial_indicators.dta", replace
clear all
insheet using "GISDistrict.csv"
drop if district==""
merge 1:1 state district using "financial_indicators.dta"
drop v?

outsheet state - _merge using "financial_map.csv",comma replace


***END OF DO FILE***
