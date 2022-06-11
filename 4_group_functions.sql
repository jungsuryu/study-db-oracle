-- 4. group functions
-- 여러 행의 값이 인수로 전달 (count 함수 제외 null값 무시)
-- count(*)는 null 포함, count(expr)은 null 미포함
select round(avg(salary*commission_pct), 2) as avg_bonus
from employees; -- 값 있는 행만 계산

select round(sum(salary*commission_pct), 2) as sum_bonus,
       count(*) count,
       round(avg(salary*commission_pct), 2) as avg_bonus1,
       round(sum(salary*commission_pct)/count(*), 2) as avg_bonus2
from employees;

select avg(nvl(salary*commission_pct, 0))
from employees;

-- 연습문제
-- 4.1 직무별 급여 평균
select job_id, round(avg(salary),2) average
from employees
group by job_id;

-- 4.2 부서별 사원 수
select department_id, count(*)
from employees
group by department_id;

-- 4.3 부서별, 직무별 사원의 수
select department_id, job_id, count(*)
from employees
group by department_id, job_id;

-- 4.4 부서별 급여 표준편차
select department_id, round(stddev(salary),2)
from employees
group by department_id;

-- 4.5 사원의 수가 4명 이상인 부서의 아이디와 사원의 수
select department_id, count(*)
from employees
group by department_id
having count(*)>=4;

-- 4.6 50번 부서의 직무별 사원의 수
select job_id, count(*)
from employees
where department_id=50
group by job_id;

-- 4.7 50번 부서에서 직무별 사원의 수가 10명 이하인 직무아이디와 사원의 수
select job_id, count(*)
from employees
where department_id=50
group by job_id
having count(*)<=10;

-- 4.8 사원목록 중 입사년도 별로 사원들의 급여 평균과 사원수(입사년도 빠른 순)
select to_char(hire_date, 'YYYY') as 입사년도,
       round(avg(salary)) as 급여평균,
       count(*) 사원수
from employees
group by to_char(hire_date, 'YYYY')
order by 입사년도;

-- 4.9 입사년도와 입사월 별 사원들의 급여 평균과 사원수-1
select to_char(hire_date, 'YYYY') as 입사년도,
       to_char(hire_date, 'MM') as 입사월,
       round(avg(salary)) as 급여평균,
       count(*) as 사원수
from employees
group by rollup(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by 입사년도, 입사월;

-- 4.10 입사년도와 입사월 별로 사원들의 급여 평균과 사원수-2
select decode(grouping(to_char(hire_date, 'YYYY')), 1, '합계', to_char(hire_date, 'YYYY')) as 입사년도,
       decode(grouping_id(to_char(hire_date, 'YYYY'),to_char(hire_date, 'MM')), 1, '소계', 3, '합계', to_char(hire_date, 'MM')) as 입사월,
       round(avg(salary)) as 급여평균,
       count(*) as 사원수
from employees
group by cube(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by 입사년도, 입사월;

-- 4.11 입사년도와 입사월 별로 사원들의 급여 평균과 사원수-3
--select decode(grouping_id(to_char(hire_date, 'YYYY'),to_char(hire_date, 'MM')), 2, '합계', 3, '합계', to_char(hire_date, 'YYYY')) as 입사년도,
--       decode(grouping_id(to_char(hire_date, 'YYYY'),to_char(hire_date, 'MM')), 1, '소계', 3, '소계', to_char(hire_date, 'MM')) as 입사월,
--       grouping_id(to_char(hire_date, 'YYYY'),to_char(hire_date, 'MM')) as gid,
--       round(avg(salary)) as 급여평균,
--       count(*) as 사원수
--from employees
--group by cube(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
--order by 입사년도, 입사월;
select nvl(to_char(hire_date, 'YYYY'), decode(grouping(to_char(hire_date, 'YYYY')), 1, '합계')) as 입사년도,
       nvl(to_char(hire_date, 'MM'), decode(grouping(to_char(hire_date, 'MM')), 1, '소계')) as 입사월,
       grouping_id(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM')) as gid,
       round(avg(salary)) as 급여평균,
       count(*) as 사원수
from employees
group by cube(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by 입사년도, 입사월;


select decode(grouping(to_char(hire_date, 'YYYY')), 1, '합계', to_char(hire_date, 'YYYY')) as 입사년도,
       decode(grouping(to_char(hire_date, 'MM')), 1, '소계', to_char(hire_date, 'MM')) as 입사월,
       grouping_id(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM')) as gid,
       round(avg(salary)) as 급여평균,
       count(*) as 사원수
from employees
group by cube(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by 입사년도, 입사월;