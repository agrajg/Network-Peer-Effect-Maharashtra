**** REGRESSIONS ****
cd C:\Users\Personal\Documents\Network_paper\Network\Data\Maharashtra_long_data\
do "cont_block.do"
import excel "C:\Users\Agraj\Documents\Network\Data\Maharashtra_long_data\Gmat_geo_reg.xlsx", sheet("Sheet1") firstrow clear



**** REGRESSIONS ****
ivreg2 JxY ( JxGxY = Jxfarmexper - JG2X_highSCH_dummy ) Jxfarmexper- JxGxhighSCH_dummy
mat coeff = e(b)
xmlsave coeff, doctype(excel) replace
*outsheet coeff using "C:\Users\Agraj\Documents\Network\Data\Maharashtra_long_data\Beta_m.csv", comma replace
