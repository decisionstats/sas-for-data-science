/* SAS for R Users */

/* install packages R has 12000 packages */
/* install.packages("XML") */
/*  */
/* SAS has 200 components  */
/*  */
/* Base SAS – Basic procedures and data management */
/* SAS/STAT – Statistical analysis */
/* SAS/GRAPH – Graphics and presentation */
/* SAS/OR – Operations research */
/* SAS/ETS – Econometrics and Time Series Analysis */
/* SAS/IML – Interactive matrix language */
/* AS University Edition includes the SAS products Base SAS®, SAS/STAT®, SAS/IML®, SAS/ACCESS® Interface to PC Files, and SAS® Studio.  */

proc print data=sashelp.iris (obs=5);
run;
/* loading */

/* library(XML) */
/* sas just needs component to be installed and licensed properly */

/* data input */

/* ajay=c(10,20,30,40) */

data ajaydata;
input ajay;
datalines ;
10
20
30
40
;
run;

data ajaydata2;
input age names $;
cards;
50 ajay
60 vijay
60 john
80 ram
;
run;

data temp;
infile DATALINES dsd missover;
input a b c d;
CARDS;
1, 2, 3, 4
, 3, , 5
, 3
;
run;


data temp2;
infile DATALINES dsd ;
input a b c d;
CARDS;
1, 2, 3, 4
, 3, , 5
, 3
;
run;




/* http://support.sas.com/documentation/cdl/en/basess/68381/HTML/default/viewer.htm#n1qwzamyuzfaaen1nu2t702adpi7.htm */
/*  */
/* The MISSOVER option prevents the DATA step from going to the next line */
/*  if it does not find values in the current record for all of */
/*  the variables in the INPUT statement.  */
/*  Instead, the DATA step assigns a missing value for all v */
/*  ariables that do not have complete values according to any */
/*  specified informats. */

/* importing csv */

/* read.csv */
/* fread in data.table*/
/* read_csv  in  readr */


/* readxl in readxl package */
/* read.sas7bdat in sas7bdat package */


/* In SAS */
FILENAME REFFILE '/home/ajay4/my_content/class4/Diamond (7).csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV 
/* 	dbms can change */
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;

/* Import a sas dataset */
libname ajay '/home/ajay4/my_content' ;
run;

proc datasets lib=ajay;run;

data diamond;
set ajay.import;
run;



/* in R dir */

proc datasets lib=ajay;
run;

/* print */

/* ajay #object name */;

proc print data=ajaydata;
run;


proc print data=ajaydat (obs=5);
run;

proc print data=sashelp.cars(firstobs=10 obs=20);
run;


proc print data=sashelp.cars(firstobs=10 obs=20);
var make model type origin;
run;



/* in R */
/* head(ajay,5) */

/* 10 to 20 row */
/* ajay[10:20,] */


/* mtcars[10:20,1:4] */
/* mtcars[10:20,c("mpg","cyl","disp","hp")] */
commenting

/* commenting in sas x */

/* in R use # */

/* in R use str() for structure and names for column names */
/* in SAS */;
proc contents data=sashelp.cars;
run;
/* KEEP */
data cars2 (keep=make model type origin );
set sashelp.cars;
run;


in R

/* mtcars2=mtcars[,1:4] */
/* mtcars3=mtcars[,c("mpg","cyl","gear","wt")] */

/*  */
/* library(dplyr) */
/* mtcars3=select(mtcars,"mpg","cyl","gear","wt") */

/* DROP */
;
data cars3 (drop=make  type origin );
set sashelp.cars;
run;

/* mtcars7=mtcars[,-c("mpg","cyl","gear","wt")] */

proc means data=sashelp.cars;
run;

proc means data=sashelp.cars  n nmiss min p25 mean p75 max;
run;

proc means data=sashelp.cars mean;
var invoice;
class origin;
run;

proc sql;
select avg(invoice) as avg_invoice,origin
from sashelp.cars
group by origin;
run;

/*  */
/* library(Hmisc) */
/* summarize(mtcars$mpg,mtcars$cyl,mean) */

/*  */
/* library(sqldf) */
/* sqldf("select avg(mpg) from mtcars group by cyl") */
/*  */
/* library(data.table) */
/* mtcars=data.table(mtcars) */
/* mtcars[,mean(mpg),cyl] */


/*  */
/* library(dplyr) */
/* mtc=group_by(mtcars,cyl) */
/* summarise(mtc,mean(mpg)) */
/* summarise(mtc,mean(mpg),max(hp)) */

/* #MISSING VALUES */

data temp;
infile DATALINES dsd missover;
input a b c d;
CARDS;
1, 2, 3, 4
, 3, , 5
, 3
;
run;


data temp3;
set temp;
if a=. then a=1;
if b =. then b=1;
if c=. then c=mean(c); 
/* this creates error in c */
if d=. then d=4.5;
run;

proc standard data=temp out=temp3 replace print;
run;

for R
na=missing
na.rm=T ignore missing
na.omit delete all missing
is.na (checks if missing)
ifelse used for conditional replacement
/*https://stackoverflow.com/questions/43839160/how-to-replace-missing-data-in-r-with-median-data-based-on-a-condition  */
/* na.locf */
/* na.aggregate */

Frequency Tables and Factor Variables
/*  */
/* data(mtcars) */
/* class(mtcars$cyl) */
/* mtcars$cyl=as.factor(mtcars$cyl) */
/* summary(mtcars$cyl) */
/* table(mtcars$cyl) */
/*  */
/* class(mtcars$gear) */
/* mtcars$gear=as.factor(mtcars$gear) */
/* summary(mtcars$gear) */
/* table(mtcars$gear) */
/*  */
/* table(mtcars$gear,mtcars$cyl) */;

proc freq data =sashelp.cars nlevels;
/* tables origin model; */
run;



proc freq data =sashelp.cars ;
tables drivetrain model origin;
run;


proc freq data =sashelp.cars ;
tables drivetrain*origin;
run;

proc freq data =sashelp.cars ;
tables drivetrain*origin/norow nocol nocum nopercent;
run;


proc freq data =sashelp.cars ;
tables drivetrain*origin*type/norow nocol nocum nopercent;
run;




proc contents data=sashelp.cars;
run;

proc means data=sashelp.cars;
var cylinders;
run;

data carsnew;
set sashelp.cars;
cylinders2=input(cylinders,$8.);
run;

proc contents data=carsnew;
/* var cylinders cylinders2; */
run;

data ajay;
format dob date9. b date9.;
dob=input("7jun1977",date9.);
b=today();
c=dob-b;
run;


data ajay2;
a="1234567";
run;

proc contents data=ajay2;
run;


data ajay21;
set ajay2;
a2=1*a;
run;

proc contents data=ajay21;
run;

/* http://support.sas.com/documentation/cdl/en/lrcon/65287/HTML/default/p1wj0wt2ebe2a0n1lv4lem9hdc0v.htm */
/*  */
/* DATE9. is an INFORMAT. In an INPUT statement,  */
/* it provides the SAS interpreter with a set of */
/*  translation commands it can send to the compiler  */
/*  to turn your text into the right numbers, which will */
/*  then look like a date once the right FORMAT is applied. FORMATs are  */
/* just visible representations of numbers (or characters). */



/* money=c("50000","50,000","$50000",50000,"50000.00") */
/* money2=gsub(",","",money) */
/* money2 */
/* money3=gsub("\\$","",money2) */
/* money3 */
/* money4=as.numeric(money3) */
/* money4 */

data money;
input money $ ;
datalines;
"50000"
50,000
$50000
50000
50000.00
;
run;
data money;
set  money;
money=translate(money,'','"');
money=translate(money,'',',');
money=translate(money,'','$');
 run;
proc contents data=money;
run;

data money;
set money;
money2=1*money;
run;
