**Seed Popularity rank regressions


** Assign seedcode and rank and merge
rename b13 seedcode
mmerge seedcode using "C:\Users\Agraj\Documents\Network\Data\seedcode.dta", type(n:1)
drop if caste_SC ==.
replace rank=52 if rank ==.


** regression using high caste low caste dummy
gen highcaste = (a11==5)

sort group_geo
by group_geo: egen ranksum = sum(rank)
gen group_geo_mean_rank = (ranksum - rank)* group_geo_size_inverse
label variable group_geo_mean_rank "mean rank of reference group leaving individual"


sort group_geo
by group_geo: egen highcastesum = sum(highcaste)
gen group_geo_mean_highcaste = (highcastesum - highcaste)* group_geo_size_inverse
label variable group_geo_mean_highcaste "mean rank of reference group leaving individual"



xi:reg rank group_geo_mean_rank highcaste group_geo_mean_highcaste i.group_geo
reg rank group_geo_mean_rank highcaste group_geo_mean_highcaste
