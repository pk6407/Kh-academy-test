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

-- ���̺� account_info ����
DROP TABLE account_info CASCADE CONSTRAINTS;
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,-- Į������ ����ɶ��� CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)
    created_date TIMESTAMP DEFAULT SYSDATE,--�ý��ۿ� �մ� ���� �ð� �� ����
    grade VARCHAR2(128) DEFAULT 'NEW',
    CONSTRAINT account_info_email_uq UNIQUE (email),
    CONSTRAINT account_info_email_length_chk CHECK (length(email) > 3)--�ڵ忡�� ����ɶ�
); 

-- �� �ֱ�
INSERT INTO account_info(id, email) VALUES(1, 'abc@gmail.com');
-- �� Ȯ��
SELECT * FROM account_info;

-- ���̺� account_authentication ����
DROP TABLE account_authentication CASCADE CONSTRAINTS;
CREATE TABLE account_authentication (
    id NUMBER PRIMARY KEY,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE CASCADE
);

-- account_authentication�� �� �ֱ�
INSERT INTO account_authentication(id, account_info_id) VALUES (1, 1);
-- account_authentication �� Ȯ��
SELECT * FROM account_authentication;

-- �θ����̺� account_info Ȯ��
SELECT * FROM account_info;
-- �θ����̺��� �� ����
DELETE FROM account_info WHERE id = 1;

-- ������ ������ �޾Ҵ��� Ȯ��
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

--CONSTRAINT ���������̸� 
--FOREIGN KEY (������ Į��) 
--REFERENCES ������_���̺�(������_���̺���_Į��)DROP TABLE account_authentication;

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
--# ����

--1. ���� ���� ���� USER �ڿ� �������� �;���
--2. ������ �ο��Ϸ��� GRANT�� ����ؾ���
--3. UNIQUE ����Ű ������ ���̺������� ���־����.
--4. `ON DELETE CASCADE NULL` -> `ON DELETE SET NULL`
--5. VARCHAR2(20) -> DATE�� �ٲپ����.

SELECT * 
FROM emp 
WHERE ename = 'WARD';
--- SQL ������ ��ҹ��ڸ� �������� �ʴ´�
--- SQL ������ �� �� �Ǵ� ���� �ٿ� �Էµ� �� �ִ�
--- �Ϲ������� Ű����� �빮�ڷ� �Է��Ѵ�
--- �ٸ� ��� �ܾ�, �� ���̺� �̸�, �� �̸��� �ҹ��ڷ� �Է��� ����
--- ���� �ֱ��� ��ɾ� �� ���� SQL buffer �� ���� �ȴ�
--- SQL�� ������ ���� ���� ";" �� ����Ͽ� ����� ���� ǥ���Ѵ�.

SELECT length(ename) AS �̸����� FROM emp; 

SELECT * FROM tab;

SHOW user;
--���� ���� ������� ���ӵ��մ��� �˼�����

DESC emp;
--���̺��� �� ���������� ������

SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT deptno, job FROM emp;
--�ߺ��� ���� ��������

SELECT ename, sal AS ����, sal * 12 AS ���� FROM emp;
--AS�ϰ� ��Ī ����(���������̸�?)
SELECT * FROM emp WHERE sal = 1600;

SELECT * FROM emp WHERE sal >= 1000;
--sal ���� 1000�̻��̸� ����ϰ� �ϴ� ���ǽ�

SELECT * FROM emp WHERE comm > 500;
--comm���� 500�̻��ΰ͵鸸 ����ϰ� �ϴ� ���ǽ�
DESC emp;
 
SELECT * FROM emp WHERE deptno <> 30;
SELECT * FROM emp WHERE deptno != 30;
SELECT * FROM emp WHERE deptno ^= 30;
SELECT * FROM emp WHERE NOT deptno = 30;
--deptno���� 30�� �ƴѰ͵鸸 ����ϰ� �ϴ� ���ǽĵ�

SELECT * FROM emp WHERE job = 'SALESMAN' AND comm >= 300;
--job�� SALESMAN�̰� comm�� 300�̻��ΰ͸� ����ϰ� �ϴ� ���ǽ�

SELECT * FROM emp WHERE deptno IN (20, 30);
--emp�� deptno�� ����20�̳�,30�ΰ͵� ����ϰ� �ϴ� ���ǽ�
SELECT * FORM emp WHERE job IN('SALESMAN','MANAGER');
--SALESMAN��MANAGER�ΰ͵鸸 ����ϰ� �ϴ� ���ǽ�
SELECT * FROM emp WHERE empno BETWEEN 7698 AND 7902;
--empnoâ���� 7698���̿� 7902���� �͵� ���
SELECT * FROM emp WHERE empno >= 7698 AND empno <=7902;
--���� ���ǰ� ����

SELECT * FROM emp WHERE ename LIKE 'AL%';
--ename�� AL�� �����ϴ»�� ����ϴ� ���ǽ�
SELECT * FROM emp WHERE ename NOT LIKE '%A%';
--ename�� ù��° ���ڿ� A�� ���� ����鸸 ����ϰ� �ϴ� ���ǽ�

SELECT * FROM emp WHERE NOT comm IS NULL;
--comm�� �մ� ������� ����ϴ� ���ǽ�

SELECT * FROM emp WHERE NOT comm IS NULL ORDER BY empno;
--comm�� �մ� ������� ����ϰ� �װ� ���������ϴ� ���ǽ�
SELECT * FROM emp WHERE NOT comm IS NULL ORDER BY empno DESC;
--comm�� �ִ� ������� ��µǰ� �װ� �������� �ϴ� ���ǽ�

SELECT ename, sal FROM emp ORDER BY sal, ename;
--sal������ ���� ������ ename���� ���� ��������
SELECT ename, sal FROM emp ORDER BY sal DESC, ename ASC; 
--sal�� ������������ ������,ename�� ������������ ����
SELECT ename, sal AS ���� FROM emp ORDER BY ���� DESC;
--sal�� �����̶�� ��Ī�ϰ�,������ ������������ ����

SELECT ename || '''s JOB is ' || job AS EMPLOYEE FROM emp;
--String employee = ename + 's JOB is';


SELECT 20 * 30 FROM dual;
--���� ���̺� ����� ���ǽ�
SELECT mod(5, 4) FROM dual;

SELECT -10, ABS(10) FROM dual;

SELECT 3.141592, round(3.541592) FROM dual;

SELECT mod(12, 5) FROM dual;
--12�� 5�� ���ﶧ �����°�
SELECT CEIL(12.3456) FROM dual;
--12.3456�� ���� ������ ū �������� ����ϴ� ���ǽ�
SELECT FLOOR(12.3456) FROM dual;
--12.3456�� ���� ������ ���� ������ ����ϴ� ���ǽ�
SELECT POWER(3,4) FROM dual;
--POWER(����A, ����B) ����A�� ����B��ŭ �����ϴ� �Լ��̴�
SELECT INITCAP('kim mal ddong') FROM dual;
--�ܾ��� �� ���ڸ� �빮�ڷ� ��ȯ���ִ� �Լ��� INITCAP(�� �Ǵ� �÷���)�� ������ �� �Ǵ� �ش� �÷��� ��ϵ� ���ڿ� ���� ù ���ڸ� �빮�ڷ� ��ȯ�Ͽ� ��ȯ�Ѵ�.
SELECT LOWER('ORACLE') FROM dual;
--�ҹ��ڷ� ��ȯ�ϴ� �Լ��� LOWER(�� �Ǵ� �÷���)�� ������ �� �Ǵ� �ش� �÷��� ��ϵ� ���ڿ����� ��� �ҹ��ڷ� ��ȯ�ȴ�.
SELECT LENGTH(��test11'), LENGTHB('test11') FROM dual;
SELECT LENGTH(���ѱ�'), LENGTHB('�ѱ�') FROM dual;

SELECT INSTR('ORACLE WELCOME','C')FROM dual;

SELECT SUBSTR('����Ŭ �����ͺ��̽�', 3) FROM dual;
--�� ������ ����ڿ�����, ������ġ���� �� ��° ������ ���ù���Ʈ��(������ ������ ���ڿ� ��θ� ����)��ŭ ��ȯ�Ѵ�.

SELECT LPAD('ORACLE', 10, '+') FROM dual;
--10ĭ�� ���������ϰ� ��ĭ��ŭ ��+���� ä���,���� ����
SELECT RPAD('ORACLE', 10, '+') FROM dual;
--10ĭ�� ���������ϰ� ��ĭ��ŭ ��+���� ä���,������ ����

SELECT 
'ORACLE',
ltrim(' ORACLE'),
rtrim('ORACLE ')
FROM dual;
--ltrim�� ���� ���� ����,rtrim�� ������ ���� ����
SELECT TRIM('a' FROM 'aaaOracleaaa') FROM dual;
--�糡�� Ư�� ���ڸ� �����ϴ� �Լ���, Ư�� ���ڸ� �������� ������ ���� ���� �����Ѵ�. ���� ���� ��a������ �����Ͽ� ��ȸ

SELECT SYSDATE FROM dual;
--�ý����� ���� ��¥ �ð� �����
SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss') FROM dual;
--�ý����� ���� ��¥ �� �� �� �� ���
SELECT to_char(SYSDATE + 1, 'yyyy/mm/dd hh24:mi:ss') FROM dual;
SELECT months_between(SYSDATE, SYSDATE +1) FROM dual;
--�ΰ��� ���̿� ���̸� ���
SELECT ADD_MONTHS('17/1/18', '2') FROM dual;
--��¥ 17/1/18�� 2������ ���� �� ���
SELECT next_day(sysdate, '��') FROM dual;
--�ý����� ��¥�� ���� ����� ���� �ݿ����� ��¥�� ���
SELECT last_day(sysdate) FROM dual;
--�ý����� ��¥�� ������ ��¥�� ���
 
SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss') FROM dual;

SELECT ename, nvl(comm, 0) comm FROM emp;
--nvl((��, �÷�), ����� ��)
SELECT ename, nvl2(comm, sal + comm, sal)as pay, sal, comm FROM emp;

SELECT NULLIF(10, 10) FROM dual;
SELECT NULLIF('A', 'B') FROM dual;

SELECT DECODE(100, 100, 'EQUAL', 'UNEQUAL') FROM dual;
SELECT DECODE(100, 150, 'EQUAL', 'UNEQUAL') FROM dual;

SELECT empno, ename, deptno,
DECODE(deptno, 10, 'ȸ����', 20, '������', 30, '������', 40, '���') deptname 
FROM emp;

SELECT * FROM emp e JOIN dept d ON e.deptno = d.deptno;

SELECT 
    ename,
    CASE
        WHEN deptno = 10 THEN 'ȸ����'
        WHEN deptno = 20 THEN '������'
        WHEN deptno = 30 THEN '������'
        WHEN deptno = 40 THEN '���'
        ELSE '������'
        END
        FROM emp;
--CASE
 --   WHEN ���� THEN ����Ұ�
  --  WHEN ���� THEN ����Ұ�
   -- WHEN ���� THEN ����Ұ�
   -- ELSE �⺻��������Ұ�
--END

SELECT count(*), count(comm), count(empno) FROM emp;
-- COUNT(*) : emp ���̺��� ��ü ���� 12��
-- COUNT(empno) : NULL���� ���� empno�÷��� ���� 12��
-- COUNT(comm) : NULL�� �ƴ� ���� 4���� comm �÷�

SELECT sum(sal) FROM emp;
--����� ���� ���,sal�� ��� ���� ���

SELECT avg(sal) FROM emp;
--����� ���� ����� ���

SELECT max(sal) FROM emp;
--����� ���� ���� �� ���
SELECT min(sal) FROM emp;
--����� ���� ���� �� ���

SELECT job, round(avg(sal), 2) AS avgsal FROM emp GROUP BY job ORDER BY avgsal DESC;
--�׷��Լ� �������� ����
SELECT job, count(job) as �ο� 
FROM emp e JOIN dept d ON e.deptno = d.deptno 
GROUP BY job 
ORDER BY �ο� DESC;

SELECT d.loc, count(*) as ������
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.loc
ORDER BY ������ DESC;

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
--    WHEN ���� ������ ������ �����ϴ� �����͸� ���̺��� ������ ����

SELECT * FRom emp;

UPDATE emp
SET sal = 1200
WHERE empno = 7369;
--���̺��� ���� ������ �� ����ϴ� SQL
UPDATE emp
SET sal = sal * 1.1
 WHERE deptno IN (SELECT deptno FROM dept WHERE dname IN ('SALES','ACCOUNTING'));
 SELECT * FRom emp;
 
--DELETE FROM ���̺� WHERE ����
SELECT * FRom emp;

DELETE FROM emp WHERE sal < 3000;

ROLLBACK;
--���̺��� ���� ������ �� ����ϴ� SQL,WHERE���� ������� ������ ��� ���� �����ǹǷ� ������ �����ؾ� �Ѵ�

--MERGE INTO ���̺� ��Ī USING (����)��Ī ON (����) WHEN MATCHED THEN (����) WHEN NOT MACHED THEN(����)
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
--���ǿ� ���� ����, ����, ���� �� ���� �۾��� �ѹ��� �� �� �ִ� ���� �ش� ���� ���� �ϴ� ��� UPDATE(DELETE ���� ����)�� �����ϰ�, ���� ���� ��� INSERT�� ���� ����/���ſ� ���� ������ ������ ON���� ǥ���Ѵ�


CREATE TABLE bank_account(
id NUMBER PRIMARY KEY,
name VARCHAR2(32) NOT NULL,
money NUMBER DEFAULT 0
);

SELECT * FROM bank_account;
INSERT INTO bank_account(id, name, money) VALUES (1, 'A', 1000);
INSERT INTO bank_account(id, name, money) VALUES (2, 'B', 0);
COMMIT;
--A�� ���¸� 0���� ������Ʈ
--B�� ���¸� 100���� ������Ʈ
UPDATE bank_account SET money = 0 WHERE name = 'A';
SELECT * FROM bank_account;
ROLLBACK;

--transaction ����
UPDATE bank_account SET money = 0 WHERE name = 'A';
UPDATE bank_account SET money = 1000 WHERE name = 'B';
COMMIT;
--transaction ��
SELECT * FROM bank_account;

SELECT * FROM emp;
SELECT empno, ename, job, sal,
RANK() OVER(ORDER BY sal DESC) �޿�����
FROM emp; 
--�޿� ���������� ������ �ű�
SELECT RANK(50) WITHIN GROUP (ORDER BY sal DESC) AS ����
FROM emp;

SELECT * FROM (
SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) ���� FROM emp
)WHERE ���� <= 5;
--���� 5���� ��µǰ� �ϴ� ���ǽ�
SELECT ename, deptno, sal,
RANK() OVER (ORDER BY sal DESC) "����1",
DENSE_RANK() OVER (ORDER BY sal DESC) "����2",
DENSE_RANK() OVER (PARTITION BY deptno
ORDER BY sal DESC) "����3" -- �׷� �ȿ����� ����
FROM emp
ORDER BY deptno DESC; 
--sal���� ���� �������� �ӿ� deptno���� ���� ū �����ű�

SELECT *
FROM (SELECT ename, sal,
RANK() OVER (ORDER BY sal DESC) ����
FROM emp)
WHERE ���� = 10;
--emp���̺�ȿ� sal�� �������� 10�� �� ���

SELECT ename, sal,
ROUND(CUME_DIST() OVER (ORDER BY sal), 1) �����л�
FROM emp
WHERE empno= '50';

SELECT ename, sal, NTILE(5) OVER (ORDER BY sal DESC)���
FROM emp;

SELECT empno, ename, sal, hiredate,
    ROW_NUMBER() OVER (ORDER BY sal DESC, hiredate ASC) ����
FROM emp;
--sal�� ���� ������� ������ ������ ����

SELECT deptno
, SUM(sal) s_sal
FROM emp
GROUP BY deptno ORDER BY s_sal DESC;
--��� �μ��� ���帹�� �޴��� ���� ���ǽ�

SELECT empno, sal,
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) "win1",
-- rows : �κб׷��� �������� ũ�⸦ �������� ������ �������� ����
-- unbounded preceding : �������� ù��
-- unbounded following : �������� ��������
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "win2",
-- �������� �����࿡�� ���� ��ġ(current row) ������ �հ踦 ���ؼ� win2��
SUM(sal) OVER (PARTITION BY deptno ORDER BY empno ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) "win3"
-- ���� ��ġ���� �������� ������������� �հ踦 ���ؼ� win3��
FROM emp
WHERE deptno = 30;

SELECT ename, sal,
LPAD(TRUNC(RATIO_TO_REPORT(sal) OVER() * 100, 0), 5) || ' %' ����,
TO_CHAR(TRUNC(RATIO_TO_REPORT(sal) OVER() * 20000000, 0), 'L00,999,999') "�߰��� �ްԵ� �޿�"
FROM emp;
--sal�� 200000�� ���ش������� ������ �޴� sal���� ���۸� �λ�޳��� ������ ���ǽ�

SELECT ename, deptno, sal,
LAG(sal, 1, 0) OVER (ORDER BY sal) ������,
-- 1 : ���� �ప, 0 : �������� ������ 0 ó����
LAG(sal, 1, sal) OVER (ORDER BY sal) "��ȸ2",
-- �������� ������ ���� ���� ���� ���
LAG(sal, 1, sal) OVER (PARTITION BY deptno
ORDER BY sal) "��ȸ3"
-- �μ� �׷�ȿ����� ���� �ప ���
FROM emp;
--�����ϴ� �÷��� ���� ���� �������� ���� ��(��)�� ���� ��ȸ��

SELECT ename, deptno, sal, LEAD(sal,1,0) OVER (ORDER BY sal DESC)������ FROM emp;
--���� ���� �� ��ȸ

SELECT DEPTNO, ENAME, SAL
, FIRST_VALUE(ENAME) OVER (PARTITION BY DEPTNO ORDER BY SAL DESC
ROWS UNBOUNDED PRECEDING) as DEPT_RICH
FROM EMP;
--��Ƽ�Ǻ� �����쿡�� ���� ���� ���� ���� ���Ѵ�.

SELECT DEPTNO, ENAME, SAL
, LAST_VALUE(ENAME) OVER ( PARTITION BY DEPTNO ORDER BY SAL DESC
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) as DEPT_POOR
FROM EMP;
--��Ƽ�Ǻ� �����쿡�� ���� ���߿� ���� ���� ���Ѵ�

SELECT * FROM emp;
SELECT * FROM dept;

SELECT e.*, d.dname,d.loc 
FROM emp e 
JOIN dept d ON e.deptno = d.deptno;
--���� ��� ���̺��� ���������� �÷��� ���� ��ġ�Ǵ� ���� �����Ͽ� ����� ����, ���� �Ϲ������� ����ϴ� ��=���� ���� ����
SELECT * FROM emp, dept;

SELECT * FROM emp;
SELECT e.ename, e.sal, s.grade
FROM emp e
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal;
--emp���̺��� ������ �̿��� salgrade�� ��������� �����Ͽ� ��ȸ

SELECT e.ename m.ename Manager 
FROM emp e 
    JOIN emp m ON e.empno = m.mgr;

SELECT e.ename, e.empno, m.mgr, m.ename
FROM emp e, emp m;
--�ϳ��� ���̺��� �ڽ��� ���̺�� Equi Join�� �߻��ϴ� ���̴�
--�ϳ��� ���̺� ���ؼ� �� ���� alias�� ����� �� ���� ���̺��� ��ó�� �����Ѵ�
--emp���̺��� ����� �ش� ����� �Ŵ��� ��ȸ

SELECT e.ename, d.dname
FROM emp e
INNER JOIN dept d
ON e.deptno = d.deptno;
--�Ϲ����� JOIN���� ,(�޸�)�� �����ϰ� INNER JOIN ���� ���
--WHERE�� ��ſ� ON���� ����Ѵ�
--INNER Ű����� ���� ����
--emp ���̺�� dept ���̺��� �����Ͽ� �������� �μ����� ��ȸ�ϴ� ����

SELECT e.ename, e.deptno, d.dname
FROM emp e RIGHT OUTER JOIN dept d
ON e.deptno = d.deptno
ORDER BY e.deptno;
--emp���̺� ���� deptno�� 40�� ���ؼ��� ������ �̷���� ���� �� �� �ִ�
--(+)�����ڸ� ���ʿ� �δ� ������ ANSI ����� RIGHT OUTER JOIN���� ǥ�� ����
SELECT employee.ename employee, manager.ename manager
FROM emp employee LEFT OUTER JOIN emp manager
ON employee.mgr = manager.empno;
--emp���̺��� SELF JOIN�Ͽ� mgr�� �̸��� ��ȸ
--mgr�� �������� ���� KING�� ��µ� ���� �� �� �ִ�
--(+)�����ڸ� �����ʿ� �δ� ������ LEFT OUTER JOIN���� ǥ�� ����
SELECT e.ename, m.ename FROM emp e JOIN emp m ON e.empno = m.mgr;
--null�� �����ϰ� ǥ�� �� ���ø�

SELECT * 
FROM emp e 
RIGHT JOIN dept d ON e.deptno = d.deptno;
--emp ���̺�� dept ���̺��� �����Ͽ� �������� �μ����� ��ȸ�ϴ� ����

SELECT e.empno, e.ename, d.dname
FROM emp e INNER JOIN dept d
USING (deptno);
--USING�� �̿��ϱ�(���̺�Ī�� ����ߵ�)
SELECT empno, ename, dname
FROM emp NATURAL JOIN dept;
--NATURAL JOIN(EQUI JOIN�� ��������� WHERE ������ ���� �����Ѵ�)

SELECT * FROM dept;
SELECT * FROM emp
WHERE deptno = (
SELECT deptno FROM dept WHERE dname = 'ACCOUNTING'
);
--�ϳ��� SQL ���� ���� ���Ե� �� �ٸ� SQL ���� �ִ� ������
--��ü SQL ������ ���� ������� �ϸ� ���� ����(Main Query or Outer Query)�� ���ӵ� ���� ������ ���� ����(Sub Query or Inner Query)��� �Ѵ�

SELECT *FROM emp WHERE sal >= (SELECT avg(sal) FROM emp);
--��պ��� ���� sal�� �޴� ����� ����ϴ� ���ǹ�
SELECT avg(sal) FROM emp;
--sal��� ���ϴ� ���ǹ�
SELECT * FROM emp WHERE deptno IN(SELECT deptno FROM dept WHERE loc IN ('NEW YORK', 'DALLAS'));
--�����ϰ� ������ ���� ��»���� ����ϴ� ���ǹ�
SELECT deptno FROM dept WHERE loc IN ('NEW YORK', 'DALLAS');

SELECT e.ename, d.dname,e.sal,d.deptno
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE sal IN (SELECT MAX(sal) FROM emp
GROUP BY deptno);
--�μ��� �޿��� ���� ���� �޴� ��� ��ȸ
--1. �׷캰�� ���� ���� �������
--2. EMP ,DEPT ���� (�����)
--3. WHERE �������� IN (2850 ,3000,5000)

SELECT empno, ename,job, sal
FROM emp
WHERE sal > ANY (SELECT sal FROM emp WHERE JOB = 'SALESMAN');
--��SALESMAN�� ���� �޿��� ��ȸ�Ͽ� ANY �����ڷ� ���� ������ ���Ͽ� ��µǵ��� �� ����.
--��SALESMAN�� ���� �޿� �� �ּҰ����� ���� �޿��� �޴� ������� ��µȴ�

SELECT empno, ename, sal
FROM emp
WHERE sal = ANY (SELECT sal
FROM emp
WHERE JOB = 'SALESMAN');
--SALESMAN������ �޿��� ���� �޿��� �޴� ����� ��ȸ�� ����

SELECT * FROM emp WHERE sal > ALL (SELECT sal FROM emp WHERE JOB = 'MANAGER');
--MANAGER�� ������� �޿��� ���� ���� �޿��� �޴� ����� ��ȸ�� ����
--��MANAGER�� ����� �� �ְ� �޿��� 2975 ���� ���� �޿��� �޴� ������� ��ȸ�ȴ�

SELECT mgr FROM emp WHERE not mgr is null GROUP BY mgr;
SELECT empno, ename, sal
FROM emp e
WHERE EXISTS (SELECT empno FROM emp WHERE e.empno = mgr);
--�����ڷ� ��ϵǾ� �ִ� ������� ��ȸ�� ����.

SELECT empno, ename, sal, deptno
FROM emp
WHERE (deptno, sal) IN (SELECT deptno, sal FROM emp WHERE deptno = 30);
--���� ������ ����� �� �� �̻��� �÷����� ��ȯ�Ǿ� ���� ������ �����ϴ� �����̴�.
--�μ� ��ȣ�� 30�� ������� �޿��� �μ���ȣ�� ���� ���� ������ ������ ����.

SELECT ENAME, DEPTNO, SAL,
-- �Ҽ� �μ��� �޿� ��հ� 1��
(SELECT TRUNC(AVG(SAL)) FROM EMP WHERE DEPTNO = E.DEPTNO) AS AVGDEPTSAL
FROM EMP E;
--�� �������� EMP ���̺��� �� �ึ�� �μ���ȣ�� �� ���� �μ���ȣ�� ������ ������� SAL ����� ���ؼ� ���� �ϰ� �ִ�.
SELECT EMPNO, ENAME,
CASE WHEN DEPTNO = (SELECT DEPTNO
FROM DEPT
WHERE LOC = 'NEW YORK')
THEN '����'
ELSE '����'
END AS �Ҽ�
FROM EMP E
ORDER BY �Ҽ� DESC;
--�� �������� EMP ���̺��� ��ȸ�ϸ鼭 ����� �μ���ȣ�� LOC�� NEW YORK�� �μ��� �μ���ȣ�� ���� �� ������, �����硯�� �� �ܿ��� ���������� ����ϰ� �ִ�

SELECT ENAME, JOB,
(SELECT DNAME
FROM DEPT
WHERE DEPTNO = E.DEPTNO) DNAME
FROM EMP E;
--SELECT �÷��� ��������� ����ؼ� ����� �μ��̸��� ���� ����.
--�� ������ EMP ���̺� ���� �÷��� �μ��̸��� ��ȸ�ϰ� �ִ�. �ٸ�, ���� �������� �������� �ʰ�,
--�� ���� ��µ� ��, �ش� ����� �μ���ȣ�� ���� �������� DEPT ���̺��� ��������� ȣ���Ѵ�.

SELECT b.empno, b.ename, b.job, b.sal, b.deptno
FROM (
SELECT empno FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = 20)
) a, emp b
WHERE a.empno = b.empno AND b.mgr is NOT NULL AND b.deptno != 20;
--1.���� ���ʿ� �ִ� ���� ����:SELECT AVG(sal) FROM emp WHERE deptno = 20;
--2.SELECT empno, ename FROM emp WHERE sal > (SELECT AVG(sal) FROM emp WHERE deptno = 20);
--�޿��� �μ���ȣ 20�� �μ��� ��պ��� ���� ����� �����ϴ� ��MANAGER�� �ν� 20 �μ��� ������ ���� ����� ��ȸ�� ����.

SELECT EMPNO, ENAME, DEPTNO, HIREDATE
FROM EMP E
ORDER BY (SELECT DNAME FROM DEPT WHERE DEPTNO = E.DEPTNO) DESC;
--1.SELECT EMPNO, ENAME, DEPTNO, HIREDATE FROM EMP E;
--2.SELECT DNAME FROM DEPT;
--�ٸ� ���ǽ� ���� ��:SELECT * FROM emp e JOIN dept d ON e.deptno = d.deptno ORDER BY d.dname DESC;
--���� ��ȸ�� �÷��� �ƴ� �ٸ� �÷������� �����ϰ��� �Ѵٸ�, ORDER BY �� ����Ŀ���� ����ϸ� �ȴ�.

SELECT empno, ename, JOB FROM emp WHERE JOB = 'SALESMAN'
UNION
SELECT empno, ename, JOB FROM emp WHERE JOB = 'MANAGER';
--SELECT empno, ename, JOB FROM emp WHERE JOB = 'MANAGER';
--SELECT empno, ename, JOB FROM emp WHERE JOB = 'SALESMAN'
--������ ��� ���:SELECT empno,ename, job FROM emp WHERE job IN ('SALESMAN', 'MANAGER');
--��������� �����ڸ� ���� �����Ͽ� UNION���� ������ ����.

SELECT empno, ename, sal FROM emp WHERE sal < 1000
UNION ALL
SELECT empno, ename, sal FROM emp WHERE sal < 2000
ORDER BY empno;
--�޿��� 1000 �̸��� ����, 2000 �̸��� ������ ��ȸ�Ͽ� UNION ALL �� ������ ����.
--SELECT empno, ename, sal FROM emp WHERE sal <2000;

SELECT empno, ename, sal FROM emp WHERE sal > 1000
INTERSECT
SELECT empno, ename, sal FROM emp WHERE sal < 2000;
--�޿��� 1000 �ʰ��� ������ ��ȸ�ϰ� 2000 �̸��� ������ ���� ��ȸ�Ͽ� INTERSECT�� ������ ����.
--�޿��� 1000 �ʰ� 2000 �̸��� �����鸸 ��ȸ�Ѵ�.
--SELECT empno, ename, sal FROM emp WHERE sal > 1000 AND sal < 2000;

SELECT empno, ename, sal FROM emp
MINUS
SELECT empno, ename, sal FROM emp WHERE sal > 2000;
--��� ��ü ������� MINUS �����ڸ� �̿��� �޿��� 2000 �ʰ��� ��� �����Ͽ� ��ȸ�� ����.
--SELECT empno, ename, sal FROM emp WHERE sal <= 2000;

DROP TABLE test_table;

CREATE TABLE test_table(
id NUMBER PrIMARY KEY,
name VARCHAR2(128) NOT NULL
);

SELECT table_name FROM USER_TABLES WHERE table_name = 'TEST';

CREATE TABLE test_table(
id number,
name VARCHAR2(128) CONSTRAINT test_table_nn NOT NULL, --Į�� ����
--���̺� ����
CONSTRAINT test_table_pk PRIMARY KEY (id)
);
DESC test_table;

--ALTER TABLE ���̺� �̸� ADD CONSTRAINT ���������̸� ������������(Į���̸�);
ALTER TABLE test_table ADD CONSTRAINT test_table_name_uq UNIQUE(name);
--ALTER TABLE ���̺��̸� MODIFY (Į�� NOT NULL);

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
--ALTER TABLE ���̺��̸� ADD (�÷� ������Ÿ��);
--ALTER TABLE ���̺��̸� RENAME COLUMN ����_�÷�_�̸� to �ٲ�_�÷�_�̸�;
ALTER TABLE test RENAME COLUMN job TO jobjob;
-- �� �÷� �߰��ϱ�
--ALTER TABLE ���̺��̸� ADD (�÷� ������Ÿ��);
-- �÷� �̸� ����
--ALTER TABLE ���̺��̸� RENAME COLUMN ����_�÷�_�̸� to �ٲ�_�÷�_�̸�;
-- �÷� Ÿ�� ����
--ALTER TABLE ���̺��̸� MODIFY (�÷� �ٲ�Ÿ��);
SELECT * FROM emp;
ALTER TABLE EMP MODIFY COMM NUMBER DEFAULT 0;

DESC test;
ALTER TABLE test DROP COLUMN jobjob;
--ALTER TABLE ���̺��̸� DROP COULUMN �÷��̸�;
ALTER TABLE EMP RENAME CONSTRAINT EMP_EMPNO_PK TO EMP_EMPNO;
-- �������� �̸� ����
--ALTER TABLE ���̺��̸� RENAME CONSTRAINT �����������Ǹ� TO �ٲ��������Ǹ�;
-- �������� ����
--ALTER TABLE ���̺��̸� DROP CONSTRAINT �������Ǹ�;
--ALTER TABLE ����_���̺�_�̸� RENAME TO ���ο�_���̺�_�̸�;
DESC test;
ALTER TABLE test RENAME TO test_test;
SELECT * FROM test;
SELECT * FROM test_test;

TRUNCATE TABLE bank_account;
--�ѹ��� ���� ����
CREATE TABLE emp_copy AS SELECT = FROM emp;
SELECT * FROM EMP;

CREATE VIEW emp_copy_view AS SELECT *FROM emp;
SELECT * FROM emp_copy_view;

CREATE SEQUENCE seq_empno
START WITH 1000
INCREMENT BY 1
CACHE 20;

SELECT seq_empno.nextval FROM dual;
--����Ҷ����� 1�� ���� Ŀ��^^
CREATE SEQUENCE empno_seq INCREMENT BY 1000;
SELECT * FROM USER_SEQUENCES;