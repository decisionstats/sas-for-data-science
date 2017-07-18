





data baseball;
set sashelp.baseball;
run;

proc print data=baseball;
run;

data baseball;
set sashelp.baseball (firstobs=30 obs=54);
run;

proc print data=baseball;
run;

data baseball;
set sashelp.baseball;
run;

proc sort data=baseball;
by team;
run;


proc print data=baseball;
var nhits nruns;
sum nhits nruns;
by team;
run;

proc sort data=sashelp.baseball out=baseball;
by team;
run;



proc print data=baseball;
var team nhits nruns nhome;
sum nhits  ;
by team;
run;

proc datasets lib=sashelp memtype=data;

proc contents data=baseball;
/* var team nhits nruns nhome; */
/* sum nhits  ; */
/* by team; */
run;


data baseball;
set sashelp.baseball;
run;


proc contents data=baseball;
run;

proc contents data=baseball varnum;
run;

proc freq data=baseball;
tables team;
run;


proc freq data=baseball;
tables team /nocol nopercent norow nocum;
run;

proc freq data=baseball nlevels;
/* tables team /nocol nopercent norow nocum; */
run;

data cars;
set sashelp.cars;
run;

proc print data=cars (obs=5);
run;


proc contents data=cars varnum;
run;

proc freq data=cars nlevels;
run;

proc freq data=cars;
tables cylinders type origin drivetrain/nocum nocol norow;
run;

proc freq data=cars;
tables cylinders*drivetrain/nocol nopercent norow nocum;
run;


proc means data=cars;
var mpg_city;
run;


proc means data=cars;
/* var mpg_city; */
run;


proc means data=cars n mean;
var  
EngineSize
Horsepower
MPG_City
MPG_Highway
Weight
Wheelbase
Length
;
run;



proc means data=cars;
var mpg_city;
run;


proc means data=cars;
/* var mpg_city; */
run;


proc means data=cars mean;
var  
MPG_Highway 
;
class origin drivetrain cylinders;
run;


proc means data=cars mean;
var  
MPG_Highway 
;
class cylinders;
run;

proc summary data=cars print;
vars cylinders mpg_city;
run;

/* mileage is mpg_city */
/* dataset is cars */
proc means data=cars  n mean max min;
var mpg_city;
class  drivetrain ;
run;
/* front */
proc means data=cars  n mean max min;
var mpg_city;
class  origin;
run;
/* usa */

/* which drivetrain gives maximum mileage */
/* which origin gives least mileage */
/* which origin has maximum 8 cylinder cars */
/* which drivetrain has maximum 6 cylinder cars */
proc freq data=cars;
tables  origin*cylinders /norow nocol nocum nopercent;
run;
/* #Europe */

proc freq data=cars;
tables  drivetrain*cylinders /norow nocol nocum nopercent;
run;
/* front */

/*  */

proc means data=cars n;
var cylinders;
class drivetrain;
output out= ajay;
run;

proc print data=ajay;
run;

proc univariate data=cars;
var mpg_city;
run;


proc univariate data=cars normal;
var mpg_city;
run;


proc univariate data=cars plot;
var mpg_city;
run;
