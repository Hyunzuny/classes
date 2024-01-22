use hr_join;
select @autocommit;
-- AUTO COMMIT 
--             => 데이터 변경(insert, delete ,update) 쿼리문 실행시 쿼리결과를 바로 적용.
-- manual commit 
--             => 데이터를 변경하면 자동으로 적용시키지 않고 적용하겠다는 명령어를 실행시키면 그때 적용.
--             ==> commit : 영구적으로 적용.           rollback : 취소

set autocommit = 1 ; -- autocommit으로 설정
set autocommit = 0 ; -- manual commit으로 설정

select @@autocommit;

insert into dept values(500,'기획부','서울');
select * from dept order by dept_id desc;
commit;
rollback;   -- 커밋하면 롤백 못함?

/* *********************************************************************
INSERT 문 - 행 추가
구문
 - 한행추가 :
   - INSERT INTO 테이블명 (컬럼 [, 컬럼]) VALUES (값 [, 값[])
   - 모든 컬럼에 값을 넣을 경우 컬럼 지정구문은 생략 할 수 있다.

 - 조회결과(select)를 INSERT 하기 (subquery 이용)
   - INSERT INTO 테이블명 (컬럼 [, 컬럼])  SELECT 구문
	 - INSERT할 컬럼과 조회한(subquery) 컬럼의 개수와 타입이 맞아야 한다.
	 - 모든 컬럼에 다 넣을 경우 컬럼 설정은 생략할 수 있다.
************************************************************************ */
insert into dept (dept_id, dept_name, loc) values(300, '연구소', '서울');
insert into dept values(300, '연구소', '서울'); -- 컬럼명 지정되있으면 생략 가능.
select * from dept;
insert into emp values(550, '홍길동', 'FI_ACCOUNT',
100,'2020-10-20', 3000, 0.1, 500);
select * from emp where emp_name = '홍길동';
-- insert into emp (emp_id, emp_name) select num name from xxxx;


/* *********************************************************************
UPDATE : 테이블의 컬럼의 값을 수정
UPDATE 테이블명
SET    변경할 컬럼 = 변경할 값  [, 변경할 컬럼 = 변경할 값]
[WHERE 제약조건]

 - UPDATE: 변경할 테이블 지정
 - SET: 변경할 컬럼과 값을 지정
 - WHERE: 변경할 행을 선택. 
************************************************************************ */

-- 직원 ID가 200인 직원의 급여를 5000으로 변경
use hr_join;
select @@autocommit;
set autocommit = 0;

update emp
set salary = 5000;

update emp
set salary = 5000
where emp_id = 200;

select * from emp where dept_id =200;
rollback;
-- 직원 ID가 200인 직원의 급여를 10% 인상한 값으로 변경.
update emp
set salary = salary*1.1
where emp_id = 200;

select * from emp;


-- 부서 ID가 100인 직원의 커미션 비율을 0.2로 salary는 3000을 더한 값으로, 상사_id는 100 변경.

update emp
set comm_pct = 0.2
	,salary = salary + 3000
    ,mgr_id = 100
where dept_id = 100;

select * from emp where dept_id =100;

-- 부서 ID가 100인 직원의 커미션 비율을 null 로 변경.
update emp
set comm_pct = null -- 조회말고 업데이트하거나 바꿀때는 $$$$ = null / $$$$ is null 아님.
where dept_id = 100;

-- TODO: 부서 ID가 100인 직원들의 급여를 100% 인상

update emp
set salary = salary*2
where dept_id = 100;
rollback;

-- TODO: IT 부서의 직원들의 급여를 3배 인상
update emp
set salary = salary * 3
where dept_id = (select dept_id from dept where dept_name='IT');


-- TODO: EMP 테이블의 모든 데이터를 MGR_ID는 NULL로 HIRE_DATE 는 현재일시로 COMM_PCT는 0.5로 수정.
update emp
set mgr_id = null,
hire_date = curdate()
,comm_pct = 0.5;
select * from emp;
/* *********************************************************************
DELETE : 테이블의 행을 삭제
구문 
 - DELETE FROM 테이블명 [WHERE 제약조건]
   - WHERE: 삭제할 행을 선택
************************************************************************ */

-- 전체 행 삭제
delete from emp;

-- truncate emp;  -- 전체 테이블의 모든 데이터 삭제 => 롤백 안됨

-- 부서테이블에서 부서_ID가 200인 부서 삭제
delete from emp
where dept_id = 200;

select * from emp where dept_id = 200;

-- 부서테이블에서 부서_ID가 10인 부서 삭제
delete from emp
where dept_id = 10;

-- TODO: 부서 ID가 없는 직원들을 삭제
delete from emp
where dept_id = null;

-- TODO: 담당 업무(emp.job_id)가 'SA_MAN'이고 급여(emp.salary) 가 12000 미만인 직원들을 삭제.
delete from emp
where job_id = 'SA_MAN' and salary < 12000;

-- TODO: comm_pct 가 null이고 job_id 가 IT_PROG인 직원들을 삭제
delete from emp
where comm_pct = null and job_id = 'IT_PROG';

