-- 11. 제약조건 (constraints)

-- 11.1
create table member(
    userid varchar2(15) constraint member_userid_pk primary key,
    name varchar2(20) not null,
    password varchar2(20) not null,
    phone varchar2(15),
    email varchar2(100)
);

--or
create table member(
    userid varchar2(15) not null,
    name varchar2(20) not null,
    password varchar2(20) not null,
    phone varchar2(15),
    email varchar2(100)
);

alter table member
add constraint member_userid_pk primary key (userid);

-- 11.2
create table dept (
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    constraint pk_dept primary key(deptno)
);

create table emp (
    empno number(4,0),
    ename varchar2(10),
    job varchar2(9),
    mgr number(4,0),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0),
    constraint pk_emp primary key(empno),
    constraint fk_deptno foreign key(deptno) references dept(deptno)
);
