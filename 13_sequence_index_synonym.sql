-- 13. ������, �ε���, ���Ǿ�(sequence, index, synonym)

-- 13.1
create sequence bbs_seq
    increment by 1
    start with 1
    cache 20
    nocycle;
    
-- 13.2
create index idx_emp_realsal
on emps(coalesce(salary+salary*commission_pct, salary));