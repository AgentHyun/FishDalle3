create table gameFish(
f_no number(3) not null, 
f_name varchar2(10char) not null,
 f_price number(5) not null
 

);
create sequence g_seq;
insert into GAMEFISH values(g_seq.NEXTVAL,'고등어', 500);
insert into GAMEFISH values(g_seq.NEXTVAL,'레몬피쉬', 2000);
insert into GAMEFISH values(g_seq.NEXTVAL,'블루피쉬', 700);
insert into GAMEFISH values(g_seq.NEXTVAL,'학꽁치', 300);
insert into GAMEFISH values(g_seq.NEXTVAL,'흰동가리', 1000);
insert into GAMEFISH values(g_seq.NEXTVAL,'복어', 2500);
insert into GAMEFISH values(g_seq.NEXTVAL,'문어', 2000);
insert into GAMEFISH values(g_seq.NEXTVAL,'꽃게', 4500);
insert into GAMEFISH values(g_seq.NEXTVAL,'새우', 500);
insert into GAMEFISH values(g_seq.NEXTVAL,'도미', 3000);
insert into GAMEFISH values(g_seq.NEXTVAL,'참치', 3500);
insert into GAMEFISH values(g_seq.NEXTVAL,'조개', 300);

DROP SEQUENCE g_seq;


SELECT * FROM GAMEFISH;
DROP TABLE gameFish CASCADE CONSTRAINTS;