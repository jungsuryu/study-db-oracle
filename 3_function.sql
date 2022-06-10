-- 3. 함수

-- 3.1
select *
from employees
where lower(email) like '%lee%';

-- 3.2
select first_name, salary, job_id
from employees
where manager_id=103;

-- 3.3
select *
from employees
where department_id=80 and job_id='SA_MAN'
union
select *
from employees
where department_id=20 and manager_id=100;

select * from employees
where (department_id=80 and job_id='SA_MAN') or (department_id=20 and manager_id=100);

-- 3.4
select replace(phone_number, '.', '-') as 전화번호
from employees;

-- 3.5
select rpad(first_name || ' ' || last_name, 20, '*') as full_name, 
       to_char(salary, '$009,999.00') salary, 
       to_char(hire_date, 'YYYY-MM-DD') hire_date, 
       round(sysdate-hire_date) work_day
from employees
where upper(job_id)='IT_PROG' and salary >= 5000
order by 1;

-- 3.6
select rpad(first_name || ' ' || last_name, 20, '*') full_name,
       to_char(salary+salary*nvl(commission_pct, 0), '$099,999.00') salary,
       to_char(hire_date, 'YYYY"년" MM"월" DD"일"') hire_date,
       trunc(months_between(sysdate, hire_date)) as month
from employees
where department_id=30
order by salary desc;

-- 3.7
select rpad(first_name || ' ' || last_name, 17, '*') as 이름,
       to_char(coalesce(salary+salary*commission_pct, salary), '$09,999.00') as 급여
from employees
where department_id=80 and salary > 10000
order by 급여 desc;

-- 3.8
select first_name as 이름,
       decode(trunc(trunc(months_between(sysdate, hire_date)/12)/5),
            1, '5년차',
            2, '10년차',
            3, '15년차',
            '기타')
        as 근무년수
from employees
where department_id=60;

-- 3.9
select hire_date+1000
from employees
where first_name='Lex';

-- 3.10
select first_name, hire_date
from employees
where to_char(hire_date, 'MM')='05';

-- 3.11
select first_name, salary,
       to_char(hire_date, 'YYYY"년 입사"') as year,
       to_char(hire_date, 'day') as day,
       case when to_char(hire_date, 'YY')>= 10 then to_char(salary*1.10, '$999,999')
            when to_char(hire_date, 'YY')>= 5 then to_char(salary*1.05, '$999,999')
        else to_char(salary, '$999,999')
        end as increasing_salary       
from employees;

-- 3.12
select first_name, salary, 
       to_char(hire_date, 'YYYY"년 입사"') year, 
       case when to_number(to_char(hire_date, 'YY'))=10 then salary*1.10
            when to_number(to_char(hire_date, 'YY'))=5 then salary*1.05
            else salary
        end as "INCREASING_SALARY2"
from employees;

select first_name, salary,
       to_char(hire_date, 'RRRR"년 입사"') year,
       decode(to_char(hire_date, 'YY'), '10', salary*1.10,
                                        '05', salary*1.05,
                                        salary)
                as "INCREAING_SALARY2"
from employees;

-- 3.13
select country_id, nvl(state_province, country_id) state
from locations;

