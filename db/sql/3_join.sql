select * from dept;

select ename,dname,loc
from emp,dept
where EMP.DEPTNO = dept.deptno;

select ENAME, EMP.DEPTNO, DNAME, LOC
from EMP,DEPT
where EMP.DEPTNO = DEPT.DEPTNO;

select ename, e.deptno,dname,loc
from emp e, dept d
where e.deptno = d.deptno;

--sal > 2000 크면서 deptno가 20인 사원의 이름, sal loc 출력

select ename, sal, loc
from emp e, dept d
where e.DEPTNO = d.DEPTNO and e.SAL > 2000 and e.DEPTNO = 20;

*********************
-- Ansi join 표준(맘대로 하면 복잡하니 표준을 만들자) : , => (inner) join where => on
*********************

--inner join
select ename, sal, loc
from emp e join dept d
on e.deptno = d.deptno
where sal > 2000 and e.deptno = 20;

--outer join
--null 쪽에 + 마킹 : +가 있는 쪽에 있는 모든걸 보여준다 null 이여도.
select ename, d.deptno, dname, loc
from emp e, dept d
where e.deptno(+) = d.deptno;

--Ansi join = outter join
-- right 쪽이 테이블이 기준이  교집합에서 오른쪽이 다 차있는 교집합이라고 생각하면 될듯 .
select ename, d.deptno, dname, loc
from emp e right outer join dept d
on e.deptno = d.deptno;

***********************
-- non equi join
***********************

select * from salgrade;

-- oracle join
select ename,sal,grade
from emp, salgrade
where sal between losal and hisal;

select ename, sal, grade
from emp join salgrade
on sal between losal and hisal;


*****************
-- n개의 테이블 join
*****************
-- 사원명, sal, 부서이름, salgrade

--oracle
select ename, sal, dname, grade
from emp, dept, salgrade
where emp.deptno = dept.deptno and sal between losal and hisal;


-- ansi join
select ename, sal, dname, grade
from emp 
	join dept
	on emp.deptno = dept.deptno
	join salgrade
	on sal between losal and hisal 
where sal > 1500;

******************
-- oracle self join
******************
-- 사원의 이름과 그 사원의 상사 이름 출력
select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno;

select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno(+);

select e.ename, m.ename, e.sal, m.sal
from emp e, emp m
where e.mgr = m.empno(+) and e.sal > m.sal;

--ansi left와 right 는 outer 생략가능. 
select e.ename, m.ename
from emp e join emp m
on e.mgr = m.empno;

--inner는 공통 outer 는 싹다

select e.ename "사원명", e.sal, m.ename "상사이름", m.sal
from emp e 
join emp m
on e.mgr = m.empno
where e.sal >= m.sal;


--집계함수
select ename, round(sal) from emp;

select ename, avg(sal) from emp; --안됨.

select avg(sal) from emp;

select round(avg(sal)) "전체 평균급여" from emp;

select round(avg(sal))|| '원' from emp;

select deptno, round(avg(sal)) from emp group by deptno;--관련이 있는 아이만 가능.

