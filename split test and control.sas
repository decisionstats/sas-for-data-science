
data cars;
set sashelp.cars;
run;

data cars2;
set sashelp.cars;
where ranuni(12) <=.25;
run;

data cars3 cars4;
set sashelp.cars;
if ranuni(12)<=.25 then output cars3;
else output cars4;
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