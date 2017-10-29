*** Contiguous blocks and Caste grouping

***CONTIGUOUS BLOCKS


sort  geo_group social_group hhid
egen geo_caste_group = group(geo_group social_group)
by geo_caste_group : gen geo_caste_group_size = _N - 1
gen geo_caste_group_size_inverse = 1/geo_group_size

***OrderID
generate order_id2 = _n
label var order_id2 "Individual/Contiguous Groups arranged ID"
sort order_id2 





outsheet hhid geo_caste_group geo_caste_group_size geo_caste_group_size_inverse order_id2 using "C:\Users\Agraj\Documents\Network\Data\Maharashtra_long_data\A_m.csv", comma replace
outsheet hhid agehead bajfmexper totldsize rainfed_pct smallfarme order_id1 using "C:\Users\Agraj\Documents\Network\Data\Maharashtra_long_data\X_m.csv", comma replace
outsheet hhid rank order_id2 using "C:\Users\Agraj\Documents\Network\Data\Maharashtra_long_data\Y_m.csv", comma replace
outsheet hhid caste_dummy* order_id1 using "C:\Users\Agraj\Documents\Network\Data\Maharashtra_long_data\CST_m.csv", comma replace
outsheet hhid block_dummy* order_id1 using "C:\Users\Agraj\Documents\Network\Data\Maharashtra_long_data\BLK_m.csv", comma replace

***matlab code to generate G matrix and J matrix and multiply them
***Import back the multiplied stuff

***Merge stuff 
***Run regressions
