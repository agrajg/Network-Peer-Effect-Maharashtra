*** Regression2
use "C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\Bram_reg_blkgrp.dta", clear
reg  y  gxy  a13 a21 a26 land_size off_farm_inc farm_inc educ_highsch educ_grad caste_obc caste_sc  gxxcst* group_block_dummy*
ivregress 2sls y a13 a21 a26 land_size off_farm_inc farm_inc educ_highsch educ_grad caste_obc caste_sc  gxxcst* group_block_dummy* (gxy = g2xcst* g3xcst*)
