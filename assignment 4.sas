libname ajay '/home/ajay4/my_content' ;
run;

proc datasets lib=work;run;

data ajay.diamond;
set import;
run;

proc contents data=ajay.diamond varnum;run;

data ajay.diamond (drop=VAR1);
set ajay.diamond;
run;
/*  */
/*  */
/* Which color has minimum price/carat */
/* Which clarity has maximum price/carat */
/* Which cut has least missing values */ NA 
/* Which color  has maximum median price  */
/* What conclusion can you draw from the variables color, clarityprice  and carat */

data ajay.diamond;
set ajay.diamond;
ppc =price/carat;
run;

proc means data=ajay.diamond median;
var ppc;
class colour  
 clarity ;
run;


proc means data=ajay.diamond n nmiss min max median;
var price;
class colour ;
run;

proc means data=ajay.diamond n nmiss min max mean;
var ppc;
class clarity;
run;

