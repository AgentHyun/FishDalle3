create table feb_17_fruit(

  f_name varchar2(10 char) primary key,
  f_price number(5) not null

)

insert into feb_17_fruit values('Apple', 5000);
insert into feb_17_fruit values('Pair', 7000);
insert into feb_17_fruit values('Grapes', 6000);
insert into feb_17_fruit values('Melon', 10000);
insert into feb_17_fruit values('Orange', 6500);


select * from feb_17_fruit;