**** REgRESSIONS ****


cd C:\Users\Personal\Documents\Network_paper\Network\Data\Maharashtra_long_data\
do "cont_block.do"
set more off

insheet using "gmat_geo_reg2.csv",  clear


**** REGRESSIONS ****



ivreg2 jxy ( jxgxy = jxfarmexper -  jg2x_highsch_dummy ) jxfarmexper- jxgxhighsch_dummy, noc


mat coeff = e(b)


*outreg2 using results.xls, ///
*                keep(`keeplist')  ///
*                adds(R-square,e(r2),MSE,e(rmse)) addtext(Year FE,yes,Industry FE,yes,Exporter FE,yes,Exporter-time FE,no,Eporter-industry FE,no) ctitle(index) ///
*                sortvar(`keeplist')

     
**** Export Matrix of Coefficient

drop _all
svmat coeff
outsheet using "coeff.csv", comma replace


**** importing for 2GSLS
insheet using "gmat_geo_reg2.csv",  clear
*ivreg2 jxy ( jxgxy = jxfarmexper -  jg2x_highsch_dummy ) jxfarmexper- jxgxhighsch_dummy, noc
