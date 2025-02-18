create table feb18_error(

e_what varchar2(30 char) primary key,
e_where varchar2(30 char) not null




);

insert into feb18_error values('@뺴먹음', 'DAO');
insert into feb18_error values('mapper입력 빼먹음', 'servlet-context.xml');
insert into feb18_error values('세미콜론(;) 넣음', 'mapper.xml');
insert into feb18_error values('패키지 클래스 X', 'mapper.xml');
insert into feb18_error values('패키지 파일위치', '프로젝트');

select * from FEB18_ERROR;