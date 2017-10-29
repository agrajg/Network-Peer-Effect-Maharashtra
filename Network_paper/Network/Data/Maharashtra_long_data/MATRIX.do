**** G MATRIX AND J MATRIX   ****

sort  geo_group hhid
by geo_group : gen geo_group_size = _N - 1
gen geo_group_size_inverse = 1/geo_group_size

***OrderID
generate order_id1 = _n
label var order_id1 "Individual/Contiguous Groups arranged ID"
sort order_id1 

*hhid geo_group geo_group_size geo_group_size_inverse order_id1
mkmat geo_group_size_inverse, matrix(X)
