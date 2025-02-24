create table rod(

r_name varchar2(10 char) not null,
r_price number(6) not null,
r_damage number (5) not null

);


drop table rod;

insert into rod values('낡은', 3000, 1);
insert into rod values('좋은', 5000, 2);
insert into rod values('대단한', 8000, 3);
insert into rod values('이상한', 10000, 4);

select * from rod;