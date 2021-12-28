-- EMPLOYEES 테이블에서 JOB_ID별 평균 SALARY가 10000미만인 JOB_ID 검색
-- JOB_ID는 알파벳 순으로 정렬(오름차순)
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) < 10000
ORDER BY 1;

-- PLAYER 테이블에서 전체 평균 키와 포지션별 평균 키 구하기
-- GROUP BY 쓰지 않기
-- 힌트! CASE문 사용.
SELECT "POSITION" FROM PLAYER
GROUP BY "POSITION";

SELECT
   ROUND(AVG(CASE "POSITION" WHEN 'GK' THEN HEIGHT END), 2) GK,
   CEIL(AVG(CASE "POSITION" WHEN 'DF' THEN HEIGHT END)) DF,
   FLOOR(AVG(CASE "POSITION" WHEN 'FW' THEN HEIGHT END)) FW,
   TRUNC(AVG(CASE "POSITION" WHEN 'MF' THEN HEIGHT END)) MF,
   AVG(HEIGHT) "전체 평균키"
FROM PLAYER;
--------------------------------------------------------------------------
-- SUB QUERY
--   FROM절 : IN LINE VIEW
--   SELECT절 : SCALAR
--   WHERE절 : SUB QUERY

--PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 중 POSITION이 'GK'인 선수
SELECT * FROM PLAYER
WHERE TEAM_ID = 'K01';

SELECT * FROM PLAYER
WHERE "POSITION" = 'GK';

SELECT * FROM
(
   SELECT * FROM PLAYER
   WHERE TEAM_ID = 'K01'
)
WHERE "POSITION" = 'GK';

-- PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 중 POSITION이 'GK'인 선수
-- 위 문제를 서브쿼리 사용 없이 동일한 결과로 출력한다.
SELECT * FROM PLAYER
WHERE TEAM_ID = 'K01' AND "POSITION" = 'GK';

-- SQL 실행 순서
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY

--ROWNUM
--결과 행 앞에 1부터 1씩 증가하는 시퀀스를 붙여준다.
SELECT ROWNUM, FIRST_NAME, LAST_NAME FROM EMPLOYEES;
SELECT ROWNUM, EMPLOYEES.* FROM EMPLOYEES;

--※ WHERE절에서 집계함수는 사용할 수 없으나 서브쿼리를 사용하여 집계함수처럼 사용할 수 있다.
--※ 수정 및 삭제 시 반드시 트랜젝션을 수동으로 설정한 뒤 롤백한다.

--EMP 테이블에서 SAL을 내림차순으로 정렬한 후 ROWNUM을 붙여서 조회한다.
SELECT ROWNUM, EMP.* FROM EMP
ORDER BY SAL DESC;

--AS
--   FROM절에서 사용 시에는 AS를 사용해서는 안되고 공백으로만 구분해야한다.
SELECT ROWNUM, "RESULT".* 
FROM (SELECT * FROM EMP ORDER BY SAL DESC) "RESULT";

--PLAYER 테이블에서 평균 키보다 작은 선수 검색
SELECT AVG(HEIGHT) FROM PLAYER;

SELECT PLAYER.* FROM PLAYER
WHERE HEIGHT < (SELECT AVG(HEIGHT) FROM PLAYER);

SELECT MIN(HEIGHT), MAX(HEIGHT) FROM
(
   SELECT PLAYER.* FROM PLAYER
   WHERE HEIGHT < (SELECT AVG(HEIGHT) FROM PLAYER)
);

--정남일 선수가 소속된 팀의 선수들 조회
SELECT TEAM_ID FROM PLAYER
WHERE PLAYER_NAME = '정남일';

SELECT * FROM PLAYER
WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '정남일');

SELECT COUNT(*) FROM PLAYER
WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '정남일');

SELECT COUNT(*) FROM PLAYER
WHERE TEAM_ID = 'K07';

--PLAYER테이블에서 전체 평균 키와 포지션별 평균 키 구하기(GROUP BY 사용)
SELECT AVG(HEIGHT) FROM PLAYER;

SELECT "POSITION", AVG(HEIGHT) 평균, (SELECT AVG(HEIGHT) FROM PLAYER) "전체 평균"
FROM PLAYER
WHERE "POSITION" IS NOT NULL
GROUP BY "POSITION";

--경기장 중 경기 일정이 20120501 ~ 20120502 사이에 있는 경기장 전체 정보 조회
SELECT * FROM SCHEDULE
WHERE SCHE_DATE BETWEEN '20120501' AND '20120502'

SELECT * FROM STADIUM
WHERE STADIUM_ID IN (SELECT STADIUM_ID FROM SCHEDULE WHERE SCHE_DATE BETWEEN '20120501' AND '20120502');

--PLAYER테이블에서 NICKNAME이 NULL인 선수들을 정태민 선수의 닉네임으로 바꾸기
SELECT NICKNAME FROM PLAYER
WHERE PLAYER_NAME = '정태민';

UPDATE PLAYER
SET NICKNAME = (SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '정태민')
WHERE NICKNAME IS NULL;

SELECT * FROM PLAYER WHERE NICKNAME IS NULL;

--EMPLOYEES 테이블에서 평균 급여보다 낮은 사원들의 급여를 20% 인상
SELECT * FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

SELECT AVG(SALARY) FROM EMPLOYEES;

UPDATE EMPLOYEES 
SET SALARY = SALARY * 1.2
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME = 'Bruce';

--PLAYER 테이블에서 평균 키보다 큰 선수들을 삭제
SELECT COUNT(*) FROM PLAYER
WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

DELETE FROM PLAYER
WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

SELECT COUNT(*) FROM PLAYER;


-------------------------------------------------------------------------
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT EMPNO , ENAME, LOC FROM EMP E JOIN DEPT D
ON E.DEPTNO  = D.DEPTNO ;

-- PLAYER 송종국 선수가 속한 팀의 전화번호 검색하기 

SELECT PLAYER_NAME , TEL FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID AND PLAYER_NAME ='송종국';

-- JOBS 테이블에서 JOB_ID로 직원들의 JOB_TITLE, EMAIL, 성 , 이름검색

SELECT JOB_TITLE  직업 , EMAIL 이메일, FIRST_NAME 성, LAST_NAME 이름 FROM JOBS J JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID ;

-- EMP 테이블의 SAL를 SALGRADE 등급으로 나누기(비등가 조인)
SELECT * FROM EMP; 
SELECT * FROM SALGRADE;

SELECT E.EMPNO , E.ENAME , S.GRADE , E.SAL FROM EMP E JOIN SALGRADE S 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- EMPLOYEES 테이블에서 HIREDATE가 2003~2005년까지인 사원의 정보와 부서명 검색
SELECT LAST_NAME , DEPARTMENT_ID FROM EMPLOYEES 
WHERE HIRE_DATE BETWEEN TO_DATE('2003-01-01') AND TO_DATE('2005-01-01');


-- JOB_TITLE 중 'Manager'라는 문자열이 포함된 직업들의 평균 연봉을 job_title별로 검색


SELECT JOB_TITLE,AVG(E.SALARY) FROM JOBS J JOIN EMPLOYEES E 
ON J.JOB_ID = E.JOB_ID ;


SELECT AVG(E.SALARY) FROM JOBS J JOIN EMPLOYEES E 
ON J.JOB_ID = E.JOB_ID
WHERE JOB_TITLE LIKE '%Manager';
GROUP BY JOB_TITLE;




-- EMP 테이블에서 ENAME에 L이 있는 사원들의 DNAME과 LOC검색
SELECT DNAME,LOC FROM EMP E JOIN DEPT D
ON E.DEPTNO  = D.DEPTNO 
WHERE ENAME LIKE '%L%';


-- 축구 선수들 중에서 각 팀 별로 키가 가장 큰 선수들 검색 
-- 1. JOIN 사용
-- 2. 서브쿼리 사용 (WHERE절)

--SELECT * FROM PLAYER P JOIN TEAM  Y
--ON P.TEAM_ID  = Y.TEAM_ID 
--;
--
--SELECT * FROM PLAYER 
--WHERE HEIGHT = (SELECT MAX(HEIGHT) FROM PLAYER);
--
--
--
--SELECT TEAM_ID FROM TEAM 
--GROUP BY TEAM_ID;


SELECT Y.TEAM_ID,MAX(P.HEIGHT) FROM PLAYER P JOIN TEAM  Y
ON P.TEAM_ID  = Y.TEAM_ID 
GROUP BY Y.TEAM_ID;


--SELECT MAX(HEIGHT) FROM PLAYER
--WHERE TEAM_ID ='K03';
--SELECT * FROM PLAYER
--WHERE TEAM_ID ='K14';








































