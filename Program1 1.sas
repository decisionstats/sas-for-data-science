/* name of code */
/* what it does */
/* create by  */
/* on which date */
/* version */


data cars;
set sashelp.cars;
run;

data cars2;
set sashelp.cars;
where ranuni(12) <=.25;
run;

PROC SURVEYSELECT DATA=cars  OUT=test_cars METHOD=srs SAMPRATE=0.25;
RUN;

PROC SURVEYSELECT DATA=cars outall OUT=test_cars2 METHOD=srs SAMPRATE=0.25;
RUN;

proc print data=test_cars2 (obs=6);
var selected;
run;

proc freq data=test_cars2;
tables selected/norow nocol nocum nopercent;
run;

data test ;
set test_cars2;
where selected=0 ;
run;

data control ;
set test_cars2;
where selected=1 ;
run;


/* first proc */
proc datasets lib=work;
run;

proc delete data=cars2;
run;

libname ajay '/home/ajay4/test';
run;

data ajay.test;
set test;
run;

data ajay.control;
set control;
run;
/* second proc */
proc contents data=test;
run;

proc contents data=test varnum;
run;

/* third proc */
proc print data=test (obs=5);
run;

proc print data=test (obs=50);
var selected;
run;

/* fourth proc */
/* proc summary data=test print; */
/* run; */

proc means data=test;
run;

proc means data=test nmiss  mean median;
run;

proc means data=test nmiss  mean median;
var mpg_city invoice;
run;


proc means data=test n  mean median;
var mpg_city invoice;
class origin;
run;


proc means data=ajay.cars2 n  mean median;
var  invoice;
class origin;
run;


proc means data=ajay.cars2    mean median;
var  invoice;
class origin;
run;

/* #fifth proc */

proc freq data=ajay.cars2;
tables Make;
run;

proc freq data=ajay.cars2;
tables invoice;
run;

proc freq data=ajay.cars2;
tables Origin /nocum nopercent;
run;

/* sixth proc */

proc univariate data =cars;
var mpg_city;
run;


proc univariate data =cars plot;
var Invoice;
run;

/* Seventh proc */

proc corr data=ajay.cars2;
run;

/* Data Manipulation */
data cars3;
set ajay.cars2;
if mpg_city > 0 AND mpg_city <=19 THEN mileage_type='LOW MILEAGE'; 
else if mpg_city > 19 AND mpg_city<=25 THEN mileage_type='AVG MILEAGE';
else if  mpg_city > 25 AND mpg_city<=29 THEN mileage_type='HIGH MILEAGE';
else mileage_type='VERY HIGH MILEAGE';
run;

data car31;
set ajay.cars2;
where Origin="Asia";
run;

data cars4 (keep= make origin mpg_city);
set cars3;
run;


data cars5;
set cars3 (drop=make origin type mpg_city);
run;
/* proc  */


proc freq data=cars3;
tables mileage_type/nopercent nocum norow nocol;
run;


/* Question */
/* which car gives maximum mileage per unit invoice value */

data carsq;
set sashelp.cars;
valueq= mpg_city/invoice;
run;

proc means data=carsq max;
var valueq;
run;
proc contents data=carsq;
run;
data carsq2;
set carsq;
where valueq>0.00345;
run;
/* Eigth proc and a data manipulator */


proc sql;
create table cars77
as
select * 
from sashelp.cars;
run;


proc sql;
create table carsEurope
as
select * 
from sashelp.cars
where origin="Europe";
run;

proc sql;
create table carsEurope
as
select * 
from sashelp.cars
where origin="Europe" and mpg_city>24;
run;


proc sql;
select avg(mpg_city),origin 
from sashelp.cars
group by origin;
run;

proc means data=sashelp.cars mean;
var mpg_city;
class origin;
run;


/* how do I comment */
/* my name is a comment */

PROC SQL;
SELECT model,type,
CASE
WHEN mpg_city BETWEEN 0 AND 19 THEN 'LOW MILEAGE'
WHEN mpg_city BETWEEN 19 AND 25 THEN 'AVG MILEAGE'
WHEN mpg_city BETWEEN 25 AND 29 THEN 'HIGH MILEAGE'
ELSE 'VERY HIGH MILEAGE'
END AS mileageCAT
FROM sashelp.cars;
QUIT;

proc sql;
create table car17
as 
select * from sashelp.cars
where 
( mpg_city>select avg(mpg_city) from sashelp.cars);
run;


/*  Tenth Proc */

proc sort data=car17;
by mpg_city;
run;

data first    ;
do i = 1 to 10;
   y =i**2;
output;
end;
run;

data second    ;
do i = 1 to 100 by 5;
   y =i**2;
output;
end;
run;
data third  (drop=i)  ;
do i = 1 to 100 by 5;
   y =i**2;
output;
end;
run;


data fourth  (drop=i)  ;
do i = 100 to 1 by -20;
   y =i**2;
output;
end;
run;

data something (drop=i);
do i =1 to 10;
b=i**2+2*i;
output;
end;
run;



