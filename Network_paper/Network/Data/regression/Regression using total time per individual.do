set more off
****Regression using total time per individual
cd D:\Network\Data\Stata_data
do "Post Abdul conversation.do"
egen bl_caste_grp = group(blockid a11), missing



*** Generating top1 , 2 , 3 , 4 varieties
gen top_one = 0
replace top_one = 1 if var2_dec == 1
gen top_two = 0
replace top_two = 1 if var1_dec == 1 | var2_dec == 1
gen top_three = 0 
replace top_three = 1 if var1_dec == 1 | var2_dec == 1 | var3_dec == 1
gen top_four = 0
replace top_four = 1 if  var1_dec == 1 | var2_dec == 1 | var3_dec == 1 | var4_dec == 1

*** Creating group adoption variables
*fractions of adopters at block level(for other classifications of reference group create a new refgroupid?. Copy paste the whole thing and change the number? )
rename  refgroupid1 block 
rename  refgroupid2 blockcaste

label variable land_size `"Landholding size"'




xi i.a11 i.blockid i.b13 i.bl_caste_grp
foreach var of varlist top_* {
foreach var1 of varlist block blockcaste {
sort `var1' `var'
by `var1' `var' : gen dec_freq = _N
by `var1' : gen group_freq = _N
gen adopters =  dec_freq if  `var'==1
replace adopters =   group_freq - dec_freq if  `var'==0
gen frac_`var'_in_`var1' = (adopters- `var')/(group_freq - 1)
label variable frac_`var'_in_`var1' "Fraction of adopteres of `var' most popular variety in `var1' group"
drop dec_freq group_freq adopters
**

gen int_frnd_`var'_`var1' = frnd_net_per_ind*frac_`var'_in_`var1'
label variable int_frnd_`var'_`var1' " Interaction of frnd time with group adoption of `var' most popular variety in `var1' group"
gen int_lfi_ph_`var'_`var1' = lfiphone_net_per_ind*frac_`var'_in_`var1'
label variable int_lfi_ph_`var'_`var1' " Interaction of LFI phone time with group adoption of `var' most popular variety in `var1' group"
gen int_np_agnp_`var'_`var1' = np_agnp_per_ind*frac_`var'_in_`var1'
label variable int_np_agnp_`var'_`var1' " Interaction of newspaper time with group adoption of `var' most popular variety in `var1' group"
gen int_rd_tv_`var'_`var1' = tv_rd_per_ind*frac_`var'_in_`var1'
label variable int_rd_tv_`var'_`var1' " Interaction of frnd time with group adoption of `var' most popular variety in `var1' group"
gen int_fest_`var'_`var1' = fest_net_per_ind*frac_`var'_in_`var1'
label variable int_fest_`var'_`var1' " Interaction of frnd time with group adoption of `var' most popular variety in `var1' group"
gen int_temple_`var'_`var1' = temple_net_per_ind*frac_`var'_in_`var1'
label variable int_temple_`var'_`var1' " Interaction of frnd time with group adoption of `var' most popular variety in `var1' group"
gen int_org_`var'_`var1' = org_net_each_ind*frac_`var'_in_`var1'
label variable int_org_`var'_`var1' " Interaction of frnd time with group adoption of `var' most popular variety in `var1' group"
}
}
foreach var of varlist top_* {
** `var' at block level with  time per individual in Household with group adoption
probit `var' frac_`var'_in_block int_frnd_`var'_block int_np_agnp_`var'_block int_rd_tv_`var'_block int_fest_`var'_block int_temple_`var'_block int_org_`var'_block a26 hsc_dum  pc_off_farm _Ia11_* 
** `var' at block and caste level with  time per individual in Household with group adoption
probit `var' frac_`var'_in_blockcaste int_frnd_`var'_blockcaste int_np_agnp_`var'_blockcaste int_rd_tv_`var'_blockcaste int_fest_`var'_blockcaste int_temple_`var'_blockcaste int_org_`var'_blockcaste a26 hsc_dum  pc_off_farm _Ia11_* _Iblockid_* 
*br `var' frac_`var'_in_block int_frnd_`var'_block int_np_agnp_`var'_block int_rd_tv_`var'_block int_fest_`var'_block int_temple_`var'_block int_org_`var'_block a26 hsc_dum  pc_off_farm _Ia11_*
}
**REGRESSION for switching

** Fraction of switchers at block level 
sort  block switchers
by block switchers : gen  dec_freq= _N
by block : gen  group_freq= _N
gen adopters =  dec_freq if  switchers==1
replace adopters =   group_freq - dec_freq if  switchers==0
gen frac_switchers_in_block = (adopters- switchers)/(group_freq - 1)
drop dec_freq group_freq adopters

** Fraction of switchers at block + caste level
sort  blockcaste switchers
by blockcaste switchers : gen  dec_freq= _N
by blockcaste : gen  group_freq= _N
gen adopters =  dec_freq if  switchers==1
replace adopters =   group_freq - dec_freq if  switchers==0
gen frac_switchers_in_blockcaste = (adopters- switchers)/(group_freq - 1)
drop dec_freq group_freq adopters


gen int_frnd_switchers_block = frnd_net_per_ind*frac_switchers_in_block
label variable int_frnd_switchers_block " Interaction of frnd time with group adoption of switchers most popular variety in block group"
gen int_lfi_ph_switchers_block = lfiphone_net_per_ind*frac_switchers_in_block
label variable int_lfi_ph_switchers_block " Interaction of LFI phone time with group adoption of switchers most popular variety in block group"
gen int_np_agnp_switchers_block = np_agnp_per_ind*frac_switchers_in_block
label variable int_np_agnp_switchers_block " Interaction of newspaper time with group adoption of switchers most popular variety in block group"
gen int_rd_tv_switchers_block = tv_rd_per_ind*frac_switchers_in_block
label variable int_rd_tv_switchers_block " Interaction of frnd time with group adoption of switchers most popular variety in block group"
gen int_fest_switchers_block = fest_net_per_ind*frac_switchers_in_block
label variable int_fest_switchers_block " Interaction of frnd time with group adoption of switchers most popular variety in block group"
gen int_temple_switchers_block = temple_net_per_ind*frac_switchers_in_block
label variable int_temple_switchers_block " Interaction of frnd time with group adoption of switchers most popular variety in block group"
gen int_org_switchers_block = org_net_each_ind*frac_switchers_in_block
label variable int_org_switchers_block " Interaction of frnd time with group adoption of switchers most popular variety in block group"

gen int_frnd_switchers_blockcaste = frnd_net_per_ind*frac_switchers_in_blockcaste
label variable int_frnd_switchers_blockcaste " Interaction of frnd time with group adoption of switchers most popular variety in blockcaste group"
gen int_lfi_ph_switchers_blockcaste = lfiphone_net_per_ind*frac_switchers_in_blockcaste
label variable int_lfi_ph_switchers_blockcaste " Interaction of LFI phone time with group adoption of switchers most popular variety in blockcaste group"
gen int_np_agnp_switchers_blockcaste = np_agnp_per_ind*frac_switchers_in_blockcaste
label variable int_np_agnp_switchers_blockcaste " Interaction of newspaper time with group adoption of switchers most popular variety in blockcaste group"
gen int_rd_tv_switchers_blockcaste = tv_rd_per_ind*frac_switchers_in_blockcaste
label variable int_rd_tv_switchers_blockcaste " Interaction of frnd time with group adoption of switchers most popular variety in blockcaste group"
gen int_fest_switchers_blockcaste = fest_net_per_ind*frac_switchers_in_blockcaste
label variable int_fest_switchers_blockcaste " Interaction of frnd time with group adoption of switchers most popular variety in blockcaste group"
gen int_temple_switchers_blockcaste = temple_net_per_ind*frac_switchers_in_blockcaste
label variable int_temple_switchers_blockcaste " Interaction of frnd time with group adoption of switchers most popular variety in blockcaste group"
gen int_org_switchers_blockcaste = org_net_each_ind*frac_switchers_in_blockcaste
label variable int_org_switchers_blockcaste " Interaction of frnd time with group adoption of switchers most popular variety in blockcaste group"


** switchers at block level with  time per individual in Household with group adoption
probit switchers frac_switchers_in_block int_frnd_switchers_block int_np_agnp_switchers_block int_rd_tv_switchers_block int_fest_switchers_block int_temple_switchers_block int_org_switchers_block a26 hsc_dum  pc_off_farm _Ia11_* 
** switchers at block and caste level with  time per individual in Household with group adoption
probit switchers frac_switchers_in_blockcaste int_frnd_switchers_blockcaste int_np_agnp_switchers_blockcaste int_rd_tv_switchers_blockcaste int_fest_switchers_blockcaste int_temple_switchers_blockcaste int_org_switchers_blockcaste a26 hsc_dum  pc_off_farm _Ia11_* _Iblockid_* 



*** REGRESSIONS without group adoption vbariable

***top variety 
foreach var of varlist top_* {
** `var' at block level with  time per individual in Household without group adoption
probit `var' int_frnd_`var'_block int_np_agnp_`var'_block int_rd_tv_`var'_block int_fest_`var'_block int_temple_`var'_block int_org_`var'_block a26 hsc_dum  pc_off_farm _Ia11_* _Iblockid_*
** `var' at block and caste level with  time per individual in Household without group adoption
probit `var' frac_`var'_in_blockcaste int_frnd_`var'_blockcaste int_np_agnp_`var'_blockcaste int_rd_tv_`var'_blockcaste int_fest_`var'_blockcaste int_temple_`var'_blockcaste int_org_`var'_blockcaste a26 hsc_dum  pc_off_farm _Ibl_caste_*
*br `var' frac_`var'_in_block int_frnd_`var'_block int_np_agnp_`var'_block int_rd_tv_`var'_block int_fest_`var'_block int_temple_`var'_block int_org_`var'_block a26 hsc_dum  pc_off_farm _Ia11_*
}
***Switching
** switchers at block level with  time per individual in Household without group adoption
probit switchers int_frnd_switchers_block int_np_agnp_switchers_block int_rd_tv_switchers_block int_fest_switchers_block int_temple_switchers_block int_org_switchers_block a26 hsc_dum  pc_off_farm _Ia11_* _Iblockid_*
** switchers at block and caste level with  time per individual in Household without group adoption
probit switchers frac_switchers_in_blockcaste int_frnd_switchers_blockcaste int_np_agnp_switchers_blockcaste int_rd_tv_switchers_blockcaste int_fest_switchers_blockcaste int_temple_switchers_blockcaste int_org_switchers_blockcaste a26 hsc_dum  pc_off_farm  _Ibl_caste_*

