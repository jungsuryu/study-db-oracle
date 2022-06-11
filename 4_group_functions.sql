-- 4. group functions
-- ���� ���� ���� �μ��� ���� (count �Լ� ���� null�� ����)
-- count(*)�� null ����, count(expr)�� null ������
select round(avg(salary*commission_pct), 2) as avg_bonus
from employees; -- �� �ִ� �ุ ���

select round(sum(salary*commission_pct), 2) as sum_bonus,
       count(*) count,
       round(avg(salary*commission_pct), 2) as avg_bonus1,
       round(sum(salary*commission_pct)/count(*), 2) as avg_bonus2
from employees;

select avg(nvl(salary*commission_pct, 0))
from employees;

-- ��������
-- 4.1 ������ �޿� ���
select job_id, round(avg(salary),2) average
from employees
group by job_id;

-- 4.2 �μ��� ��� ��
select department_id, count(*)
from employees
group by department_id;

-- 4.3 �μ���, ������ ����� ��
select department_id, job_id, count(*)
from employees
group by department_id, job_id;

-- 4.4 �μ��� �޿� ǥ������
select department_id, round(stddev(salary),2)
from employees
group by department_id;

-- 4.5 ����� ���� 4�� �̻��� �μ��� ���̵�� ����� ��
select department_id, count(*)
from employees
group by department_id
having count(*)>=4;

-- 4.6 50�� �μ��� ������ ����� ��
select job_id, count(*)
from employees
where department_id=50
group by job_id;

-- 4.7 50�� �μ����� ������ ����� ���� 10�� ������ �������̵�� ����� ��
select job_id, count(*)
from employees
where department_id=50
group by job_id
having count(*)<=10;

-- 4.8 ������ �� �Ի�⵵ ���� ������� �޿� ��հ� �����(�Ի�⵵ ���� ��)
select to_char(hire_date, 'YYYY') as �Ի�⵵,
       round(avg(salary)) as �޿����,
       count(*) �����
from employees
group by to_char(hire_date, 'YYYY')
order by �Ի�⵵;

-- 4.9 �Ի�⵵�� �Ի�� �� ������� �޿� ��հ� �����-1
select to_char(hire_date, 'YYYY') as �Ի�⵵,
       to_char(hire_date, 'MM') as �Ի��,
       round(avg(salary)) as �޿����,
       count(*) as �����
from employees
group by rollup(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by �Ի�⵵, �Ի��;

-- 4.10 �Ի�⵵�� �Ի�� ���� ������� �޿� ��հ� �����-2
select decode(grouping(to_char(hire_date, 'YYYY')), 1, '�հ�', to_char(hire_date, 'YYYY')) as �Ի�⵵,
       decode(grouping_id(to_char(hire_date, 'YYYY'),to_char(hire_date, 'MM')), 1, '�Ұ�', 3, '�հ�', to_char(hire_date, 'MM')) as �Ի��,
       round(avg(salary)) as �޿����,
       count(*) as �����
from employees
group by cube(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by �Ի�⵵, �Ի��;

-- 4.11 �Ի�⵵�� �Ի�� ���� ������� �޿� ��հ� �����-3
--select decode(grouping_id(to_char(hire_date, 'YYYY'),to_char(hire_date, 'MM')), 2, '�հ�', 3, '�հ�', to_char(hire_date, 'YYYY')) as �Ի�⵵,
--       decode(grouping_id(to_char(hire_date, 'YYYY'),to_char(hire_date, 'MM')), 1, '�Ұ�', 3, '�Ұ�', to_char(hire_date, 'MM')) as �Ի��,
--       grouping_id(to_char(hire_date, 'YYYY'),to_char(hire_date, 'MM')) as gid,
--       round(avg(salary)) as �޿����,
--       count(*) as �����
--from employees
--group by cube(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
--order by �Ի�⵵, �Ի��;
select nvl(to_char(hire_date, 'YYYY'), decode(grouping(to_char(hire_date, 'YYYY')), 1, '�հ�')) as �Ի�⵵,
       nvl(to_char(hire_date, 'MM'), decode(grouping(to_char(hire_date, 'MM')), 1, '�Ұ�')) as �Ի��,
       grouping_id(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM')) as gid,
       round(avg(salary)) as �޿����,
       count(*) as �����
from employees
group by cube(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by �Ի�⵵, �Ի��;


select decode(grouping(to_char(hire_date, 'YYYY')), 1, '�հ�', to_char(hire_date, 'YYYY')) as �Ի�⵵,
       decode(grouping(to_char(hire_date, 'MM')), 1, '�Ұ�', to_char(hire_date, 'MM')) as �Ի��,
       grouping_id(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM')) as gid,
       round(avg(salary)) as �޿����,
       count(*) as �����
from employees
group by cube(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by �Ի�⵵, �Ի��;