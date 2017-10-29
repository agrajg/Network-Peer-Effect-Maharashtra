***Arrangements and group formation
clear all
set more off
***Change file location 
*cd F:\Maharashtra_long_data
cd C:\Users\Personal\Documents\Network_paper\Network\Data\Maharashtra_long_data
use Mahalongdata.dta 
drop if variety==.
drop if farmexper==. |  bajfmexper==. |  eduhead==.  | hhsize2==.| socialgrp==. 
sort variety 
by variety: gen farmers = _N
** Ranking seed variety 
sort farmers
by farmers: gen rank = 1 if _n==1
replace rank = sum(rank)
replace rank = . if missing(farmers)
replace rank = rank/25
**Indentifiers for blocks
sort block_gis
by block_gis: gen block_ID = 1 if _n==1
replace block_ID = sum(block_ID)
replace block_ID = . if missing(block_gis)
label variable block_ID "Block ID "

** fraction of adopters in block refesrece grp
sort block_ID
by block_ID: gen farmersadopt = _N
gen refadopt = farmersadopt - 1
gen group_block_size_inverse = 1/refadopt

** regression using high caste low caste dummy
gen highcaste = (socialgrp==5)

sort block_ID
by block_ID: egen ranksum = sum(rank)
gen block_ID_mean_rank = (ranksum - rank)* group_block_size_inverse
label variable block_ID_mean_rank "mean rank of reference group leaving individual"


sort block_ID
by block_ID: egen highcastesum = sum(highcaste)
gen block_ID_mean_highcaste = (highcastesum - highcaste)* group_block_size_inverse
label variable block_ID_mean_highcaste "mean rank of reference group leaving individual"


*** creating block ID parallel to map
rename district districtID
sort districtID block_gis
by districtID block_gis: gen blockNUM = 1 if _n==1
by districtID : replace blockNUM = sum(blockNUM)
replace blockNUM = . if missing(block_gis)
gen blockmapID = 10*districtID + blockNUM
label variable blockmapID "block ID parallel to map"

*** Social group : 1=Open/General 2=OBC/muslims/cristians 3=SC/ST
gen social_group = 3 if (socialgrp ==1 | socialgrp==2)
replace  social_group = 2 if (socialgrp ==3 | socialgrp==4) & social_group==.
replace  social_group = 1 if socialgrp ==5 & social_group==.
label variable social_group "Social group : 1=Open/General 2=OBC/muslims/cristians 3=SC/ST"




***Geographically contiguous Groups
gen geo_group = 1 if (blockmapID==41 | blockmapID==42 | blockmapID==43)
replace geo_group = 2 if (blockmapID==61 | blockmapID==62 | blockmapID==64) & geo_group==.
replace geo_group = 3 if (blockmapID==27 | blockmapID==26 | blockmapID==23 | blockmapID==24 | blockmapID==53 | blockmapID==55 | blockmapID==21 | blockmapID==22 |blockmapID==25 | blockmapID==51 | blockmapID==54 | blockmapID==32 | blockmapID==52) & geo_group ==.
replace geo_group = 4 if (blockmapID==63 | blockmapID==12 | blockmapID==11 | blockmapID==71 | blockmapID==72 | blockmapID==73) & geo_group==.
replace geo_group = 5 if (blockmapID==31 | blockmapID==33) & geo_group==.
*replace geo_group = 6 if (blockmapID==91 | blockmapID==92 | blockmapID==93 | blockmapID==81 | blockmapID==82) & geo_group==.
*replace geo_group = 7 if (blockmapID==81 | blockmapID==82) & geo_group==.
label variable geo_group "Geographically contiguous Groups ID"
drop if geo_group==.

***EDUCATION HIGHschOOL
gen highsch_dummy = 0 if (eduhead<4 | eduhead==11 | eduhead==.)
replace highsch_dummy=1 if highsch_dummy==.

*** BLOCK AND CASTE DUMMY
tabulate social_group, gen(caste_dummy)
tabulate blockmapID, gen(block_dummy)


*** LEFT HAND VARIABLE
drop rank
sort variety
by variety: gen count_farmers = _N
sort count_farmers
by count_farmers: gen rank = 1 if _n==1
replace rank = sum(rank)
replace rank = . if missing(count_farmers)
label variable rank "Rank of varity - least popular first"



****REGRESSIONS DO FILES

*do "cont_block.do"

*xi:reg rank block_ID_mean_rank highcaste block_ID_mean_highcaste i.block_ID
*reg rank block_ID_mean_rank highcaste block_ID_mean_highcaste
