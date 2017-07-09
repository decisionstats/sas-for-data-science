
data cars;
set sashelp.cars;
run;

proc print data=cars (obs=5);
run;

proc sql;
select distinct(origin)
from cars;
run;


proc sql;
select count(origin),origin
from cars
group by origin;
run;

proc sql;
select count(type),type
from cars
group by type;
run;



proc sql;
select count(type),type,origin
from cars
group by type ,origin;
run;

proc sql;
select avg(mpg_city),origin
from cars
group by origin;
run;



proc sql;
select max(mpg_city),origin
from cars
group by origin;
run;


proc sql;
select min(mpg_city),origin
from cars
group by origin;
run;



proc sql;
create table test1 
as 
        select avg(mpg_city),origin
from cars
        group by origin;
run;




