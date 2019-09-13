/*
 * Generate D-optimal designs 
 *  reference: https://www.lexjansen.com/nesug/nesug05/an/an1.pdf
 * 
 */

****************************** set up **************************; 
%let title = ORECHOVKA bez optimalizace koreni; 
%let var = x m v d;
%let factors = x=3 m=3 v=2 d=3;  
%let levels = x nvals=(15 19 25) /*change COUNTS to GRAMS*/
m nvals=(600 1100 1500) /*[g] of sugar*/
v nvals=(0 851) /*[g] of water*/
d nvals=(3 4.5 6) /*[weeks] of maceration*/
; 
%let model = x x*x m m*m x*m v d ;  * d*d
; 
* log(d) -> d+d*d as a Taylor expansion but d*d must be omitted due to # of degr. of fr.;
%let n_runs = 9;
****************************************************************; 
* model specification here:http://support.sas.com/documentation/cdl/en/qcug/63964/HTML/default/viewer.htm#qcug_optex_a0000000393.htm;

* get all possible combinations;
proc plan ordered seed=15500; 
factors &factors. /noprint; 
output out=variants
   &levels 
; 
run; 

* find the optimal design;
proc optex data=variants seed=7765811; 
model &model.; 
generate iter=1000 
         criterion=D 
         n = &n_runs.
; 
output out=design; 
title &title; 
run; 

* print the optimal design;
proc sort data=design;
 by &var;
proc print data=design;
run;