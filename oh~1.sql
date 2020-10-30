--0. Ȥ�� ���� ����
DROP USER test01 CASCADE;
DROP USER test02 CASCADE;

SHOW UESR;
--1.����� ���� ���� �� ���� �ο�
CREATE USER test01 IDENTIFIED BY 1234;
CREATE USER test02 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO test01, test02;

--3. ���� ���Ǿ �����ϰ� test01���� �ο�����
CREATE PUBLIC SYNONYM def_public FOR test02.def;
GRANT SELECT ON test02.def TO test01;

SELECT * FROM DBA_USERS;
--����ڿ��� ���� �ο�
GRANT 
    CREATE USER,    --����� ����
    ALTER USER,     --����� ����
    DROP USER       --����� ����
TO test01
WITH ADMIN OPTION;
--����ڷκ��� ���� ȸ��
REVOKE
DROP USER
FROM test01;

GRANT 
DROP USER
TO test01
WITH ADMIN OPTION;
--������(selection)
SELECt * FROm emp;
--��������(projection)
SELECT ename,

SELECT ename AS ������
FROm emp e
JOIN dept d ON e.deptno = d.deptno;

SELECT * FRom tab;
SHOW USER;
DESC bank_account;

SELECT nvl2(comm, sal + comm, sal) AS �ѱݾ� FROM emp;
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

SELECT ename, sal AS ���� FROM emp ORDER BY ���� DESC;

SELECT ename || '''s JOB is ' || job AS EMPLOYEE FROM emp;

SELECT abs(-10) FROM dual;

SELECT round(3.1415926535) FROM dual;

SELECT TRUNC(3.1415926535) FROm dual;

SELECT mod (21,5) FROM dual;

SELECT upper('sam') FROM dual;
SELECT lower ('SAM') FROM dual;

SELECT initcap('DUAL abac daAbads') FROM dual;
--��� �ܾ��� ù���ڸ� �빮�ڷ� ����ϰ� ����� ���ǹ�

SELECT length('abc') FROm dual;
--���ڿ� �� ���
SELECT lengthb('abc') FROM dual;
SELECT length('�ѱ�')FROm dual;
SELECT lengthb('�ѱ�')FROm dual;
--���� �� ���

SELECT instr('abcdef', 'e') FROM dual;
SELECT instrb('abcdef', 'e')FROM dual;

SELECT nvl2(comm, sal  + comm, sal) AS �ѿ��� FROM emp;
SELECT sum(sal) + sum(comm) �޿������� FROM emp;
SELECT job, COUNT(job) FROM emp GROUP BY job;
CREATE TABLE emp_copy AS SELECT empno, ename, sal FROM emp;

SELECT * FROM emp;
UPDATE emp
SET ename = 'abc'
WHERE ename LIKE 'A%';
--BRANDS ���̺� ����
CREATE TABLE BRANDS(
    BRAND_ID NUMBER PRIMARY KEY,
    BRAND_NAME VARCHAR2(100) NOT NULL
);
--PRODUCTS ���̺� ����
CREATE TABLE PRODUCTS(
    PRODUCT_NO NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(50) NOT NULL,
    PRODUCT_PRICE NUMBER NOT NULL,
    BRAND_CODE NUMBER REFERENCES BRANDS,
    SERIAL_NO VARCHAR2(100) UNIQUE,
    SOLD_OUT CHAR(1) CHECK(SOLD_OUT IN ('Y', 'N'))
);
--SEQ_BRAND_ID : 100���� �����Ͽ� 100�� ����, �ִ밪 1000, �ݺ� ����.
--SEQ_BRAND_ID ������ ����
CREATE SEQUENCE SEQ_BRAND_ID
START WITH 100
INCREMENT BY 100
MAXVALUE 1000
NOCYCLE;
--SEQ_PRODUCT_NO : 1���� �����Ͽ� 1�� ����, �ִ밪 10000, �ݺ� ����.
--SEQ_PRODUCT_NO ������ ����
CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 100
INCREMENT BY 100
MAXVALUE 10000
NOCYCLE;
--BRANDS ���̺� ������ ����
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '�Ｚ');
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '����');
SELECT * From brands;
--PRODUCTs ���̺� ������ ����
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������S8', 800000, 100, 'S8', 'Y');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������S9', 900000, 100, 'S9','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������S10', 1000000, 100, 'S10','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������9S', 900000, 200, '9S','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������10S', 1000000, 200, 'S10','N');
SELECT * FROM products;

--����1

--����
--1.product ���̺� UNIQUE(serial_no)�� �䱸�ϰ� ������, �ɷ����� ����.
--2.SEQ_BRAND_ID �������� 'MAXVALUE 1000'���� ����Ǿ� �־�����, ���� �� 500���� �����ϰ� �־���.
--3.������ INSERT�ϴ� �κп��� NEXTVAL�� �ƴ� CURRVAL�� �ۼ��Ǿ� �־���.

--Ű���� : UNIQUE,NEXTVAL,CURRVAL,MAXVALUE

--��ġ����
--1.ALTER TABLE products ADD UNIQUE(serial_no);
--ALTER TABLE products ADd UNIQUE(serial_no);
--2.ALTER SEQUENCE seq_brand_id MAXVALUE 1000;
--3.������ CURRAVAL - > NEXTVAL�� ����

--Ű���� : ALTER,MAXVALUE,CURRVAL,NEXTVAL

--����2

--����

--��ġ����