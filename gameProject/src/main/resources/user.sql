create table gameUser(

g_name varchar2(30 char) not null,
g_power number(3) not null,
g_money number(6) not null
);

DROP TABLE gameUser CASCADE CONSTRAINTS;
