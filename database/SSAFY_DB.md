## DBMS에서의 실행순서

SELECT			-- 5

FROM          	-- 1

WHERE			-- 2

GROUP BY	  -- 3

HAVING 		 -- 4

ORDER BY	  -- 6





## 서브쿼리

서브 쿼리란 다른 쿼리 내부에 포함되어 있는 SELECT 문을 의미한다.



- 중첩 서브 쿼리 - WHERE 문에 작성하는 서브 쿼리
  - 단일 행
  - 복수 행
  - 다중 컬럼
- 인라인 뷰 - FROM 문에 작성하는 서브 쿼리
- 스칼라 서브 쿼리 - SELECT 문에 작성하는 서브 쿼리



:exclamation: 서브쿼리는 반드시 () 로 감싸야한다. 서브쿼리에는 ORDER BY 를 사용할 수 없다.





## 데이터베이스 모델링

데이터 베이스 모델링 순서

- 업무 프로세스 :arrow_right: 개념적 구조  :arrow_right: 데이터 모델 :arrow_right: 물리적 데이터베이스 :arrow_right_hook: 업무 프로세스 

  ​				개념적 모델링	논리적모델링	물리적모델링					일치성 검토

 