# 문제 1

## 1.원인
1. 컴럼인덱스는 1부터 시작하는데 0부터 불러오고잇다.
2. 조회된 결과 memo객체에 저장 후 list에 담아야 하지만 담지 않음.
3. 여러 행을 출력하는 쿼리지만 if문을 사용하였기 때문에 상단의 첫 행만 불러와서 저장함.
## 2.조치

1. 코드 수정

public class Dao  구절

m.setNo(rset.getInt(1));

m.setName(rset.getString(2));

m.setMsg(rset.getString(3));

m.setWriteday(rset.getDate(4));      

수>> 0 ,1, 2, 3,4 를 1, 2, 3, 4,로 수정


2. 코드 수정

list.add(m);

3. 코드 수정
   
-if > while문으로 변경

# 문제 2

## 1.원인
1. setInt 메소드에 파라미터 순서 설정 잘못됨(1부터 시작해야됨)
2. rusultSet에서 파라미터 순서가 1번부터이지만 0번부터 시작하고 있음
3. 자원 반환을 하는 코드가 누락됨
4. if(rset.next()){}
## 2.조치
1. setInt 1번으로 수정

```java
pstmt.setInt(1, no);
```

2. rset.getXXXX 파라미터 인덱스 1부터 시작하도록 수정

```java
m = new Memo();
m.setNo(rset.getInt(1));
m.setName(rset.getString(2));
m.setMsg(rset.getString(3));
m.setWriteday(rset.getDate(4));
```

3. 자원 반환 코드를 추가함

```java
try {
    rset.close();
    pstmt.close();
    conn.close();
} catch (SQLException e) {
    e.printStackTrace();
}
```
# 문제 3
## 1.원인

1. DML은 executeUpdate로 실행해야됨. 그러나 executeQuery를 호출하고 있음.
2. Controller에서 변경 성공 여부를 출력하는 부분의 조건이 잘못됨.
3. commit, rollback 제어 안됨
4. 
## 2.조치
1. executeQuery -> executeUpdate
```java
result = pstmt.extcuteUpdate();
```
2. 출력 부분 조건 변경
```java
if(result>0){

}
```
3. commit,rollback 제어 코드 추가
```java
conn.commit();        } catch (ClassNotFoundException | SQLException e) {            e.printStackTrace();            try {                conn.rollback();            } catch (SQLException throwables) {                throwables.printStackTrace();            }        } finally {            try {                pstmt.close();                conn.close();            } catch (SQLException e) {                e.printStackTrace();            }        }
```