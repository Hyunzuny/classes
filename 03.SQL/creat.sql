#데이터베이스 생성
create database test;   #control + enter : 실행

#데이터베이스들 조회
show databases ;

#데이터베이스 사용
use test;

#계정생성
create user hyunzuny@localhost identified by 'qweqwe';
create user hyunzuny@'%' identified by 'qweqwe';

#등록된 사용자 계정 조회
select user, host from mysql.user;

#hyunzuny 에 권한 부여 - grant  *.* 모든디비. 모든테이블
grant all privileges on *.* to hyunzuny@localhost;
grant all privileges on *.* to hyunzuny@'%';

#DB선택
use test;

#테이블 생성 , 두가지 조건을 쓸 시 ,가 아니라 스페이스바
create table member (
id varchar(10) primary key,
password varchar(10) not null,
name varchar(50) not null,
email varchar(100) unique, -- 중복된 값을 가질 수 없다.check
age int not null check(age > 0),
creat_at timestamp not null default current_timestamp 
-- 값이 들어가는 시점의 일시를 디폴트 값으로 저장
);

-- 테이블 조회
show tables;

-- 테이블 정보 조회
desc member;

-- 테이블 삭제
drop table member;

show tables;

-- insert
insert into member values('id-1', 
'1111', 
'이순신', 
'sadjkl@asdjlk', 
30, 
'2010-10-05 12:10:20'
);

-- 일부 컬럼에만 값을 넣을 경우 컬럼명 지정.
insert into member (id, password, name, email, age) values('id-100','3333','아아호',
'asdkml@dmkl',20);

insert into member (id, password, name, age) values('id-101','3333','아아호',
'asdkml2@dmkl',20);

insert into member (id, password, name,email, age) values('id-102','3333','아아호',
'asdkml2@dmkl',20);
-- 확인
select * from member;





