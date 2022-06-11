-- 6. join

-- 6.1 John ����� �̸��� �μ��̸�, �μ���ġ(city) ���
-- (����Ŭ ����)
select e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id=d.department_id and d.location_id=l.location_id and first_name='John';
-- (�Ƚ� ����)
select e.first_name, d.department_name, l.city
from employees e join departments d
on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
where first_name='John';

-- 6.2 103�� ����� �����ȣ, �̸�, �޿�, �Ŵ����̸�, �Ŵ��� �μ��̸� ���
-- (�Ƚ� ����)
select e.employee_id, e.first_name, e.salary,
       m.first_name as first_name_1, d.department_name
from employees e join employees m
on e.manager_id = m.employee_id
join departments d
on m.department_id = d.department_id
where e.employee_id=103;


-- 6.3 90�� �μ� ������� ���, �̸�, �޿�, �Ŵ����̸�, �Ŵ����޿�, �Ŵ����μ��̸� ���
-- (����Ŭ ����)
select e.employee_id, e.first_name, e.salary, m.first_name, m.salary, d.department_name
from employees e, employees m, departments d
where e.manager_id=m.employee_id(+) and m.department_id=d.department_id(+) and e.department_id=90;
-- (�Ƚ� ����)
select e.employee_id, e.first_name, e.salary, m.first_name, m.salary, d.department_name
from employees e left join employees m
on e.manager_id=m.employee_id
left join departments d
on m.department_id = d.department_id
where e.department_id=90;

-- 6.4 103�� ����� �ٹ��ϴ� ����
-- (�Ƚ� ����)
select e.employee_id, l.city
from employees e 
    join departments d on e.department_id=d.department_id
    join locations l on d.location_id=l.location_id
where e.employee_id=103;

-- 6.5 103�� ����� �μ���ġ(city)�� �Ŵ����� �����̸�(job_title)
-- (�Ƚ� ����)
select l.city as "Department Location", j.job_title as "Manager's Job"
from employees e
    join employees m on e.manager_id=m.employee_id
    join departments d on e.department_id=d.department_id
    join locations l on d.location_id=l.location_id
    join jobs j on m.job_id=j.job_id
where e.employee_id=103;

-- 6.6 ����� ��� ���� ��ȸ. ��� �μ���ȣ�� �μ��̸�����, ���� ���̵�� �����̸�����, �Ŵ������̵�� �Ŵ��� �̸����� ���
select e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date,
       j.job_title, e.salary, e.commission_pct, m.first_name as manager_first_name, 
       m.last_name as manager_last_name, d.department_name
from employees e
    left join departments d on e.department_id=d.department_id
    join jobs j on e.job_id=j.job_id
    left join employees m on e.manager_id=m.employee_id;
