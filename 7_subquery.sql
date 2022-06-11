-- 7. �������� (Subquery)

-- 7.1 20�� �μ��� �ٹ��ϴ� ������� �Ŵ����� �Ŵ����� ���� ������� ���� ���
select *
from employees
where manager_id in (select distinct manager_id
                    from employees
                    where department_id=20);
                    
-- 7.2 ���� ���� �޿��� ���� ����� �̸�
select first_name
from employees
where salary = (select max(salary)
                from employees);
    
-- 7.3 �޿� ������(��������) 3������ 5������ ��� (rownum �̿�)
select rnum, first_name, salary
from (select rownum as rnum, first_name, salary
      from (select first_name, salary
            from employees
            order by salary desc)
      )
where rnum between 3 and 5;

-- 7.4 �μ��� �μ��� ����̻� �޿��� �޴� ����� �μ���ȣ, �̸�, �޿�, ��ձ޿� ���
select department_id, first_name, salary, 
       (select round(avg(salary))
        from employees c
        where c.department_id=a.department_id) as avg_sal
from employees a
where salary >= (select avg(salary)
                 from employees b
                 where b.department_id=a.department_id)
order by department_id;