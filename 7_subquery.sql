-- 7. 서브쿼리 (Subquery)

-- 7.1 20번 부서에 근무하는 사원들의 매니저와 매니저가 같은 사원들의 정보 출력
select *
from employees
where manager_id in (select distinct manager_id
                    from employees
                    where department_id=20);
                    
-- 7.2 가장 많은 급여를 받은 사람의 이름
select first_name
from employees
where salary = (select max(salary)
                from employees);
    
-- 7.3 급여 순으로(내림차순) 3위부터 5위까지 출력 (rownum 이용)
select rnum, first_name, salary
from (select rownum as rnum, first_name, salary
      from (select first_name, salary
            from employees
            order by salary desc)
      )
where rnum between 3 and 5;

-- 7.4 부서별 부서의 평균이상 급여를 받는 사원의 부서번호, 이름, 급여, 평균급여 출력
select department_id, first_name, salary, 
       (select round(avg(salary))
        from employees c
        where c.department_id=a.department_id) as avg_sal
from employees a
where salary >= (select avg(salary)
                 from employees b
                 where b.department_id=a.department_id)
order by department_id;