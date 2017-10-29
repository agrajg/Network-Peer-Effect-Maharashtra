* Run sequence
clear all 
*log close
cd "C:\Users\Agraj\Documents\"
do "Network\Data\All_modules_with_ID\1Group_formation.do"
do "Network\Data\All_modules_with_ID\2label_Amod.do"
do "Network\Data\All_modules_with_ID\3Descriptives.do"
do "C:\Users\Agraj\Documents\Network\Data\All_modules_with_ID\4popularity_regression_bram.do"
