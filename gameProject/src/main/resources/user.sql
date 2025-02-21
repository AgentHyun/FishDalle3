create table gameUser(

g_name varchar2(30 char) not null,
g_power number(3) not null,
g_money number(6) not null
);

DROP TABLE gameUser CASCADE CONSTRAINTS;

create table userInventory(

f_name varchar2(10 char) not null,
f_price number(6) not null,
f_size number (5) not null

);
select * from userInventory;
insert into userInventory values('고등어', 1000, 30);
DROP TABLE userInventory CASCADE CONSTRAINTS;