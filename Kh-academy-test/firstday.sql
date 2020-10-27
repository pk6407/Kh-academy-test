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
VALUES ('김남호', '01050303181', 'asdasd1478@naver.com', 28, 'N');
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
VALUES ('주호민', '1234', 'adad@dsdf.com', 30, 1);

INSERT INTO student_info(name, phone, email, age, department_id)
VALUES ('이병건', '1234', 'adad@dsdf.com', 30, 2);

INSERT INTO student_info(name, phone, email, age, department_id)
VALUES ('짐작맨', '1234', 'adad@dsdf.com', 30, 2);

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

INSERT INTO residence(id, name, nation) VALUES('열정맨','주호민','부천시');
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

INSERT INTO residence(r_id, r_name,r_nation) values ('1','서울','한국');
INSERT INTO residence(r_id, r_name,r_nation) values ('2','상해','중국');
INSERT INTO residence(r_id, r_name,r_nation) values ('3','도쿄','일본');

INSERT INTO student_info2(name,phone,email,age,fired,department_id,residence_id)
values ('김종구','1234','hey0507@naver.com',29,'Y',1,3);
INSERT INTO student_info2(name,phone,email,age,fired,department_id,residence_id)
values ('김종팔','1234','hey0507@naver.com',39,'N',1,2);
INSERT INTO student_info2(name,phone,email,age,fired,department_id,residence_id)
values ('김종칠','4321','hey3507@naver.com',49,'N',2,3);

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
VALUES('주펄', '123', 'ab', 11, 'N', 1, 2);

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

INSERT INTO user_account(id, name, email, location) VALUES (1, '주호민', 'a@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) VALUES (2, '이병건', 'b@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) VALUES (3, '무엇', 'n@b.com', 'seoul');


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
-- 마이너스 2번하면 주석처리,emp안에 job창에 SALESmAN하고 SAL창의 1500이상 만 출력

SELECT * FROM emp WHERE job IN ('PRESIDENT','SALESMAN');
-- JOB창에서 SALESMAN과 PRESIDENT에 포함된 값들을 출력

SELECT * FROM emp WHERE sal BETWEEN  1000 AND 1500;
-- SAL창에 1000이상 1500이하 에 포함된 값들을 출력

SELECT * FROM emp;
SELECT * FROM emp WHERE ename LIKE 'ON%';
-- LIKE라는 명령어는 검색기능
 
SELECT * FROM user_account;

SELECT * FROM user_account WHERE name LIKE '이%';
-- WHERE LIKE 사이에 창의 이름 LIKE뒤에 검색할 이름

INSERT INTO user_account(id, name, email, location) VALUES (1, '이적', 'a@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) VALUES (2, '이이', 'a@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) VALUES (3, '이삼', 'a@b.com', 'seoul');
INSERT INTO user_account(id, name, email, location) VALUES (4, '이사', 'a@b.com', 'seoul');

SELECT * FROM emp WHERE NOT comm IS NULL;
-- WHERE은 조건,WHERE뒤에 조건이되는식을 작성

SELECT *FROM emp UNION ALL SELECT * FROM emp;
--UINON할때 주의점 열이 같아야되고 자료형타입이 같아야함 
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
--모두 소문자로 변경
SELECT length(ename) FROM emp;
-- 문자열 길이 출력
SELECT * FROM (SELECT * FROM emp);

SELECT ename, substr(ename, 2, 4)FROM emp;
--ename 이라는 창에서 ename값에든 것들을 2번째 4번째 문자 제외후 출력
SELECT ename, instr(ename, 'L') FROM emp;
--ename창에 들어가잇는 값들중 L이 몇번 들어갓나 출력
SELECT ename, replace(ename, 'AR', '') FROM emp;
--ename창에 들어가잇는 값들중에 AR이라는 문자가잇으면 공백으로 바꾸고 출력
SELECT RPAD('121212-', 14, '*') FROM DUAL;
--RPAD이란 창안에 121212-출력후 14칸만큼 *붙여넣기(1,2,3,4,5,6,7칸에 값이 들어가잇으니 그대로 냅두고 빈칸에 *입력)
--PAD(선택할열,채울글자수,채울문자),PAD앞에L이면 왼쪽부터,PAD앞에 R이면 오른쪽부터
SELECT concat(ename, job) FROM emp;
--concat(선택할열1,선택할열2)
SELECT round(3.1415926535) FROM dual;
--round(선택할 열(혹은 값)),소수점 버림
SELECT trunc(3.1415926535, 2) FROM dual;
--trunc(선택할 열, 몇번째 이후로 버릴것인지)
SELECT mod(15, 2) FROM dual;
--mod(나눠질값, 나눌값),자바%연산자와 동일
SELECT SYSDATE AS now,
       SYSDATE - 1 AS yesterday,
       SYSDATE + 1 AS tomorrow,
       (SYSDATE + 1) - (SYSDATE -1) AS offset
FROM DUAL;
--시스템 데이트에 날짜 오늘,어제,내일 출력
CREATE TABLE dummy(
id number not null,
current_time timestamp default sysdate
);
INSERT INTO dummy(id) VALUES(10);
SELECT * FROM dummy;
--id에 10이라고 삽입하고 현재시간 출력
SELECT add_months(SYSDATE, 3) FROM DUAL;
--현재 날짜에서 3달 플러스한 값 출력
SELECT next_day(SYSDATE, '월요일')FROM DUAL;
--next_day(날짜타입의 열(혹은 값),'월~일요일')

SELECT TO_CHAR(SYSDATE, 'CC YYYY/MM/DD HH24:MI:SS') FROM DUAL;
--TO_CHAR(날짜,포맷문자열),CC = 세기,YYYY = 연도, MM = 월, DD = 일 , HH24 = 24시표기, MI = 분, SS = 초
SELECT * FROM emp;
SELECT ename, nvl2(comm, '커미션존재', '커미션없음') as 커미션존재여부 FROM emp;
--nv12(선택할 열, NULL이 아닌 경우 출력할 값, NULL인 경우 출력할 값); 
SELECT sal FROM emp;
SELECT ename, sal,
CASE
    WHEN sal >= 500 AND 1000 > sal THEN '500이상 1000미만'
    WHEN sal >= 1000 AND 1500 > sal THEN '1000이상 1500미만'
    WHEN sal >= 1500 AND 2000 > sal THEN '1500이상 2000미만'
    WHEN sal >= 200 AND 5000 > sal THEN '2000이상 2500미만'
END as range
FROM emp; 
--500이상 1000미만조건 확인후 출력
--ename,sal입력값 불러오고,case(조건안에)WHEN 값 비교할 값크기 THEN,END끝맞치고 as해당조건값에 을 range라는 창에 표시
SELECT sum(sal) FROM emp;
SELECT count(comm) FROM emp;
--sum(선택할열)
--count(선택할열)
SELECT avg(sal) FROM emp;
SELECT sum(sal) / count(*) FROM emp;
--sal의 평균구하는거
SELECT *FROM emp ORDER BY job;

SELECT avg(sal) FROM emp WHERE job = 'MANAGER';

SELECT job FROM emp GROUP BY job;
--job에 emp 를 (그룹화)묶겟다
SELECT job, avg(sal) as avgsal FROM emp GROUP BY job ORDER BY avgsal DESC;

SELECT * FROM emp;
SELECT * FROM dept;

SELECT * FROM emp e JOIN dept d ON e.deptno = d.deptno ORDER BY loc;
SELECT loc, count(*) FROM emp e JOIN dept d on e.deptno = d.deptno GROUP BY loc; 
SELECT d.dname,trunc(AVG(sal)) FROM emp e JOIN dept d on e.deptno = d.deptno GROUP BY d.dname;
--dept를 참조변수d라고하고 d.name가져오고
SELECT dname, avg(sal) AS avgsal FROM emp e JOIN dept d ON e.deptno = d.deptno GROUP BY dname ORDER BY avgsal DESC;
SELECT dname, avg(sal) AS avgsal
FROM emp e 
    JOIN dept d ON e.deptno = d.deptno
GROUP BY dname 
ORDER BY avgsal DESC;
SELECT * FROM (
--emp테이블을 e라고 부르고 합친건데 dept테이블과 dept를 d라고 부를꺼야 e의 deptno값이 d의 deptno값과 같으면
--합쳐서 dname이란 칸에 넣을꺼야.평균을 출력할꺼야
SELECT sal, avg(sal) AS avgsal
FROM emp e 
    JOIN dept d ON e.deptno = d.deptno
GROUP BY dname) WHERE avgsal >= 2000;

SELECT * FROM emp e JOIN dept d ON e.deptno = d.deptno; 
--등가 조인은 각 테이블의 연결 후 각 테이블의 특정 열을 조건에 따라 일치시켜 선정하는 방식
SELECT * FROM emp;
SELECT * FROM salgrade;

SELECT s.grade, e.*
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.LOSAL AND s.HISAL;
--등가 조인 방식의 이외의 것을 의미한다. 등가 조인에서는 조인 조건에 해당하는 두 칼럼의 값이 동일한 경우 일치시켰다.
SELECT * FROM emp WHERE ename = 'SMITH';
--emp테이블안에 SMITH라는 이름가진 값출력
SELECT * FROM emp WHERE ename LIKE '%S';
--emp테이블안에 S로 끝나는 이름가진 값 출력
SELECT * FROM emp WHERE ename = 'SMITH';
SELECT * FROM emp WHERE ename = 'MARTIN';
SELECT * FROM emp WHERE ename IN('SMITH', 'MARTIN');

SELECT lower('ABC') FROM dual;

SELECT ename, substr(ename, 1, 3) FROM emp;
--1.조인
SELECT * FROM emp e  JOIN dept d ON e.deptno = d.deptno ORDER BY LOC;
--2.그룹의 기준
SELECT loc FROM emp e  JOIN dept d ON e.deptno = d.deptno GROUP BY loc;
--3.함수
SELECT loc, count(*) FROM emp e  JOIN dept d ON e.deptno = d.deptno GROUP BY loc;

CREATE USER test01 IDENTIFIED BY 1234;
GRANT CONNECT,RESOURCE TO test01;

DROP USER test01 CASCADE;

CREATE test01 IDENTIFIED BY 1234;
--1.USER 부분이 누락됨.USER 문구를 추가함.
CREATE USER test01 IDENTIFIED BY 1234;
--사용자 계정 생성을 나타내는 USER 객체 지정을 추가함
GRANT RESOURCE TO test01;
--2,생성된 사용자 계정 test01로 DB접속이 가능하도록 CONNECT ROLE을 추가함,사용자 계정으로 접속하기 위한 권한이 누락됨
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
--3,MEMBERS 테이블에 MEBMER_ID 칼럼의 제약조건 구문이 잘못 작성됨(CONSTRAINT 앞에 제약조건이름이 누락됨.문제에서는 제약조건 이름을 제시하지않음.)
--MEMBERS 테이블의 MEBMER_ID 칼럼에 별도의 제약조건 이름을 설정하라는 문장이 없엇으므로 'CONSTRAINT'문구를 삭제하였다.
--4.MEMBER 테이블에 MEMBER_PWD 칼럼에 설정된 NOT NULL 제약조건이 테이블레벨로 설정되어 잇엇다 이걸 컬럼 레벨로 변경함
--MEMBER 테이블의 MEMBER_PWD 칼럼에 설정된 NOT NULL 제약조건이 테이블레벨로 설정되어있어서 칼럼 레벨로 변경하였음.
CREATE TABLE BOARDS (
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(100),
    BOARD_CONTENT VARCHAR2(4000),
    BOARD_WRITER VARCHAR2(20) REFERENCES MEMBERS(MEMBER_ID),
    BOARD_REG_DATE DATE DEFAULT SYSDATE
);
--5.BOARDS 테이블에 BOARD_WRITER 칼럼에서 FORIEGEKEY 제약 조건이 잘못 작성됨.(이미 칼럼 레벨이므로 FK 제약조건을 사용할 필요가 없음. REFERENCES 키워드가 누락됨.
--BOARDS 테이블에서 BOARD_WRITER 칼람에 설정된 FORIEGN KEY문구를 REFERENCES로 변경