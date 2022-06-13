-- 14. 사용자 접근제어 (Privilege)

-- SQL Plus 실행 가정

-- 14.1 새로운 사용자 생성
conn /as sysdba;
create user c##foo identified by a12345;
create user c##bar identified by a12345;

-- 14.2 c##manager 롤 생성
conn /as sysdba;
create role c##manager;
grant create table, create view to c##manager;
grant c##manager to c##foo, c##bar;


-- 14.3 c##foo를 통해 hr 사용자의 사원(employees) 테이블의 총 데이터 수 구하기
grant create session to c##foo, c##bar;

conn hr/hr;
grant select on employees to c##foo with grant option;

conn c##foo/a12345;
select count(*) from hr.employees;

grant select on employees to c##bar;

conn c##bar/a12345;
select count(*) from hr.employees;

-- 14.4 hr 사용자의 권한 회수하고 사용자 삭제
conn hr/hr;
revoke select on employees from c##foo;

conn /as sysdba;
drop user c##foo;
drop user c##bar;
