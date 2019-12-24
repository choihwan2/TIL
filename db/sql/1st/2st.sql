--각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 
--부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하시오.
--1
--select e.employee_id as "사번", e.first_name as "이름", d.department_name as "부서명", m.first_name as "매니저 이름"
--from employees e 
--left join employees m
--on e.manager_id = m.employee_id
--join departments d
--on e.department_id = d.department_id
--order by e.employee_id;
--
----2
----문제2. 자신의 매니저보다 연봉(salary)을 많이 받는 직원들의 성(last_name)과 연봉(salary)을 출력하시오. 
--select e.last_name as "성", m.salary as "연봉"
--from employees e 
--join employees m
--on e.manager_id = m.employee_id
--where e.salary > m.salary;

--3
--문제3. 업무명(job_title)이 ‘Sales Representative’인 직원 중에서 연봉(salary)이 9,000 이상, 
--10,000 이하인 직원들의 이름(first_name), 성(last_name)과 연봉(salary)을 출력하시오.

--select e.first_name, e.last_name, e.salary
--from employees e
--join jobs j
--on e.job_id = j.job_id
--where job_title like 'Sales Representative' and e.salary between 9000 and 10000;

--문제4. Query 문장을 작성하십시오. 
--자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 성(last_name)과 채용일(hire_date)을 
--조회하라.

--select e.employee_id as "사번", e.last_name as "이름" , e.hire_date "사원의 입사일", m.hire_date as "매니저 입사일"
--from employees e
--join employees m
--on e.manager_id = m.employee_id
--where e.hire_date < m.hire_date
--order by e.employee_id;

--문제5. 08년도에 입사한 직원의 이름(first_name), 입사일(hire_date), 관리자사번(employee_id), 관리자 이름(first_name)을 조회합니다.
--단, 관리자가 없는 사원정보도 출력결과에 포함되어야 합니다..  
--select e.first_name, e.hire_date , m.employee_id, m.first_name
--from employees e
--left join employees m
--on e.manager_id = m.employee_id
--where e.hire_date like '08%'
--order by e.employee_id;

--문제6. ‘Sales’부서에 속한 직원의 이름(first_name), 급여(salary), 부서이름(department_name)을 조회하시오. 
--select e.first_name, e.salary, d.department_name
--from employees e
--join departments d
--on e.department_id = d.department_id
--where d.department_name = 'Sales';

--문제7. 월 별 입사자 수를 조회하는 SQL 쿼리문을 작성하세요. 월 순으로 정렬하세요.
--출력: 월 | 입사자수
--select ename, to_char(hiredate,'mm') as "입사월", to_char(hiredate,'day') as "입사 요일"
--from emp
--order by "입사월";

select to_char(e.hire_date, 'mm') as "입사월"
from employees e
group by to_char(e.hire_date,'mm');


