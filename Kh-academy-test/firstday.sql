DROP TABLE student_info;

CREATE TABLE student_info(
    name VARCHAR2(128) not null,
    phone VARCHAR2(128) not null,
    email VARCHAR2(128) not null,
    age NUMBER not null,
    fired CHAR(1) default 'N'
);

SELECT * FROM student_info;

INSERT INTO student_info
            (name, phone, email, age, fired)
VALUES ('�賲ȣ', '01050303181', 'asdasd1478@naver.com', 28, 'N');
COMMIT;

SELECT * FROM student_info;

DROP TABLE department;

CREATE TABLE department(
    name VARCHAR(32) not null,
    location VARCHAR(32) not null
);

SELECT * FROM department;

INSERT INTO department (name, location) VALUES ('A', 'B');
INSERT INTO department (name, location) VALUES ('A', null);

COMMIT;

SELECT * FROM department;




DROP TABLE student_info;
CREATE TABLE student_info(
    name VARCHAR2(128) not null,
    phone VARCHAR2(128) not null,
    email VARCHAR2(128) not null,
    age  VARCHAR2(128) not null,
    fired CHAR(1) default 'N',
    department_id NUMBER
);
SELECT * FROM student_info;

INSERT INTO student_info(name, phone, email, age, department_id)
VALUES ('��ȣ��', '1234', 'adad@dsdf.com', 30, 1);

INSERT INTO student_info(name, phone, email, age, department_id)
VALUES ('�̺���', '1234', 'adad@dsdf.com', 30, 2);

INSERT INTO student_info(name, phone, email, age, department_id)
VALUES ('���۸�', '1234', 'adad@dsdf.com', 30, 2);

SELECT * FROM student_info;

DROP TABLE department;
CREATE TABLE department(
    id NUMBER NOT NULL,
    name VARCHAR2(128) NOT NULL,
    location VARCHAR2(128) NOT NULL
);

SELECT * FROM department;
INSERT INTO department(id, name, location) VALUES(1, 'devops', 'pangyo');
INSERT INTO department(id, name, location) VALUES(2, 'design', 'seoul');
INSERT INTO department(id, name, location) VALUES(3, 'frontdev', 'pangyo');
INSERT INTO department(id, name, location) VALUES(4, 'da', 'somewhere');

SELECT * FROM department;
SELECT * FROM student_info;

SELECT *
FROM student_info si, department d
WHERE si.department_id = d.id;

SELECT * FROM student_info si
JOIN department d
ON si.department_id = d.id;

CREATE TABLE residence(
 r_id VARCHAR2(128) null,
 r_name VARCHAR2(128) null,
 r_nation VARCHAR2(128) null
 );
SELECT * FROM residence;

INSERT INTO residence(id, name, nation) VALUES('������','��ȣ��','��õ��');
SELECT * FROM residence;

SELECT * FROM student_info si
JOIN department d ON si.department_id = d.id
JOIN residence r ON si.residence_id = r.id;


CREATE TABLE student_info2 (
name VARCHAR2(128) NOT NULL,
phone VARCHAR2(128) NOT NULL,
email VARCHAR2(128) NOT NULL,
age  VARCHAR2(128) NOT NULL,
fired Char(1) Default 'N',
department_id NUMBER,
residence_id NUMBER
);

CREATE TABLE residence(
r_id VARCHAR2(128) NOT NULL,
r_name VARCHAR2(128) NOT NULL,
r_nation VARCHAR2(128) NOT NULL
);

INSERT INTO residence(r_id, r_name,r_nation) values ('1','����','�ѱ�');
INSERT INTO residence(r_id, r_name,r_nation) values ('2','����','�߱�');
INSERT INTO residence(r_id, r_name,r_nation) values ('3','����','�Ϻ�');

INSERT INTO student_info2(name,phone,email,age,fired,department_id,residence_id)
values ('������','1234','hey0507@naver.com',29,'Y',1,3);
INSERT INTO student_info2(name,phone,email,age,fired,department_id,residence_id)
values ('������','1234','hey0507@naver.com',39,'N',1,2);
INSERT INTO student_info2(name,phone,email,age,fired,department_id,residence_id)
values ('����ĥ','4321','hey3507@naver.com',49,'N',2,3);

SELECT * FROM student_info2 si, residence r WHERE si.residence_id = r.r_id;


DROP TABLE student_info;
CREATE TABLE student_info(
    name VARCHAR2(128) NOT NULL,
    phone VARCHAR2(128) NOT NULL,
    email VARCHAR2(128) NOT NULL,
    age NUMBER NOT NULL,
    fired CHAR(1) default 'N',
    department_id NUMBER,
    residence_id NUMBER
);

INSERT INTO student_info(name, phone, email, age, fired, department_id, residence_id)
VALUES('����', '123', 'ab', 11, 'N', 1, 2);

SELECT * FROM student_info;
SELECT * FROM department;
SELECT * FROM residence;
INSERT INTO residence(id, city, nation) VALUES (1, 'seoul', 'korea');
INSERT INTO residence(id, city, nation) VALUES (2, 'seattle', 'wa, US');
INSERT INTO residence(id, city, nation) VALUES (3, 'anchorage', 'al, US');

SELECT *
    FROM student_info si
        JOIN department d ON si.department_id = d.id
        JOIN residence r ON si.residence_id = r.id;

CREATE TABLE residence(
    id NUMBER NOT NULL,
    city VARCHAR2(128) NOT NULL,
    nation VARCHAR2(128) NOT NULL
);

CREATE TABLE a (
    id NUMBER not null,
    name VARCHAR2(32) not null,
    b_id NUMBER not null
);

INSERT INTO a(id, name, b_id) VALUES (1, 'a_value1', 1);
INSERT INTO a(id, name, b_id) VALUES (2, 'a_value2', 1);
INSERT INTO a(id, name, b_id) VALUES (3, 'a_value3', 2);

CREATE TABLE b (
    id NUMBER not null,
    name VARCHAR2(32) not null
);

INSERT INTO b(id, name) VALUES (1, 'b_value1');
INSERT INTO b(id, name) VALUES (2, 'b_value2');

SELECT * FROM a;
SELECT * FROM b;

SELECT * FROM a a, b b WHERE a.b_id = b.id;

CREATE TABLE ACCOUT(
id NUMBER NOT NULL,
name VARCHAR2(128) NOT NULL,
email VARCHAR2 (128) NOT NULL,
location VARCHAR2(128) NOT NULL
);

SELECT * FROM accout;

INSERT INTO accout(id,name,email,location) VALUES (1,'chwon','a@b.com','seoul');

SELECT * FROM accout;
CREATE TABLE user_account(
id NUMBER NOT NULL,
name VARCHAR2(128) NOT NULL,
email VARCHAR2 (128) NOT NULL,
location VARCHAR2(128) NOT NULL
);

INSERT INTO user_account(id, name, email, location) VALUES (1, '��ȣ��', 'a@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) VALUES (2, '�̺���', 'b@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) VALUES (3, '����', 'n@b.com', 'seoul');


CREATE TABLE account_log (
    id NUMBER NOT NULL,
    user_account_id NUMBER NOT NULL,
    action VARCHAR2(128) NOT NULL
);
 

INSERT INTO account_log (id, user_account_id, action) VALUES (1, 2, 'LOGGED IN');
INSERT INTO account_log (id, user_account_id, action) VALUES (2, 3, 'DELETED ACTION HISTORY');

SELECT * FROM user_account;
SELECT * FROM account_log;

SELECT * FROM user_account ua, accout_log al;
SELECT * FROM user_account ua, accout_log al WHERE ua.id = al.user_account_id;
SELECT * FROM user_account ua JOIN account_log al ON ua.id = al.user_account_id;

SELECT * FROM emp ORDER BY sal DESC;

SELECT * FROM emp WHERE sal >= 500;

SELECT * FROM emp;

SELECT * FROM emp WHERE job = 'SALESMAN' AND SAL >= 1500;
-- ���̳ʽ� 2���ϸ� �ּ�ó��,emp�ȿ� jobâ�� SALESmAN�ϰ� SALâ�� 1500�̻� �� ���

SELECT * FROM emp WHERE job IN ('PRESIDENT','SALESMAN');
-- JOBâ���� SALESMAN�� PRESIDENT�� ���Ե� ������ ���

SELECT * FROM emp WHERE sal BETWEEN  1000 AND 1500;
-- SALâ�� 1000�̻� 1500���� �� ���Ե� ������ ���

SELECT * FROM emp;
SELECT * FROM emp WHERE ename LIKE 'ON%';
-- LIKE��� ��ɾ�� �˻����
 
SELECT * FROM user_account;

SELECT * FROM user_account WHERE name LIKE '��%';
-- WHERE LIKE ���̿� â�� �̸� LIKE�ڿ� �˻��� �̸�

INSERT INTO user_account(id, name, email, location) VALUES (1, '����', 'a@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) VALUES (2, '����', 'a@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) VALUES (3, '�̻�', 'a@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) VALUES (4, '�̻�', 'a@b.com', 'seoul');

SELECT * FROM emp WHERE NOT comm IS NULL;
-- WHERE�� ����,WHERE�ڿ� �����̵Ǵ½��� �ۼ�

SELECT *FROM emp UNION ALL SELECT * FROM emp;
--UINON�Ҷ� ������ ���� ���ƾߵǰ� �ڷ���Ÿ���� ���ƾ��� 
CREATE TABLE job_table(
id number not null,
job varchar2(128) not null
);

SELECT * FROM job_table;
INSERT INTO job_table(id, job) VALUES (1, 'SALESMAN');
INSERT INTO job_table(id, job) VALUES (2, 'SALESMAN');
INSERT INTO job_table(id, job) VALUES (3, 'CLERK');

SELECT ename FROM emp
UNION
SELECT dname name FROM dept;

SELECT lower(ename) as ename_lower FROM emp;
--��� �ҹ��ڷ� ����
SELECT length(ename) FROM emp;
-- ���ڿ� ���� ���
SELECT * FROM (SELECT * FROM emp);

SELECT ename, substr(ename, 2, 4)FROM emp;
--ename �̶�� â���� ename������ �͵��� 2��° 4��° ���� ������ ���
SELECT ename, instr(ename, 'L') FROM emp;
--enameâ�� ���մ� ������ L�� ��� ���� ���
SELECT ename, replace(ename, 'AR', '') FROM emp;
--enameâ�� ���մ� �����߿� AR�̶�� ���ڰ������� �������� �ٲٰ� ���
SELECT RPAD('121212-', 14, '*') FROM DUAL;
--RPAD�̶� â�ȿ� 121212-����� 14ĭ��ŭ *�ٿ��ֱ�(1,2,3,4,5,6,7ĭ�� ���� �������� �״�� ���ΰ� ��ĭ�� *�Է�)
--PAD(�����ҿ�,ä����ڼ�,ä�﹮��),PAD�տ�L�̸� ���ʺ���,PAD�տ� R�̸� �����ʺ���
SELECT concat(ename, job) FROM emp;
--concat(�����ҿ�1,�����ҿ�2)
SELECT round(3.1415926535) FROM dual;
--round(������ ��(Ȥ�� ��)),�Ҽ��� ����
SELECT trunc(3.1415926535, 2) FROM dual;
--trunc(������ ��, ���° ���ķ� ����������)
SELECT mod(15, 2) FROM dual;
--mod(��������, ������),�ڹ�%�����ڿ� ����
SELECT SYSDATE AS now,
       SYSDATE - 1 AS yesterday,
       SYSDATE + 1 AS tomorrow,
       (SYSDATE + 1) - (SYSDATE -1) AS offset
FROM DUAL;
--�ý��� ����Ʈ�� ��¥ ����,����,���� ���
CREATE TABLE dummy(
id number not null,
current_time timestamp default sysdate
);
INSERT INTO dummy(id) VALUES(10);
SELECT * FROM dummy;
--id�� 10�̶�� �����ϰ� ����ð� ���
SELECT add_months(SYSDATE, 3) FROM DUAL;
--���� ��¥���� 3�� �÷����� �� ���
SELECT next_day(SYSDATE, '������')FROM DUAL;
--next_day(��¥Ÿ���� ��(Ȥ�� ��),'��~�Ͽ���')

SELECT TO_CHAR(SYSDATE, 'CC YYYY/MM/DD HH24:MI:SS') FROM DUAL;
--TO_CHAR(��¥,���˹��ڿ�),CC = ����,YYYY = ����, MM = ��, DD = �� , HH24 = 24��ǥ��, MI = ��, SS = ��
SELECT * FROM emp;
SELECT ename, nvl2(comm, 'Ŀ�̼�����', 'Ŀ�̼Ǿ���') as Ŀ�̼����翩�� FROM emp;
--nv12(������ ��, NULL�� �ƴ� ��� ����� ��, NULL�� ��� ����� ��); 
SELECT sal FROM emp;
SELECT ename, sal,
CASE
    WHEN sal >= 500 AND 1000 > sal THEN '500�̻� 1000�̸�'
    WHEN sal >= 1000 AND 1500 > sal THEN '1000�̻� 1500�̸�'
    WHEN sal >= 1500 AND 2000 > sal THEN '1500�̻� 2000�̸�'
    WHEN sal >= 200 AND 5000 > sal THEN '2000�̻� 2500�̸�'
END as range
FROM emp; 
--500�̻� 1000�̸����� Ȯ���� ���
--ename,sal�Է°� �ҷ�����,case(���Ǿȿ�)WHEN �� ���� ��ũ�� THEN,END����ġ�� as�ش����ǰ��� �� range��� â�� ǥ��
SELECT sum(sal) FROM emp;
SELECT count(comm) FROM emp;
--sum(�����ҿ�)
--count(�����ҿ�)
SELECT avg(sal) FROM emp;
SELECT sum(sal) / count(*) FROM emp;
--sal�� ��ձ��ϴ°�
SELECT *FROM emp ORDER BY job;

SELECT avg(sal) FROM emp WHERE job = 'MANAGER';

SELECT job FROM emp GROUP BY job;
--job�� emp �� (�׷�ȭ)���ٴ�
SELECT job, avg(sal) as avgsal FROM emp GROUP BY job ORDER BY avgsal DESC;

SELECT * FROM emp;
SELECT * FROM dept;

SELECT * FROM emp e JOIN dept d ON e.deptno = d.deptno ORDER BY loc;
SELECT loc, count(*) FROM emp e JOIN dept d on e.deptno = d.deptno GROUP BY loc; 
SELECT d.dname,trunc(AVG(sal)) FROM emp e JOIN dept d on e.deptno = d.deptno GROUP BY d.dname;
--dept�� ��������d����ϰ� d.name��������
SELECT dname, avg(sal) AS avgsal FROM emp e JOIN dept d ON e.deptno = d.deptno GROUP BY dname ORDER BY avgsal DESC;
SELECT dname, avg(sal) AS avgsal
FROM emp e 
    JOIN dept d ON e.deptno = d.deptno
GROUP BY dname 
ORDER BY avgsal DESC;
SELECT * FROM (
--emp���̺��� e��� �θ��� ��ģ�ǵ� dept���̺�� dept�� d��� �θ����� e�� deptno���� d�� deptno���� ������
--���ļ� dname�̶� ĭ�� ��������.����� ����Ҳ���
SELECT sal, avg(sal) AS avgsal
FROM emp e 
    JOIN dept d ON e.deptno = d.deptno
GROUP BY dname) WHERE avgsal >= 2000;

SELECT * FROM emp e JOIN dept d ON e.deptno = d.deptno; 
--� ������ �� ���̺��� ���� �� �� ���̺��� Ư�� ���� ���ǿ� ���� ��ġ���� �����ϴ� ���
SELECT * FROM emp;
SELECT * FROM salgrade;

SELECT s.grade, e.*
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.LOSAL AND s.HISAL;
--� ���� ����� �̿��� ���� �ǹ��Ѵ�. � ���ο����� ���� ���ǿ� �ش��ϴ� �� Į���� ���� ������ ��� ��ġ���״�.
SELECT * FROM emp WHERE ename = 'SMITH';
--emp���̺�ȿ� SMITH��� �̸����� �����
SELECT * FROM emp WHERE ename LIKE '%S';
--emp���̺�ȿ� S�� ������ �̸����� �� ���
SELECT * FROM emp WHERE ename = 'SMITH';
SELECT * FROM emp WHERE ename = 'MARTIN';
SELECT * FROM emp WHERE ename IN('SMITH', 'MARTIN');

SELECT lower('ABC') FROM dual;

SELECT ename, substr(ename, 1, 3) FROM emp;
--1.����
SELECT * FROM emp e  JOIN dept d ON e.deptno = d.deptno ORDER BY LOC;
--2.�׷��� ����
SELECT loc FROM emp e  JOIN dept d ON e.deptno = d.deptno GROUP BY loc;
--3.�Լ�
SELECT loc, count(*) FROM emp e  JOIN dept d ON e.deptno = d.deptno GROUP BY loc;

CREATE USER test01 IDENTIFIED BY 1234;
GRANT CONNECT,RESOURCE TO test01;

DROP USER test01 CASCADE;

CREATE test01 IDENTIFIED BY 1234;
--1.USER �κ��� ������.USER ������ �߰���.
CREATE USER test01 IDENTIFIED BY 1234;
--����� ���� ������ ��Ÿ���� USER ��ü ������ �߰���
GRANT RESOURCE TO test01;
--2,������ ����� ���� test01�� DB������ �����ϵ��� CONNECT ROLE�� �߰���,����� �������� �����ϱ� ���� ������ ������
GRANT CONNECT, RESOURCE TO test01;

CREATE TABLE MEMBERS (
   CREATE TABLE MEMBERS (
    MEMBER_ID VARCHAR2(20) PRIMARY key,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(30),
    MEMBER_AGE NUMBER,
    MEMBER_EMAIL VARCHAR2(50),
    PRIMARY KEY(MEMBER_ID),   
);
--3,MEMBERS ���̺� MEBMER_ID Į���� �������� ������ �߸� �ۼ���(CONSTRAINT �տ� ���������̸��� ������.���������� �������� �̸��� ������������.)
--MEMBERS ���̺��� MEBMER_ID Į���� ������ �������� �̸��� �����϶�� ������ �������Ƿ� 'CONSTRAINT'������ �����Ͽ���.
--4.MEMBER ���̺� MEMBER_PWD Į���� ������ NOT NULL ���������� ���̺����� �����Ǿ� �վ��� �̰� �÷� ������ ������
--MEMBER ���̺��� MEMBER_PWD Į���� ������ NOT NULL ���������� ���̺����� �����Ǿ��־ Į�� ������ �����Ͽ���.
CREATE TABLE BOARDS (
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(100),
    BOARD_CONTENT VARCHAR2(4000),
    BOARD_WRITER VARCHAR2(20) REFERENCES MEMBERS(MEMBER_ID),
    BOARD_REG_DATE DATE DEFAULT SYSDATE
);
--5.BOARDS ���̺� BOARD_WRITER Į������ FORIEGEKEY ���� ������ �߸� �ۼ���.(�̹� Į�� �����̹Ƿ� FK ���������� ����� �ʿ䰡 ����. REFERENCES Ű���尡 ������.
--BOARDS ���̺��� BOARD_WRITER Į���� ������ FORIEGN KEY������ REFERENCES�� ����