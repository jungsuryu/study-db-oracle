-- 14. ����� �������� (Privilege)

-- SQL Plus ���� ����

-- 14.1 ���ο� ����� ����
conn /as sysdba;
create user c##foo identified by a12345;
create user c##bar identified by a12345;

-- 14.2 c##manager �� ����
conn /as sysdba;
create role c##manager;
grant create table, create view to c##manager;
grant c##manager to c##foo, c##bar;


-- 14.3 c##foo�� ���� hr ������� ���(employees) ���̺��� �� ������ �� ���ϱ�
grant create session to c##foo, c##bar;

conn hr/hr;
grant select on employees to c##foo with grant option;

conn c##foo/a12345;
select count(*) from hr.employees;

grant select on employees to c##bar;

conn c##bar/a12345;
select count(*) from hr.employees;

-- 14.4 hr ������� ���� ȸ���ϰ� ����� ����
conn hr/hr;
revoke select on employees from c##foo;

conn /as sysdba;
drop user c##foo;
drop user c##bar;
