conn SCOTT/TIGER

select * from emp;
select * from dept;
select * from salgrade;

desc emp;

select ename,sal,deptno
from emp;

select sal, sal*12
from emp;

select sal, sal*12 as "연봉"
from emp;

select distinct job
from emp;

select ename, sal, comm, job
from emp;

select ename, job, sal, comm,  sal+comm as "실급여"
from emp;

select ename, job, sal, comm,  sal+comm as "실급여", nvl(comm, -1)
from emp;

select ename, job, sal, comm,  sal+nvl(comm,0) as "실급여"
from emp;

select empno, ename, nvl(mgr, '<CEO>')
from emp;

select empno, ename, nvl(to_char(mgr), '<<CEO>>') as "매니저 코드"
from emp;

select ename, job, ename||'  '||job
from emp;

select 20*20*4
from dual;

--row 제한을 걸때 where 절
select ename, job, deptno
from emp
where job = 'MANAGER';

select ename, job, deptno
from emp
where upper(job) = upper('manager');

select ename, hiredate
from emp
where hiredate >= '82/01/01';

-- <>은 != 의 의미이다.
select ename, hiredate
from emp
where hiredate <> '82/01/23';

--between and = between 은 =이 포함된다. 작은값이 꼭 앞에 오기.
select ename, sal 
from emp
where sal >=2450 AND sal < 3000;

select ename, sal 
from emp
where sal BETWEEN 2450 AND 3000;

--in 연산자
select ename, job, deptno
from emp
where deptno = 10 or deptno = 20;

select ename, job, deptno
from emp
where deptno in (10,20);

select *
from dept
where (deptno,loc) in ((20, 'DALLAS'), (30, 'CHICAGO'));

-- like 연산자

--A로 시작
select *
from emp
where ename like 'A%';

--A로 끝나냐
select *
from emp
where ename like '%A';

--A가 포함
select *
from emp
where ename like '%A%';

--A가 포함되긴 하는데 뒤에서 세번째
select *
from emp
where ename like '%A__';

--81년도에 입사한 사원 목록.
select *
from emp
where hiredate like '%81%';

--where 절에서는 as 사용 x
select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp
where sal + nvl(comm, 0) >= 2000;

--정렬
select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp
order by sal;
--셀값만 준다면 기본적으로는 오름차순 (asc인데 생략가능)

select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp
order by sal desc;
--desc는 내림차순

select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp
order by sal asc, comm desc;
--각각 조건도 가능.

select ename, sal, sal + nvl(comm, 0) as "총급여"
from emp
where comm is null
order by sal;
--is null is not null로도 사용가능.

select ename, sal, sal + nvl(comm, 0) as "총급여"
from emp
where comm is null
order by "총급여";



-- 단일행 함수
select dname, lower(dname), loc, lower(loc)
from dept;

select round(44.55), round(44.55,1), trunc(44.55) 
from dual;
--round 반올림, 몇번째 짜리까지 반올림, 소수점 잘림.

select sal,  sal*0.03 as "TAX"
from emp;

--어디서부터 시작해서 몇개 나오는지
select ename, hiredate, substr(hiredate,4,2)
from emp
where substr(hiredate,4,2) like 12;

select sysdate ,substr(sysdate,4,2) from dual;

select sysdate , to_char(sysdate, 'YY') from dual;
select sysdate , to_char(sysdate, 'YYYY') from dual;
select sysdate , to_char(sysdate, 'MM') from dual;
select sysdate , to_char(sysdate, 'day') from dual;
select sysdate , to_char(sysdate, 'mm') from dual;
select sysdate , to_char(sysdate, 'dd') from dual;

--emp에서 사원들의 사원명, 입사월, 요일 정보를 출력하세요.
select ename, to_char(hiredate,'mm') as "입사월", to_char(hiredate,'day') as "입사 요일"
from emp
order by "입사월";

select sysdate, to_date('2019/12/24') from dual;
select sysdate, to_date('2019-12-24') from dual;
select sysdate, to_date('29 12 24', 'dd-mm-yy') from dual;

-- decode 함수

--decode(어디에서,몇번째,해줄것, 몇번재, 해줄것)
select ename, sal, deptno, decode(deptno, 10, sal*1.2, 20, sal* 0.7) as "보너스"
from emp
order by deptno;
