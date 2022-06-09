-- 2. SELECT문을 이용한 데이터 조회

-- 2.1
select employee_id, first_name, last_name, hire_date, salary
from employees;

-- 2.2
select first_name || ' ' || last_name as name
from employees;

-- 2.3
select *
from employees
where department_id=50;

-- 2.4
select first_name, department_id, job_id
from employees
where department_id=50;

-- 2.5 
select first_name, salary, salary+300
from employees;

-- 2.6
select first_name, salary
from employees
where salary > 10000;

-- 2.7
select first_name, job_id, commission_pct
from employees
where commission_pct is not null;

-- 2.8
select first_name, hire_date, salary
from employees
where hire_date between '03/01/01' and '03/12/31';

-- 2.9
select first_name, hire_date, salary
from employees
where hire_date like '03%';

-- 2.10
select first_name, salary
from employees
order by salary desc;

-- 2.11
select first_name, salary
from employees
where department_id=60
order by salary desc;

-- 2.12
select first_name, job_id
from employees
where job_id='IT_PROG' or job_id='SA_MAN';

select first_name, job_id
from employees
where job_id in('IT_PROG', 'SA_MAN');

-- 2.13
select first_name || ' ' || last_name || ' 사원의 급여는 ' || salary || '달러입니다'
from employees;

-- 2.14 
select first_name, job_id
from employees
where job_id like '%MAN';

-- 2.15
select first_name, job_id
from employees
where job_id like '%MAN'
order by job_id;
