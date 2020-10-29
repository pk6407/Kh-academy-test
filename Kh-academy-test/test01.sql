CREATE TABLE test_table(
id number Primary key,
name varchar(32) not null);

SELECT * FROM test_table;

CREATE TABLE account_info(
id NuMBER PRIMARY KEY,
email VARCHAR2(128) CONSTRAINT account_info_nn NOT NULL
);

INSERT INTO account_info(id,email) VALUES (123, 'abc@gmail.com');
INSERT INTO account_info(id,email) VALUES (124, 'abc@gmail.com');
INSERT INTO account_info(id,email) VALUES (125, NULL);

SELECT * FROM account_info;

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'account_info';

DROP TABLE account_info;

CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) UNIQUE
);

INSERT INTO account_info(id, email) VALUES (123, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (124, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (123, 'abcasdf@gmail.com');
INSERT INTO account_info(id, email) VALUES (125, NULL);

SELECT * FROM account_info;

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'ACCOUNT_INFO';

CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) CONSTRAINT account_info_uq UNIQUE
);

CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128)NOT NULL,
    CONSTRAINT account_info_uq UNIQUE (email)
);

CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    CONSTRAINT account_info_uq UNIQUE (email)
); 
CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    CONSTRAINT account_info_uq UNIQUE (email)
);

CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    CONSTRAINT account_info_uq UNIQUE (email));

INSERT INTO account_info(id,email) VALUES (123,'abc@gmail.com');
SELECT * FROM account_info;

INSERT INTO account_authentication(id,password, account_info_id) VALUES (1,'1234',123);
SELECT * FROM account_authentication;

CREATE TABLE account_authentication(
id NUMBER PRIMARY KEY,
password VARCHAR(128) NOT NULL,
account_intfo_id NUMBER REFERENCES account_info(id)
);

DROP TABLE account_authentication;

CREATE TABLE account_authentication(
id NUMBER PRIMARY KEY,
password VARCHAR(128) NOT NULL,
account_intfo_id NUMBER CONSTRAINT account_info_fk REFERENCES account_info(id)
); 

CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    account_info_id NUMBER,
    CONSTRAINT account_info_fk FOREIGN KEY (account_info_id) REFERENCES account_info(id)
);
 
 CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE CASCADE
);
 
  CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE SET NULL
    CONSTRAINT password_length_chk CHECK (length(password) > 3)
); 



CREATE TABLE account_info(
id NUMBER,
email VARCHAR2(128) NOT NULL
);

DROP TABLE account_info;

CREATE TABLE account_info(
id NUMBER,
email VARCHAR2(128) CONSTRAINT account_info_email_nn NOT NULL
);

SELECT * FROM account_info;
INSERT INTO account_info(id,email) VALUES (1,'abc@Gmail.com');
INSERT INTO account_info(id,email) VALUES (2,NULL);
UPDATE account_info SET email = NULL WHERE id = 1;

CREATE TABLE account_info(
id NUMBER,
email VARCHAR2(128)UNIQUE);
SELECT * FROM account_info;
INSERT INTO account_info(id,email) VALUES (1,'abcd@gmail.com');
INSERT INTO account_info(id,email) VALUES (2,'abcdsa@gmail.com');
UPDATE account_info SET email = 'abc@gmail.com' WHERE id = 2;

CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    account_info_id NUMBER,
    CONSTRAINT account_info_fk FOREIGN KEY (account_info_id) REFERENCES account_info(id)
);

SELECT * FROM account_info;
INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
SELECT* FROM account_authentication;
INSERT INTO account_authentication(id, password, account_info_id) VALUES(1, '1234', 1);
INSERT INTO account_authentication(id, password, account_info_id) VALUES(1, '1234', 2);

DROP TABLE account_authentication;
SELECT * FROM account_authentication;

CREATE TABLE account_info(
id NUMBER PRIMARY KEY,
email VARCHAR2(128) NOT NULL UNIQUE
);
INSERT INTO account_info(id, email) VALUES(1, 'abc@gmail.com');
 
CREATE TABLE account_authentication(
id NUMBER PRIMARY KEY,
account_info_id NUMBER REFERENCES account_info(id)
);
INSERT INTO account_authentication(id, account_info_id)VALUES (1,1);
INSERT INTO account_authentication(id, account_info_id)VALUES (1,2);
SELECT * FROM account_authentication;

DROP TABLE account_info CASCADE CONSTRAINTS;
DROP TABLE account_authentication CASCADE CONSTRAINTS;

-- 테이블 account_info 생성
DROP TABLE account_info CASCADE CONSTRAINTS;
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,-- 칼럼에서 제약걸때는 CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)
    created_date TIMESTAMP DEFAULT SYSDATE,--시스템에 잇는 현재 시간 을 삽입
    grade VARCHAR2(128) DEFAULT 'NEW',
    CONSTRAINT account_info_email_uq UNIQUE (email),
    CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)--코드에서 제약걸때
); 

-- 값 넣기
INSERT INTO account_info(id, email) VALUES(1, 'abc@gmail.com');
-- 값 확인
SELECT * FROM account_info;

-- 테이블 account_authentication 생성
DROP TABLE account_authentication CASCADE CONSTRAINTS;
CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE CASCADE
);

-- account_authentication에 값 넣기
INSERT INTO account_authentication(id, account_info_id) VALUES (1, 1);
-- account_authentication 값 확인
SELECT * FROM account_authentication;

-- 부모테이블 account_info 확인
SELECT * FROM account_info;
-- 부모테이블의 값 삭제
DELETE FROM account_info WHERE id = 1;

-- 실제로 영향을 받았는지 확인
SELECT * FROM account_info;
SELECT * FROM account_authentication;
 
CREATE USER test02 IDENTIFIED BY 1234;
GRANT CONNECT,RESOURCE TO test02;
DROP USER test02;

CREATE TABLE account_info(
id NUMBER PRIMARY KEY,
email VARCHAR2(128) CONSTRAINT account_info_email_nn NOT NULL
);

INSERT INTO account_info(id,email) VALUES (1,'asdasd1478@naver.com');
INSERT INTO account_info(id,email) VALUES (2, 'kasdasd@naver.com');

SELECT * FROM account_info;

DROP TABLE account_info CASCADE CONSTRAINTS;

CREATE TABLE account_info(
id NUMBER PRIMARY KEY,
email VARCHAR2(128),
CONSTRAINT account_info_email_uq UNIQUE (email)
);

INSERT INTO account_info(id,email) VALUES (1,'abc@def');
INSERT INTO account_info(id,email) VALUES (2,'abc@def');
INSERT INTO account_info(id,email) VALUES (2, null);
INSERT INTO account_info(id,email) VALUES (3, null);
SELECT * FROM account_info;

DROP TABLE account_authentication;
CREATE TABLE account_authentication(
id NUMBER,
password VARCHAR2(128) CONSTRAINT account_ authentication_pwd_nn NOT NULL,
CONSTRAINT account_authentication_pk PRIMARY KEY (id)
); 
CREATE TABLE account_authentication(
id NUMBER,
password VARCHAR2(128) CONSTRAINT account_authentication_pwd_nn NOT NULL,
account_info_id NUMBER,
CONSTRAINT account_authentication_pk PRIMARY KEY (id),
CONSTRAINT account_info_fk 
FOREIGN KEY (account_info_id) 
REFERENCES account_info(id)
);

SELECT * FROM account_authentication;

--CONSTRAINT 제약조건이름 
--FOREIGN KEY (지정할 칼럼) 
--REFERENCES 참조할_테이블(참조할_테이블의_칼럼)DROP TABLE account_authentication;

CREATE TABLE account_authentication(
    id NUMBER,
    password VARCHAR2(128) CONSTRAINT account_authentication_pwd_nn NOT NULL,
    account_info_id NUMBER,
    CONSTRAINT account_authentication_id_pk PRIMARY KEY(id),
    CONSTRAINT account_info_fk FOREIGN KEY(account_info_id) REFERENCES account_info(id),
    CONSTRAINT account_authentication_pwd_chk CHECK(length(password) > 7)
);

DROP TABLE account_info CASCADE CONSTRAINTS;

CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128),
    created_date TIMESTAMP DEFAULT SYSDATE,
    CONSTRAINT account_info_email_uq UNIQUE (email)
);

INSERT INTO account_info(id, email) VALUES(1, 'abc@def');
SELECT * FROM account_info;

CREATE TABLE MEMBERS(
    MEMBER_ID VARCHAR2(20) PRIMARY KEY,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(30),
    MEMBER_AGE NUMBER,
    MEMBER_EMAIL VARCHAR2(50),
    UNIQUE (MEMBER_NAME, MEMBER_EMAIL)
);

SELECT * FROM members;
INSERT INTO MEMBERS(member_id, member_pwd, member_name, member_age, member_email)
VALUES (3, '1234', 'chwon12', 1, 'a@b.com');
--# 원인

--1. 구문 지정 오류 USER 뒤에 계정명이 와야함
--2. 권한을 부여하려면 GRANT를 사용해야함
--3. UNIQUE 복합키 설정을 테이블레벨에서 해주어야함.
--4. `ON DELETE CASCADE NULL` -> `ON DELETE SET NULL`
--5. VARCHAR2(20) -> DATE로 바꾸어야함.

SELECT * 
FROM emp 
WHERE ename = 'WARD';
--- SQL 문장은 대소문자를 구별하지 않는다
--- SQL 문장은 한 줄 또는 여러 줄에 입력될 수 있다
--- 일반적으로 키워드는 대문자로 입력한다
--- 다른 모든 단어, 즉 테이블 이름, 열 이름은 소문자로 입력을 권장
--- 가장 최근의 명령어 한 개가 SQL buffer 에 저장 된다
--- SQL문 마지막 절의 끝에 ";" 를 기술하여 명령의 끝을 표시한다.

SELECT length(ename) AS 이름길이 FROM emp; 

SELECT * FROM tab;

SHOW user;
--지금 현재 어떤것으로 접속되잇는지 알수잇음

DESC emp;
--테이블의 각 제약조건을 보여줌

SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT deptno, job FROM emp;
--중복된 값을 제거해줌

SELECT ename, sal AS 월급, sal * 12 AS 연봉 FROM emp;
--AS하고 별칭 지정(참조변수이름?)
SELECT * FROM emp WHERE sal = 1600;

SELECT * FROM emp WHERE sal >= 1000;
--sal 값이 1000이상이면 출력하게 하는 조건식

SELECT * FROM emp WHERE comm > 500;
--comm값이 500이상인것들만 출력하게 하는 조건식
DESC emp;
 
SELECT * FROM emp WHERE deptno <> 30;
SELECT * FROM emp WHERE deptno != 30;
SELECT * FROM emp WHERE deptno ^= 30;
SELECT * FROM emp WHERE NOT deptno = 30;
--deptno값이 30이 아닌것들만 출력하게 하는 조건식들

SELECT * FROM emp WHERE job = 'SALESMAN' AND comm >= 300;
--job이 SALESMAN이고 comm이 300이상인것만 출력하게 하는 조건식

SELECT * FROM emp WHERE deptno IN (20, 30);
--emp의 deptno의 값이20이나,30인것들 출력하게 하는 조건식
SELECT * FORM emp WHERE job IN('SALESMAN','MANAGER');
--SALESMAN나MANAGER인것들만 출력하게 하는 조건식
SELECT * FROM emp WHERE empno BETWEEN 7698 AND 7902;
--empno창에서 7698사이에 7902값인 것들 출력
SELECT * FROM emp WHERE empno >= 7698 AND empno <=7902;
--위의 조건과 같음

SELECT * FROM emp WHERE ename LIKE 'AL%';
--ename의 AL로 시작하는사람 출력하는 조건식
SELECT * FROM emp WHERE ename NOT LIKE '%A%';
--ename의 첫번째 글자에 A가 없는 사람들만 출력하게 하는 조건식

SELECT * FROM emp WHERE NOT comm IS NULL;
--comm이 잇는 사람들이 출력하는 조건식

SELECT * FROM emp WHERE NOT comm IS NULL ORDER BY empno;
--comm이 잇는 사람들이 출력하고 그걸 오름차순하는 조건식
SELECT * FROM emp WHERE NOT comm IS NULL ORDER BY empno DESC;
--comm이 있는 사람들이 출력되고 그걸 내림차순 하는 조건식

SELECT ename, sal FROM emp ORDER BY sal, ename;
--sal순으로 먼저 정렬후 ename으로 정렬 오름차순
SELECT ename, sal FROM emp ORDER BY sal DESC, ename ASC; 
--sal를 내림차순으로 정렬후,ename를 오름차순으로 정렬
SELECT ename, sal AS 월급 FROM emp ORDER BY 월급 DESC;
--sal를 월급이라고 별칭하고,월급을 내림차순으로 정렬

SELECT ename || '''s JOB is ' || job AS EMPLOYEE FROM emp;
--String employee = ename + 's JOB is';


SELECT 20 * 30 FROM dual;
--가상 테이블 만들는 조건식
SELECT mod(5, 4) FROM dual;

SELECT -10, ABS(10) FROM dual;

SELECT 3.141592, round(3.541592) FROM dual;

SELECT mod(12, 5) FROM dual;
--12를 5로 나울때 나오는값
SELECT CEIL(12.3456) FROM dual;
--12.3456의 가장 근접한 큰 정수값을 출력하는 조건식
SELECT FLOOR(12.3456) FROM dual;
--12.3456의 가장 근접한 작은 정수값 출력하는 조건식
SELECT POWER(3,4) FROM dual;
--POWER(정수A, 정수B) 정수A를 정수B만큼 제곱하는 함수이다
SELECT INITCAP('kim mal ddong') FROM dual;
--단어의 앞 글자만 대문자로 변환해주는 함수로 INITCAP(값 또는 컬럼명)을 넣으면 값 또는 해당 컬럼에 기록된 문자열 값의 첫 글자를 대문자로 변환하여 반환한다.
SELECT LOWER('ORACLE') FROM dual;
--소문자로 변환하는 함수로 LOWER(값 또는 컬럼명)을 넣으면 값 또는 해당 컬럼에 기록된 문자열값이 모두 소문자로 반환된다.
SELECT LENGTH(‘test11'), LENGTHB('test11') FROM dual;
SELECT LENGTH(‘한글'), LENGTHB('한글') FROM dual;

SELECT INSTR('ORACLE WELCOME','C')FROM dual;

SELECT SUBSTR('오라클 데이터베이스', 3) FROM dual;
--위 예제는 대상문자열에서, 시작위치부터 세 번째 인자인 선택바이트수(생략시 나머지 문자열 모두를 선택)만큼 반환한다.

SELECT LPAD('ORACLE', 10, '+') FROM dual;
--10칸을 기준으로하고 빈칸만큼 ‘+’로 채우기,왼쪽 기준
SELECT RPAD('ORACLE', 10, '+') FROM dual;
--10칸을 기준으로하고 빈칸만큼 ‘+’로 채우기,오른쪽 기준

SELECT 
'ORACLE',
ltrim(' ORACLE'),
rtrim('ORACLE ')
FROM dual;
--ltrim은 왼쪽 공백 제거,rtrim은 오른쪽 공백 제거
SELECT TRIM('a' FROM 'aaaOracleaaa') FROM dual;
--양끝의 특정 문자를 제거하는 함수로, 특정 문자를 지정하지 않으면 양쪽 공백 제거한다. 양쪽 끝의 ‘a’문자 제거하여 조회

SELECT SYSDATE FROM dual;
--시스템의 현재 날짜 시간 값출력
SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss') FROM dual;
--시스템의 현재 날짜 시 분 초 값 출력
SELECT to_char(SYSDATE + 1, 'yyyy/mm/dd hh24:mi:ss') FROM dual;
SELECT months_between(SYSDATE, SYSDATE +1) FROM dual;
--두개월 사이에 차이를 출력
SELECT ADD_MONTHS('17/1/18', '2') FROM dual;
--날짜 17/1/18에 2개월를 더한 값 출력
SELECT next_day(sysdate, '금') FROM dual;
--시스템의 날짜중 가장 가까운 요일 금요일인 날짜를 출력
SELECT last_day(sysdate) FROM dual;
--시스템의 날짜중 마지막 날짜를 출력
 
SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss') FROM dual;

SELECT ename, nvl(comm, 0) comm FROM emp;
--nvl((값, 컬럼), 출력할 값)
SELECT ename, nvl2(comm, sal + comm, sal)as pay, sal, comm FROM emp;

SELECT NULLIF(10, 10) FROM dual;
SELECT NULLIF('A', 'B') FROM dual;

SELECT DECODE(100, 100, 'EQUAL', 'UNEQUAL') FROM dual;
SELECT DECODE(100, 150, 'EQUAL', 'UNEQUAL') FROM dual;

SELECT empno, ename, deptno,
DECODE(deptno, 10, '회계팀', 20, '개발팀', 30, '영업팀', 40, '운영팀') deptname 
FROM emp;

SELECT * FROM emp e JOIN dept d ON e.deptno = d.deptno;

SELECT 
    ename,
    CASE
        WHEN deptno = 10 THEN '회계팀'
        WHEN deptno = 20 THEN '개발팀'
        WHEN deptno = 30 THEN '영업팀'
        WHEN deptno = 40 THEN '운영팀'
        ELSE '팀없음'
        END
        FROM emp;
--CASE
 --   WHEN 조건 THEN 출력할값
  --  WHEN 조건 THEN 출력할값
   -- WHEN 조건 THEN 출력할값
   -- ELSE 기본으로출력할값
--END

SELECT count(*), count(comm), count(empno) FROM emp;
-- COUNT(*) : emp 테이블의 전체 행은 12개
-- COUNT(empno) : NULL값이 없는 empno컬럼의 수는 12개
-- COUNT(comm) : NULL이 아닌 값이 4개인 comm 컬럼

SELECT sum(sal) FROM emp;
--행들의 합을 출력,sal의 모든 합을 출력

SELECT avg(sal) FROM emp;
--행들의 합의 평균을 출력

SELECT max(sal) FROM emp;
--행들중 가장 높은 값 출력
SELECT min(sal) FROM emp;
--행들중 가장 낮은 값 출력

SELECT job, round(avg(sal), 2) AS avgsal FROM emp GROUP BY job ORDER BY avgsal DESC;
--그룹함수 데이터의 선별
SELECT job, count(job) as 인원 
FROM emp e JOIN dept d ON e.deptno = d.deptno 
GROUP BY job 
ORDER BY 인원 DESC;

SELECT d.loc, count(*) as 직원수
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.loc
ORDER BY 직원수 DESC;

SELECT e.deptno, dname, COUNT(e.empno)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY e.deptno, dname HAVING COUNT(e.empno) > 5;

SELECT * FROM emp;

INSERT INTO 
emp(empno, ename, job, mgr, hiredate, sal, deptno)
VALUES (8000, 'SMITH', 'SALESMAN', 7839, sysdate, 10000, 10);

SELECT * FROM emp;

CREATE TABLE emp_research
AS (SELECT * FROM emp WHERE 1=0);

INSERT INTO emp_research(SELECT * FROM emp WHERE deptno=20);
SELECT * FRom emp_research;

CREATE TABLE emp_hire AS SELECT empno, ename, hiredate FROM emp WHERE 1=0;
CREATE TABLE emp_sal AS SELECT empno, ename, sal FROM emp WHERE 1=0;
SELECT * FROM emp_hire ;
SELECT * FROM emp_sal ;

INSERT ALL
    WHEN HIREDATE > '2010/01/01'
    THEN INTO emp_hire VALUES(empno, ename, hiredate)
    WHEN sal>=2000
    THEN INTO emo_sal VALUES (empno, ename, sal)
    SELECT empno, ename, hiredate, sal FROM emp;
--    WHEN 절에 지정한 조건을 만족하는 데이터를 테이블을 지정해 삽입

SELECT * FRom emp;

UPDATE emp
SET sal = 1200
WHERE empno = 7369;
--테이블의 행을 수정할 때 사용하는 SQL
UPDATE emp
SET sal = sal * 1.1
 WHERE deptno IN (SELECT deptno FROM dept WHERE dname IN ('SALES','ACCOUNTING'));
 SELECT * FRom emp;
 
--DELETE FROM 테이블 WHERE 조건
SELECT * FRom emp;

DELETE FROM emp WHERE sal < 3000;

ROLLBACK;
--테이블의 행을 수정할 때 사용하는 SQL,WHERE절을 사용하지 않으면 모든 행이 삭제되므로 각별히 주의해야 한다

--MERGE INTO 테이블 별칭 USING (쿼리)별칭 ON (조건) WHEN MATCHED THEN (쿼리) WHEN NOT MACHED THEN(쿼리)
CREATE TABLE emp_merge_ex
AS SELECT empno, ename, sal, deptno FROM emp WHERE deptno IN (10, 20);
SELECT * FROM emp_merge_ex;

MERGE INTO emp_merge_ex m
USING (
    SELECT empno, ename, deptno, sal FROM emp WHERE deptno IN (20, 30)
) e
ON (m.empno = e.empno)
WHEN MATCHED THEN
    UPDATE SET m.sal = round(m.sal * 1.1)
WHEN NOT MATCHED THEN 
    INSERT (m.empno, m.ename, m.sal, m.deptno) 
    VALUES (e.empno, e.ename, e.sal, e.deptno)
    WHERE e.sal > 1000;
--조건에 따라서 삽입, 갱신, 삭제 후 갱신 작업을 한번에 할 수 있는 구문 해당 행이 존재 하는 경우 UPDATE(DELETE 포함 가능)을 수행하고, 없는 행일 경우 INSERT를 수행 삽입/갱신에 대한 선택의 조건은 ON절로 표현한다


CREATE TABLE bank_account(
id NUMBER PRIMARY KEY,
name VARCHAR2(32) NOT NULL,
money NUMBER DEFAULT 0
);

SELECT * FROM bank_account;
INSERT INTO bank_account(id, name, money) VALUES (1, 'A', 1000);
INSERT INTO bank_account(id, name, money) VALUES (2, 'B', 0);
COMMIT;
--A의 계좌를 0으로 업데이트
--B의 계좌를 100으로 업데이트
UPDATE bank_account SET money = 0 WHERE name = 'A';
SELECT * FROM bank_account;
ROLLBACK;

--transaction 시작
UPDATE bank_account SET money = 0 WHERE name = 'A';
UPDATE bank_account SET money = 1000 WHERE name = 'B';
COMMIT;
--transaction 끝
SELECT * FROM bank_account;

SELECT * FROM emp;
SELECT empno, ename, job, sal,
RANK() OVER(ORDER BY sal DESC) 급여순위
FROM emp; 
--급여 많은순으로 순위를 매김
SELECT RANK(50) WITHIN GROUP (ORDER BY sal DESC) AS 순위
FROM emp;

SELECT * FROM (
SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) 순위 FROM emp
)WHERE 순위 <= 5;
--상위 5위만 출력되게 하는 조건식
SELECT ename, deptno, sal,
RANK() OVER (ORDER BY sal DESC) "순위1",
DENSE_RANK() OVER (ORDER BY sal DESC) "순위2",
DENSE_RANK() OVER (PARTITION BY deptno
ORDER BY sal DESC) "순위3" -- 그룹 안에서의 순위
FROM emp
ORDER BY deptno DESC; 
--sal값이 가장 많은순위 속에 deptno값이 가장 큰 순위매김

SELECT *
FROM (SELECT ename, sal,
RANK() OVER (ORDER BY sal DESC) 순위
FROM emp)
WHERE 순위 = 10;
--emp테이블안에 sal의 가장적은 10위 를 출력

SELECT ename, sal,
ROUND(CUME_DIST() OVER (ORDER BY sal), 1) 누적분산
FROM emp
WHERE empno= '50';

SELECT ename, sal, NTILE(5) OVER (ORDER BY sal DESC)등급
FROM emp;

SELECT empno, ename, sal, hiredate,
    ROW_NUMBER() OVER (ORDER BY sal DESC, hiredate ASC) 순번
FROM emp;
--sal값 높은 순서대로 순번을 정렬후 넣음

SELECT deptno
, SUM(sal) s_sal
FROM emp
GROUP BY deptno ORDER BY s_sal DESC;
--어느 부서가 가장많이 받는지 보는 조건식

SELECT empno, sal,
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) "win1",
-- rows : 부분그룹인 윈도우의 크기를 물리적인 단위로 행집합을 지정
-- unbounded preceding : 윈도우의 첫행
-- unbounded following : 윈도우의 마지막행
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "win2",
-- 윈도우의 시작행에서 현재 위치(current row) 까지의 합계를 구해서 win2에
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) "win3"
-- 현재 위치에서 윈도우의 마지막행까지의 합계를 구해서 win3에
FROM emp
WHERE deptno = 30;

SELECT ename, sal,
LPAD(TRUNC(RATIO_TO_REPORT(sal) OVER() * 100, 0), 5) || ' %' 비율,
TO_CHAR(TRUNC(RATIO_TO_REPORT(sal) OVER() * 20000000, 0), 'L00,999,999') "추가로 받게될 급여"
FROM emp;
--sal를 200000를 더준다햇을때 기존에 받는 sal보다 몇퍼를 인상받나를 나오는 조건식

SELECT ename, deptno, sal,
LAG(sal, 1, 0) OVER (ORDER BY sal) 이전값,
-- 1 : 위의 행값, 0 : 이전행이 없으면 0 처리함
LAG(sal, 1, sal) OVER (ORDER BY sal) "조회2",
-- 이전행이 없으면 현재 행의 값을 출력
LAG(sal, 1, sal) OVER (PARTITION BY deptno
ORDER BY sal) "조회3"
-- 부서 그룹안에서의 이전 행값 출력
FROM emp;
--지정하는 컬럼의 현재 행을 기준으로 이전 행(위)의 값을 조회함

SELECT ename, deptno, sal, LEAD(sal,1,0) OVER (ORDER BY sal DESC)다음값 FROM emp;
--다음 행의 값 조회

SELECT DEPTNO, ENAME, SAL
, FIRST_VALUE(ENAME) OVER (PARTITION BY DEPTNO ORDER BY SAL DESC
ROWS UNBOUNDED PRECEDING) as DEPT_RICH
FROM EMP;
--파티션별 윈도우에서 가장 먼저 나온 값을 구한다.

SELECT DEPTNO, ENAME, SAL
, LAST_VALUE(ENAME) OVER ( PARTITION BY DEPTNO ORDER BY SAL DESC
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) as DEPT_POOR
FROM EMP;
--파티션별 윈도우에서 가장 나중에 나온 값을 구한다

SELECT * FROM emp;
SELECT * FROM dept;

SELECT e.*, d.dname,d.loc 
FROM emp e 
JOIN dept d ON e.deptno = d.deptno;
--조인 대상 테이블에서 공통적으로 컬럼의 값이 일치되는 행을 연결하여 결과를 생성, 가장 일반적으로 사용하는 ‘=’에 의한 조인
SELECT * FROM emp, dept;

SELECT * FROM emp;
SELECT e.ename, e.sal, s.grade
FROM emp e
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal;
--emp테이블의 연봉을 이용해 salgrade의 연봉등급을 조인하여 조회

SELECT e.ename m.ename Manager 
FROM emp e 
    JOIN emp m ON e.empno = m.mgr;

SELECT e.ename, e.empno, m.mgr, m.ename
FROM emp e, emp m;
--하나의 테이블에서 자신의 테이블과 Equi Join이 발생하는 것이다
--하나의 테이블에 대해서 두 개의 alias를 사용해 두 개의 테이블인 것처럼 조인한다
--emp테이블에서 사원과 해당 사원의 매니저 조회

SELECT e.ename, d.dname
FROM emp e
INNER JOIN dept d
ON e.deptno = d.deptno;
--일반적인 JOIN에서 ,(콤마)를 생략하고 INNER JOIN 절을 사용
--WHERE절 대신에 ON절을 사용한다
--INNER 키워드는 생략 가능
--emp 테이블과 dept 테이블을 조인하여 직원들의 부서명을 조회하는 예제

SELECT e.ename, e.deptno, d.dname
FROM emp e RIGHT OUTER JOIN dept d
ON e.deptno = d.deptno
ORDER BY e.deptno;
--emp테이블에 없는 deptno인 40에 대해서도 조인이 이루어진 것을 볼 수 있다
--(+)연산자를 왼쪽에 두는 조건은 ANSI 방식의 RIGHT OUTER JOIN으로 표현 가능
SELECT employee.ename employee, manager.ename manager
FROM emp employee LEFT OUTER JOIN emp manager
ON employee.mgr = manager.empno;
--emp테이블을 SELF JOIN하여 mgr의 이름을 조회
--mgr이 존재하지 않은 KING도 출력된 것을 볼 수 있다
--(+)연산자를 오른쪽에 두는 조건은 LEFT OUTER JOIN으로 표현 가능
SELECT e.ename, m.ename FROM emp e JOIN emp m ON e.empno = m.mgr;
--null값 제외하고 표현 위 제시를

SELECT * 
FROM emp e 
RIGHT JOIN dept d ON e.deptno = d.deptno;
--emp 테이블과 dept 테이블을 조인하여 직원들의 부서명을 조회하는 예제

SELECT e.empno, e.ename, d.dname
FROM emp e INNER JOIN dept d
USING (deptno);
--USING절 이용하기(테이블별칭이 없어야됨)
SELECT empno, ename, dname
FROM emp NATURAL JOIN dept;
--NATURAL JOIN(EQUI JOIN과 비슷하지만 WHERE 조건절 없이 조인한다)

SELECT * FROM dept;
SELECT * FROM emp
WHERE deptno = (
SELECT deptno FROM dept WHERE dname = 'ACCOUNTING'
);
--하나의 SQL 문장 내에 포함된 또 다른 SQL 문이 있는 쿼리문
--전체 SQL 문장을 메인 쿼리라고 하며 메인 쿼리(Main Query or Outer Query)에 종속된 내부 쿼리를 서브 쿼리(Sub Query or Inner Query)라고 한다

SELECT *FROM emp WHERE sal >= (SELECT avg(sal) FROM emp);
--평균보다 높게 sal를 받는 사람들 출력하는 조건문
SELECT avg(sal) FROM emp;
--sal평균 구하는 조건문
SELECT * FROM emp WHERE deptno IN(SELECT deptno FROM dept WHERE loc IN ('NEW YORK', 'DALLAS'));
--뉴욕하고 델러스 에서 사는사람들 출력하는 조건문
SELECT deptno FROM dept WHERE loc IN ('NEW YORK', 'DALLAS');

SELECT e.ename, d.dname,e.sal,d.deptno
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE sal IN (SELECT MAX(sal) FROM emp
GROUP BY deptno);
--부서별 급여를 제일 많이 받는 사원 조회
--1. 그룹별로 가장 높은 연봉출력
--2. EMP ,DEPT 조인 (등가조인)
--3. WHERE 저건절에 IN (2850 ,3000,5000)

SELECT empno, ename,job, sal
FROM emp
WHERE sal > ANY (SELECT sal FROM emp WHERE JOB = 'SALESMAN');
--‘SALESMAN’ 들의 급여를 조회하여 ANY 연산자로 메인 쿼리와 비교하여 출력되도록 해 보자.
--‘SALESMAN’ 들의 급여 중 최소값보다 많은 급여를 받는 사원들이 출력된다

SELECT empno, ename, sal
FROM emp
WHERE sal = ANY (SELECT sal
FROM emp
WHERE JOB = 'SALESMAN');
--SALESMAN’들의 급여와 같은 급여를 받는 사원을 조회해 보자

SELECT * FROM emp WHERE sal > ALL (SELECT sal FROM emp WHERE JOB = 'MANAGER');
--MANAGER’ 사원들의 급여들 보다 높은 급여를 받는 사원을 조회해 보자
--‘MANAGER’ 사원들 중 최고 급여인 2975 보다 많은 급여를 받는 사원들이 조회된다

SELECT mgr FROM emp WHERE not mgr is null GROUP BY mgr;
SELECT empno, ename, sal
FROM emp e
WHERE EXISTS (SELECT empno FROM emp WHERE e.empno = mgr);
--관리자로 등록되어 있는 사원들을 조회해 보자.

SELECT empno, ename, sal, deptno
FROM emp
WHERE (deptno, sal) IN (SELECT deptno, sal FROM emp WHERE deptno = 30);
--서브 쿼리의 결과가 두 개 이상의 컬럼으로 반환되어 메인 쿼리에 전달하는 쿼리이다.
--부서 번호가 30인 사원들의 급여와 부서번호를 묶어 메인 쿼리로 전달해 보자.

SELECT ENAME, DEPTNO, SAL,
-- 소속 부서의 급여 평균값 1개
(SELECT TRUNC(AVG(SAL)) FROM EMP WHERE DEPTNO = E.DEPTNO) AS AVGDEPTSAL
FROM EMP E;
--위 예제에서 EMP 테이블의 매 행마다 부서번호가 각 행의 부서번호와 동일한 사원들의 SAL 평균을 구해서 리턴 하고 있다.
SELECT EMPNO, ENAME,
CASE WHEN DEPTNO = (SELECT DEPTNO
FROM DEPT
WHERE LOC = 'NEW YORK')
THEN '본사'
ELSE '분점'
END AS 소속
FROM EMP E
ORDER BY 소속 DESC;
--위 예제에서 EMP 테이블을 순회하면서 사원의 부서번호가 LOC가 NEW YORK인 부서의 부서번호와 비교한 뒤 같으면, ‘본사’를 그 외에는 ‘분점’을 출력하고 있다

SELECT ENAME, JOB,
(SELECT DNAME
FROM DEPT
WHERE DEPTNO = E.DEPTNO) DNAME
FROM EMP E;
--SELECT 컬럼에 상관쿼리를 사용해서 사원의 부서이름을 구해 보자.
--위 예제는 EMP 테이블에 없는 컬럼인 부서이름을 조회하고 있다. 다만, 메인 쿼리에서 조인하지 않고,
--한 행이 출력될 때, 해당 사원의 부서번호를 조인 조건으로 DEPT 테이블을 상관쿼리로 호출한다.

SELECT b.empno, b.ename, b.job, b.sal, b.deptno
FROM (
SELECT empno FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = 20)
) a, emp b
WHERE a.empno = b.empno AND b.mgr is NOT NULL AND b.deptno != 20;
--1.가장 안쪽에 있는 서브 쿼리:SELECT AVG(sal) FROM emp WHERE deptno = 20;
--2.SELECT empno, ename FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = 20);
--급여가 부서번호 20인 부서의 평균보다 높고 사원을 관리하는 ‘MANAGER’ 로써 20 부서에 속하지 않은 사원을 조회해 보자.

SELECT EMPNO, ENAME, DEPTNO, HIREDATE
FROM EMP E
ORDER BY (SELECT DNAME FROM DEPT WHERE DEPTNO = E.DEPTNO) DESC;
--1.SELECT EMPNO, ENAME, DEPTNO, HIREDATE FROM EMP E;
--2.SELECT DNAME FROM DEPT;
--다른 조건식 같은 값:SELECT * FROM emp e JOIN dept d ON e.deptno = d.deptno ORDER BY d.dname DESC;
--현재 조회한 컬럼이 아닌 다른 컬럼값으로 정렬하고자 한다면, ORDER BY 에 서브커리를 사용하면 된다.

SELECT empno, ename, JOB FROM emp WHERE JOB = 'SALESMAN'
UNION
SELECT empno, ename, JOB FROM emp WHERE JOB = 'MANAGER';
--SELECT empno, ename, JOB FROM emp WHERE JOB = 'MANAGER';
--SELECT empno, ename, JOB FROM emp WHERE JOB = 'SALESMAN'
--동일한 결과 출력:SELECT empno,ename, job FROM emp WHERE job IN ('SALESMAN', 'MANAGER');
--영업사원과 관리자를 따로 질의하여 UNION으로 결합해 보자.

SELECT empno, ename, sal FROM emp WHERE sal < 1000
UNION ALL
SELECT empno, ename, sal FROM emp WHERE sal < 2000
ORDER BY empno;
--급여가 1000 미만인 직원, 2000 미만인 직원을 조회하여 UNION ALL 로 결합해 보자.
--SELECT empno, ename, sal FROM emp WHERE sal <2000;

SELECT empno, ename, sal FROM emp WHERE sal > 1000
INTERSECT
SELECT empno, ename, sal FROM emp WHERE sal < 2000;
--급여가 1000 초과인 직원을 조회하고 2000 미만인 직원을 각각 조회하여 INTERSECT로 결합해 보자.
--급여가 1000 초과 2000 미만인 직원들만 조회한다.
--SELECT empno, ename, sal FROM emp WHERE sal > 1000 AND sal < 2000;

SELECT empno, ename, sal FROM emp
MINUS
SELECT empno, ename, sal FROM emp WHERE sal > 2000;
--사원 전체 결과에서 MINUS 연산자를 이용해 급여가 2000 초과인 사원 제외하여 조회해 보자.
--SELECT empno, ename, sal FROM emp WHERE sal <= 2000;

DROP TABLE test_table;

CREATE TABLE test_table(
id NUMBER PrIMARY KEY,
name VARCHAR2(128) NOT NULL
);

SELECT table_name FROM USER_TABLES WHERE table_name = 'TEST';

CREATE TABLE test_table(
id number,
name VARCHAR2(128) CONSTRAINT test_table_nn NOT NULL, --칼럼 레벨
--테이블 레벨
CONSTRAINT test_table_pk PRIMARY KEY (id)
);
DESC test_table;

--ALTER TABLE 테이블 이름 ADD CONSTRAINT 제약조건이름 제약조건종류(칼럼이름);
ALTER TABLE test_table ADD CONSTRAINT test_table_name_uq UNIQUE(name);
--ALTER TABLE 테이블이름 MODIFY (칼럼 NOT NULL);

CREATE TABLE user_info (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(128) NOT NULL,
    email VARCHAR2(128) UNIQUE
);

CREATE TABLE bank_account (
    id NUMBER PRIMARY KEY,
    user_info_id NUMBER CONSTRAINT user_info_fk REFERENCES user_info(id),
    balance NUMBER DEFAULT 0
);
INSERT INTO user_info(id, name, email) VALUES (10, 'abc', 'a@b.com');
INSERT INTO bank_account(id, user_info_id) VALUES (1, 10);
SELECT * FROM user_info;
SELECT * FROm bank_account;
CREATE TABLE user_info (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(128) NOT NULL,
    email VARCHAR2(128) UNIQUE
);

CREATE TABLE bank_account (
    id NUMBER PRIMARY KEY,
    user_info_id NUMBER CONSTRAINT user_info_fk REFERENCES user_info(id),
    balance NUMBER DEFAULT 0
);
INSERT INTO user_info(id, name, email) VALUES (10, 'abc', 'a@b.com');
INSERT INTO bank_account(id, user_info_id) VALUES (1, 10);
SELECT * FROM user_constraints WHERE table_name = 'BANK_ACCOUNT';
SELECT * FROM user_cons_columns WHERE table_name = 'BANK_ACCOUNT';

DROP TABLE test;
CREATE TABLE test AS (SELECT empno, ename, sal FROM emp WHERE 1=0);
SELECT * FROM test;
--ALTER TABLE 테이블이름 ADD (컬럼 데이터타입);
--ALTER TABLE 테이블이름 RENAME COLUMN 원래_컬럼_이름 to 바뀔_컬럼_이름;
ALTER TABLE test RENAME COLUMN job TO jobjob;
-- 새 컬럼 추가하기
--ALTER TABLE 테이블이름 ADD (컬럼 데이터타입);
-- 컬럼 이름 변경
--ALTER TABLE 테이블이름 RENAME COLUMN 원래_컬럼_이름 to 바뀔_컬럼_이름;
-- 컬럼 타입 변경
--ALTER TABLE 테이블이름 MODIFY (컬럼 바꿀타입);
SELECT * FROM emp;
ALTER TABLE EMP MODIFY COMM NUMBER DEFAULT 0;

DESC test;
ALTER TABLE test DROP COLUMN jobjob;
--ALTER TABLE 테이블이름 DROP COULUMN 컬럼이름;
ALTER TABLE EMP RENAME CONSTRAINT EMP_EMPNO_PK TO EMP_EMPNO;
-- 제약조건 이름 변경
--ALTER TABLE 테이블이름 RENAME CONSTRAINT 원래제약조건명 TO 바꿀제약조건명;
-- 제약조건 제거
--ALTER TABLE 테이블이름 DROP CONSTRAINT 제약조건명;
--ALTER TABLE 기존_테이블_이름 RENAME TO 새로운_테이블_이름;
DESC test;
ALTER TABLE test RENAME TO test_test;
SELECT * FROM test;
SELECT * FROM test_test;

TRUNCATE TABLE bank_account;
--한번에 완전 삭제
CREATE TABLE emp_copy AS SELECT = FROM emp;
SELECT * FROM EMP;

CREATE VIEW emp_copy_view AS SELECT *FROM emp;
SELECT * FROM emp_copy_view;

CREATE SEQUENCE seq_empno
START WITH 1000
INCREMENT BY 1
CACHE 20;

SELECT seq_empno.nextval FROM dual;
--출력할때마다 1씩 값이 커짐^^
CREATE SEQUENCE empno_seq INCREMENT BY 1000;
SELECT * FROM USER_SEQUENCES;