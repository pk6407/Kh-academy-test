



# 1.번문제



# 1.1원인

```sql
1. product 테이브에 UNIQUE (serial_no) 를 요구하고 있으나 걸려있지 않음
2. SEQ_BRAND_ID 시퀀스가 MAXVALUE 1000 으로 기술되어 있었지만. 생성시 500으로 생성하고 있었음
3. 애플을 INSERT 하는 부분에서 NEXTVAL 가 아닌 CURRVAL 가 작성되어있음


키워드 UNIQUE , NEXTVAL , CURRVAL , MAXVALUE
```



# 1.2조취

```sql
1. ALTHER TABLE products ADD UNIQUE (serial_no);
2. ALTHER SEQUENCE seq_brand_id MAXVALUE 1000;
3. 시퀀스 CURRAVAL 를 NEXTVAL 로 변경 

키워드 : ALTER , MAXVALUE , CURRVAL ,NEXTVAL
```



## BRANDS 테이블 생성





```sql



CREATE TABLE BRANDS(
    BRAND_ID NUMBER PRIMARY KEY,
    BRAND_NAME VARCHAR2(100) NOT NULL
);
------------------------------------------------- 조취후


```

## PRODUCTS 테이블 생성

```sql
CREATE TABLE PRODUCTS(
    PRODUCT_NO NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(50) NOT NULL,
    PRODUCT_PRICE NUMBER NOT NULL,
    BRAND_CODE NUMBER REFERENCES BRANDS,
    SERIAL_NO VARCHAR2(100),
    SOLD_OUT CHAR(1) DEFAULT 'N' CHECK(SOLD_OUT IN ('Y', 'N'))
);
------------------------------------------------- 조취후
```

## SEQ_BRAND_ID 시퀀스 생성

```sql
CREATE SEQUENCE SEQ_BRAND_ID
START WITH 100
INCREMENT BY 100
MAXVALUE 500
NOCYCLE;
------------------------------------------------- 조취후
```

## SEQ_PRODUCT_NO 시퀀스 생성

```sql
CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 10000
NOCYCLE;
------------------------------------------------- 조취후
```





## BRANDS 테이블 데이터 삽입



```sql
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '삼성');
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.CURRVAL, '애플');
------------------------------------------------- 조취후
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '삼성');
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '애플');
```

## PRODUCTS 테이블 데이터 삽입



```sql
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S8', 800000, 100, 'S8','Y');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S9', 900000, 100, 'S9','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S10', 1000000, 100, 'S10','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰9S', 900000, 200, '9S','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰10S', 1000000, 200, '10S','N');

---------------------------------------------------------------------------------- 조취후


```

# 2.번 문제 






# 2.1원인

```sql
1.product 테이블에서 sold_out이 DEFAULT가 'N'으로 정의되어 있엇으나, DEFAULT 값을 설정을 안햇음.

2.seq_product_no 시퀀스 시작값(start with)이 1이고, 증가값(increment by)이 1으로 정의하기로 햇으나, 100, 100으로 생성을 햇음.

3.products 테이블에서 serial_no는 UNIQUE 제약조건이 걸려있지만,INSERT 부분에서 중복되는 값을 입력함.
```
# 2.2조치

```sql
1.ALTER TABLE products MODIFY (sold_out DEFAULT 'N');
SELECT * FROM products;
UPDATE products SET sold_out = 'N' WHERE sold_out IS NULL;

2.ALTER SEQUENCE seq_prodeuct_no INCREMENT BY 1;

3.중복되지 않는 값으로 변경.
INSERT INTO prodeucts VALUES (seq_product_no NEXTVAL, '아이폰10s', 100000, 200, '10s', DEFAULT);
```
## BRANDS 테이블 생성
```sql
CREATE TABLE BRANDS(
    BRAND_ID NUMBER PRIMARY KEY,
    BRAND_NAME VARCHAR2(100) NOT NULL
);
```
## PRODUCTS 테이블 생성
```sql
CREATE TABLE PRODUCTS(
    PRODUCT_NO NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(50) NOT NULL,
    PRODUCT_PRICE NUMBER NOT NULL,
    BRAND_CODE NUMBER REFERENCES BRANDS,
    SERIAL_NO VARCHAR2(100) UNIQUE,
    SOLD_OUT CHAR(1) CHECK(SOLD_OUT IN ('Y', 'N'))
);
```
## SEQ_BRAND_ID 시퀀스 생성
```sql
CREATE SEQUENCE SEQ_BRAND_ID
START WITH 100
INCREMENT BY 100
MAXVALUE 1000
NOCYCLE;
```
## SEQ_PRODUCT_NO 시퀀스 생성
```sql
CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 100
INCREMENT BY 100
MAXVALUE 10000
NOCYCLE;
```
## BRANDS 테이블 데이터 삽입
```sql
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '삼성');
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '애플');
```
## PRODUCTS 테이블 데이터 삽입
```sql
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S8', 800000, 100, 'S8', 'Y');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S9', 900000, 100, 'S9',DEFAULT);
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S10', 1000000, 100, 'S10',DEFAULT);
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰9S', 900000, 200, '9S',DEFAULT);
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰10S', 1000000, 200, 'S10',DEFAULT);
```

# 3.번문제

## 3.1원인
```sql
1.테이블 정의서에는 products 테이블에서 products_name 컴럼이 NN 제약조건이 있다고 표시되어 있느나, 설정하지 않음(요구사항 불충족)
2.brands 테이블에 삼성 입력시 nextval이 아닌 currval가 insert됨.
3.producst 테이블의 FK 제약조건을 위배함. 부모 테이블에 참조할 행이 존재하지 않음.(300)
```
## 3.2조치
```sql
1.ALTER TABLE prodects MODIFY product_name NOT NULL;
2.currval - > nextval
3.존재하는 부모 테이블의 행을 참조하던가, 삭제하던가.
```

## BRANDS 테이블 생성
```sql
CREATE TABLE BRANDS(
    BRAND_ID NUMBER PRIMARY KEY,
    BRAND_NAME VARCHAR2(100) NOT NULL
);
```
## PRODUCTS 테이블 생성
```sql
CREATE TABLE PRODUCTS(
    PRODUCT_NO NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(50),
    PRODUCT_PRICE NUMBER NOT NULL,
    BRAND_CODE NUMBER REFERENCES BRANDS,
    SERIAL_NO VARCHAR2(100) UNIQUE,
    SOLD_OUT CHAR(1) DEFAULT 'N' CHECK(SOLD_OUT IN ('Y', 'N'))
);
```
## SEQ_BRAND_ID 시퀀스 생성
```sql
CREATE SEQUENCE SEQ_BRAND_ID
START WITH 100
INCREMENT BY 100
MAXVALUE 1000
NOCYCLE;
```
## SEQ_PRODUCT_NO 시퀀스 생성
```sql
CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 10000
NOCYCLE;
```
## BRANDS 테이블 데이터 삽입
```sql
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.CURRVAL, '삼성');
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '애플');
```
## PRODUCTS 테이블 데이터 삽입
```sql
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S8', 800000, 100, 'S8', 'Y');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S9', 900000, 100, 'S9',DEFAULT);
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S10', 1000000, 100, 'S10',DEFAULT);
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰9S', 900000, 200, '9S',DEFAULT);
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰10S', 1000000, 300, '10S',DEFAULT);
```

```java
package org.example;

public class APPlication{

    public static void main(String [] args){
        double s = 0;
        for(int i = 0; i < 100; i++){
            s += 0.01;
        }
        System.out.println(s);
    }
    //가변인자
    public static void test(String [] args){
        for(String arg : args){
            System.out.println(arg);
        }
    }
}

# 123을 10진법으로 표현

123 % 10 = 3
12 % 10 = 2
1 % 10 = 1

# 123을 2진법으로 표현

123 % 2 : 61,1
61 % 2 : 30,1
30 % 2 : 15,0
15 % 2 : 7,1
7 % 2 : 3,1
3 % 2 : 1,1
1 % 2 : 0,1
------------------------------------------
1111011

# 0.45 - 10진수

0.45 * 10 - 정수 : 4, 소수 : 0.5
0.5 * 10 - 정수 : 5, 소수 : 0

# 0.45 - 2진수

0.45 * 2 - 0.9(0)
0.9 * 2 - 1.8(1)
0.8 * 2 - 1.6(1)
0.6 * 2 - 1.2(1)
0.2 * 2 - 0.4(0)
0.4 * 2 - 0.8(0)
0.8 * 2 - 1.6(1)
-------------------------------------------
0111001...

1111011(123)
01110011...(0.45)
```
# 객체지향




# 상속

코드 재사용을 목적으로 사용하면 발생할 수 있는 문제

1. 불필요한 인터페이스 상속
2. 메서드 오버라이딩
 - > 원래 노출된 의도랑 동작이 변경됨
 3. 부모 클래스 와 코드를 공유하기 때문에 변경에 의한 사이드이펙트가 자식에게 전파
 4. 부모 클래스가 노출 - > 캡슐화 

 # 코드 재사용이 목적이라면:
 - 상속보다는 합성(car예제)을 사용
 - 합성관계 - > 동적으로 객체를 결정 할 수 있다.(실행시간)

# 그렇다면 상속이 필요한 것은?
 타입이 계층적으로 표현될 때
 ex)
 메가커피의 상품
 -커피
 -스무디
 -케이크

 # 클래스 선언
접근제한자 class 클래스명(){
    변수지정 변수명;
    메소드()
}

 접근지정자:언어 레벨에서 캡슐화(스코프 제한)
 -private : 객체 내부에서만 접근 가능
 - protected : 패키지 내부에서만 접근 가능
 - public : 모든 패키지 및 클래스에서 접근 가능

 한정자(modifier)
 -static : 클래스에 소속시킨다.
 ABC.method();
 -final : 확장/변경 불가능
 1.클래스 : 이 클래스를 상속하지 말 것
 2.상수
 -abstract : 추상 클래스 / 메서드

 ## 생성 방법
 final Object obj = new Object;

 ## 메소드
- 이름
- 시그니처
    - 메소드 이름
    - 파라미터 목록
- 바디

## 가변인자

method(타입 ....파라미터);
