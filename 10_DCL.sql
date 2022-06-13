-- 10. 테이블 생성과 관리 (DCL)

-- 10.1
create table member (
    id varchar2(15) not null,
    name varchar2(20) not null,
    password varchar2(20) not null,
    phone varchar2(15),
    email varchar2(100));

-- 10.2
insert into member values('user123', '사용자', 'a1234567890', '011-234-5678', 'user@user.com');

-- 10.3
select * from member where id='user123';

-- 10.4
update member
set name='홍길동', password='a1234', phone='011-222-3333', email='user@usesr.co.kr'
where id='a1234';

-- 10.5
delete from member
where id='user123' and password='a1234';

-- 10.6
truncate table member;

-- 10.7
drop table member;