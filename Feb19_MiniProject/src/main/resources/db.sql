create table golfsite_member(
	gs_id varchar2(10 char) primary key,
	gs_pw varchar2(10 char) not null,
	gs_name varchar2(10 char) not null,
	gs_addr varchar2(200 char) not null,
	gs_photo varchar2(200 char) not null,
	gs_role char(1 char) not null
);

select * from golfsite_member;