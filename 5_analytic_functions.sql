-- 5. analytic functions
-- over 절에서 사용하는 order by(정렬), partition by(묶음), windowing(영역지정) 기능

-- 5.1
select department_id, first_name, salary,
       rank() over (partition by department_id order by salary desc) sal_rank, 
       lag(salary, 1, 0) over (partition by department_id order by salary desc) prev_salary, 
       first_value(salary) over (partition by department_id order by salary desc rows 1 preceding) prev_salary2
from employees
order by department_id; 

-- 5.2
select first_name
from employees
where employee_id=(
    select before_id
    from (
        select employee_id,
               lag(employee_id, 1, 0) over (order by employee_id) as before_id
        from employees
        )
    where employee_id=170
    );

-- 5.3
select employee_id, department_id,
       first_value(salary) over (partition by department_id 
                                 order by salary 
                                 rows between unbounded preceding and unbounded following) lower_sal,
       salary as my_sal,
       last_value(salary) over (partition by department_id 
                                order by salary
                                rows between unbounded preceding and unbounded following) higher_sal,
       last_value(salary) over (partition by department_id 
                                order by salary
                                rows between unbounded preceding and unbounded following) - salary diff_sal
from employees;
