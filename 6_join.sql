-- 6. join

-- 6.1 John 사원의 이름과 부서이름, 부서위치(city) 출력
-- (오라클 조인)
select e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id=d.department_id and d.location_id=l.location_id and first_name='John';
-- (안시 조인)
select e.first_name, d.department_name, l.city
from employees e join departments d
on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
where first_name='John';

-- 6.2 103번 사원의 사원번호, 이름, 급여, 매니저이름, 매니저 부서이름 출력
-- (안시 조인)
select e.employee_id, e.first_name, e.salary,
       m.first_name as first_name_1, d.department_name
from employees e join employees m
on e.manager_id = m.employee_id
join departments d
on m.department_id = d.department_id
where e.employee_id=103;


-- 6.3 90번 부서 사원들의 사번, 이름, 급여, 매니저이름, 매니저급여, 매니저부서이름 출력
-- (오라클 조인)
select e.employee_id, e.first_name, e.salary, m.first_name, m.salary, d.department_name
from employees e, employees m, departments d
where e.manager_id=m.employee_id(+) and m.department_id=d.department_id(+) and e.department_id=90;
-- (안시 조인)
select e.employee_id, e.first_name, e.salary, m.first_name, m.salary, d.department_name
from employees e left join employees m
on e.manager_id=m.employee_id
left join departments d
on m.department_id = d.department_id
where e.department_id=90;

-- 6.4 103번 사원이 근무하는 도시
-- (안시 조인)
select e.employee_id, l.city
from employees e 
    join departments d on e.department_id=d.department_id
    join locations l on d.location_id=l.location_id
where e.employee_id=103;

-- 6.5 103번 사원의 부서위치(city)와 매니저의 직무이름(job_title)
-- (안시 조인)
select l.city as "Department Location", j.job_title as "Manager's Job"
from employees e
    join employees m on e.manager_id=m.employee_id
    join departments d on e.department_id=d.department_id
    join locations l on d.location_id=l.location_id
    join jobs j on m.job_id=j.job_id
where e.employee_id=103;

-- 6.6 사원의 모든 정보 조회. 사원 부서번호는 부서이름으로, 직무 아이디는 직무이름으로, 매니저아이디는 매니저 이름으로 출력
select e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date,
       j.job_title, e.salary, e.commission_pct, m.first_name as manager_first_name, 
       m.last_name as manager_last_name, d.department_name
from employees e
    left join departments d on e.department_id=d.department_id
    join jobs j on e.job_id=j.job_id
    left join employees m on e.manager_id=m.employee_id;
