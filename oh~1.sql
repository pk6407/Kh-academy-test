--0. 혹시 몰라서 삭제
DROP USER test01 CASCADE;
DROP USER test02 CASCADE;

SHOW UESR;
--1.사용자 계정 생성 및 권한 부여
CREATE USER test01 IDENTIFIED BY 1234;
CREATE USER test02 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO test01, test02;

--3. 공개 동의어를 생성하고 test01에게 부여해줌
CREATE PUBLIC SYNONYM def_public FOR test02.def;
GRANT SELECT ON test02.def TO test01;

SELECT * FROM DBA_USERS;
--사용자에게 권한 부여
GRANT 
    CREATE USER,    --사용자 생성
    ALTER USER,     --사용자 수정
    DROP USER       --사용자 삭제
TO test01
WITH ADMIN OPTION;
--사용자로부터 권한 회수
REVOKE
DROP USER
FROM test01;

GRANT 
DROP USER
TO test01
WITH ADMIN OPTION;
--셀렉션(selection)
SELECt * FROm emp;
--프로젝션(projection)
SELECT ename,

SELECT ename AS 직원명
FROm emp e
JOIN dept d ON e.deptno = d.deptno;

SELECT * FRom tab;
SHOW USER;
DESC bank_account;

SELECT nvl2(comm, sal + comm, sal) AS 총금액 FROM emp;
SELECT * FROM emp WHERE sal ^= 1500;
SELECT * FROM emp WHERE sal != 1500;
SELECT * FROM emp WHERE sal <> 1500;

SELECT * FROM emp WHERE NOT comm is null;

SELECT * FROM emp WHERE deptno = 10 OR deptno = 20;
SELECT * FROM emp WHERE deptno IN(10, 20);
SELECT * FRom emp WHERE empno BETWEEN 7400 AND 7500;

SELECT * FRom emp WHERE comm is null;
SELECT * FRom emp WHERE not comm is null;
SELECT * FRom emp WHERE comm is not null;

SELECT * FROM emp ORDER BY sal DESC, comm ASC;

SELECT ename, sal AS 월급 FROM emp ORDER BY 월급 DESC;

SELECT ename || '''s JOB is ' || job AS EMPLOYEE FROM emp;

SELECT abs(-10) FROM dual;

SELECT round(3.1415926535) FROM dual;

SELECT TRUNC(3.1415926535) FROm dual;

SELECT mod (21,5) FROM dual;

SELECT upper('sam') FROM dual;
SELECT lower ('SAM') FROM dual;

SELECT initcap('DUAL abac daAbads') FROM dual;
--모든 단어의 첫글자만 대문자로 출력하게 만드는 조건문

SELECT length('abc') FROm dual;
--문자열 수 출력
SELECT lengthb('abc') FROM dual;
SELECT length('한글')FROm dual;
SELECT lengthb('한글')FROm dual;
--문자 수 출력

SELECT instr('abcdef', 'e') FROM dual;
SELECT instrb('abcdef', 'e')FROM dual;

SELECT nvl2(comm, sal  + comm, sal) AS 총월급 FROM emp;
SELECT sum(sal) + sum(comm) 급여총지출 FROM emp;
SELECT job, COUNT(job) FROM emp GROUP BY job;
CREATE TABLE emp_copy AS SELECT empno, ename, sal FROM emp;

SELECT * FROM emp;
UPDATE emp
SET ename = 'abc'
WHERE ename LIKE 'A%';
--BRANDS 테이블 생성
CREATE TABLE BRANDS(
    BRAND_ID NUMBER PRIMARY KEY,
    BRAND_NAME VARCHAR2(100) NOT NULL
);
--PRODUCTS 테이블 생성
CREATE TABLE PRODUCTS(
    PRODUCT_NO NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(50) NOT NULL,
    PRODUCT_PRICE NUMBER NOT NULL,
    BRAND_CODE NUMBER REFERENCES BRANDS,
    SERIAL_NO VARCHAR2(100) UNIQUE,
    SOLD_OUT CHAR(1) CHECK(SOLD_OUT IN ('Y', 'N'))
);
--SEQ_BRAND_ID : 100부터 시작하여 100씩 증가, 최대값 1000, 반복 없음.
--SEQ_BRAND_ID 시퀀스 생성
CREATE SEQUENCE SEQ_BRAND_ID
START WITH 100
INCREMENT BY 100
MAXVALUE 1000
NOCYCLE;
--SEQ_PRODUCT_NO : 1부터 시작하여 1씩 증가, 최대값 10000, 반복 없음.
--SEQ_PRODUCT_NO 시퀀스 생성
CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 100
INCREMENT BY 100
MAXVALUE 10000
NOCYCLE;
--BRANDS 테이블에 데이터 삽입
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '삼성');
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '애플');
SELECT * From brands;
--PRODUCTs 테이블에 데이터 삽입
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S8', 800000, 100, 'S8', 'Y');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S9', 900000, 100, 'S9','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S10', 1000000, 100, 'S10','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰9S', 900000, 200, '9S','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰10S', 1000000, 200, 'S10','N');
SELECT * FROM products;

--문제1

--원인
--1.product 테이블에 UNIQUE(serial_no)를 요구하고 있으나, 걸려있지 않음.
--2.SEQ_BRAND_ID 시퀀스가 'MAXVALUE 1000'으로 기술되어 있었지만, 생성 시 500으로 생성하고 있엇음.
--3.애플을 INSERT하는 부분에서 NEXTVAL이 아닌 CURRVAL가 작성되어 있엇음.

--키워드 : UNIQUE,NEXTVAL,CURRVAL,MAXVALUE

--조치내용
--1.ALTER TABLE products ADD UNIQUE(serial_no);
--ALTER TABLE products ADd UNIQUE(serial_no);
--2.ALTER SEQUENCE seq_brand_id MAXVALUE 1000;
--3.시퀀스 CURRAVAL - > NEXTVAL로 변경

--키워드 : ALTER,MAXVALUE,CURRVAL,NEXTVAL

--문제2

--원인

--조치내용