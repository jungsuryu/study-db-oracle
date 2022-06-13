-- 9. ∆Æ∑£¿Ëº« (transaction)

-- 9.1
create table emp_temp as select * from employees;

-- 9.2
delete from emp_temp where department_id=20;
savepoint svpnt_del_20;

-- 9.3
delete from emp_temp where department_id=50;
savepoint svpnt_del_50;

-- 9.4
delete from emp_temp where department_id=60;

-- 9.5
rollback to savepoint svpnt_del_50;