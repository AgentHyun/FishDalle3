create table gameFish(
f_no number(3) not null, 
f_name varchar2(10char) not null,
 f_price number(5) not null
 

);
create sequence g_seq;
insert into GAMEFISH values(g_seq.NEXTVAL,'고등어', 1000);
insert into GAMEFISH values(g_seq.NEXTVAL,'레몬피쉬', 5000);
insert into GAMEFISH values(g_seq.NEXTVAL,'블루피쉬', 1500);
insert into GAMEFISH values(g_seq.NEXTVAL,'학꽁치', 2000);
insert into GAMEFISH values(g_seq.NEXTVAL,'흰동가리', 3000);
SELECT * FROM GAMEFISH;
DROP TABLE gameFish CASCADE CONSTRAINTS;