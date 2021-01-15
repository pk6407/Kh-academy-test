# 1교시

- Spring AOP(관점지향 프로그래밍)
    - 앱만들때 Marketlpace 에서 windowBuilder 써라 1.9.4 이거 

pom.xml 의 역할 - 버전 관리 수동

어제한거 복습햇음 세팅..

di_step1 -> 의존성100% 
di_step2 -> 의존성 다운
di_step3 -> Assmbler
di_step4 -> spring DI (xml)
di_step5 -> 응용(의존성 주입(생성자 주입[이것만햇다.],메서드를 통한 주입[이건오늘한다.]))

```xml
 <bean id='db' class='di_step5.MyDB'/>
      <bean id='dao' class='di_step5.MemberDao'>
      	<constructor-arg ref="db"/>
```

<bean id='db' class='di_step5.MyDb'/>이거는 di_step5.MYDB를 db라고 한다.

# 2교시

```filer
di_step6

- xml파일을 사용하여 프로젝트에 필요한 bean들을 등록한다.
- 의존성 주입(메서드를 통한 주입)을 구현한다.
```

```java
package di_step6;

import java.util.ArrayList;
import java.util.List;

//개발자 박씨
public class Database implements DB{

	@Override
	public List<String> select(String findStr) {
		List<String> aaa = new ArrayList<String>();
		aaa.add("오라클에서 처리된 결과.");
		
		
		return aaa;
	}

	@Override
	public String insert(String mid, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(String mid, int serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String mid, String pwd, int serial) {
		// TODO Auto-generated method stub
		return 0;
	}

}
```

```interface
package di_step6;

import java.util.List;

public interface DB {
	public List<String> select(String findStr);
	public String insert(String mid, String pwd);
	public String update(String mid, int serial);
	public int delete(String mid, String pwd, int serial); 
}
```

```java
package di_step6;

public class MemberDao {
	DB db;
	
	// 생성자를 통한 주입
	
	public MemberDao() {}
	public MemberDao(DB db) {
		this.db = db;
	}

	public DB getDb() {
		return db;
	}

	public void setDb(DB db) {
		this.db = db;
		System.out.println("메서드를 통해 주입 받음...........");
		System.out.println(db.select(""));
	}
	
}

```

```java
package di_step6;

import java.util.List;
import java.util.Vector;

public class MyDB implements DB{

	List<String> kkk = new Vector<String>();
	@Override
	public List<String> select(String findStr) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert(String mid, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(String mid, int serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String mid, String pwd, int serial) {
		// TODO Auto-generated method stub
		return 0;
	}

}
```

```java
package di_step6;

import java.util.ArrayList;
import java.util.List;

//개발자 김씨
public class OracleDB implements DB{
	String r = null;
	@Override
	public List<String> select(String findStr) {
		List<String> list = new ArrayList<String>();
		r = "오라클에서 검색됨.";
		list.add(r);
		return list;
	}

	@Override
	public String insert(String mid, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(String mid, int serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String mid, String pwd, int serial) {
		// TODO Auto-generated method stub
		return 0;
	}

}
```

```java
package di_step6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext  context =
				new FileSystemXmlApplicationContext("src/di_step6/di_step6.xml");
		
			MemberDao dao = context.getBean("dao",MemberDao.class);
	}

}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd">
      
      
      <bean id='db' class='di_step6.MyDB'/>
      <bean id='dao' class='di_step6.MemberDao'>
      	<property name="db" ref='db'/>
      </bean>


</beans>
```

- DI를 구현하는 방법
  - 생성자를 통한 주입
  - 메서드를 통한 주입
  - xml를 사용하지 않고 annotation으로 지정하는 방법
    - byName
    - byType
    - autowired
* 주의할점 : 등록된 빈의 유형 동일한 요소가 있으면 오류생김 *

```filet
di_anno

- 의존성 주입을 xml로 작업하지 않고 annotation으로 작업
  1) byName
  2) byType
  3) autowired
```

```java
package di_anno;

import java.util.ArrayList;
import java.util.List;

//개발자 박씨
public class Database implements DB{

	@Override
	public List<String> select(String findStr) {
		List<String> aaa = new ArrayList<String>();
		aaa.add("오라클에서 처리된 결과.");
		
		
		return aaa;
	}

	@Override
	public String insert(String mid, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(String mid, int serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String mid, String pwd, int serial) {
		// TODO Auto-generated method stub
		return 0;
	}

}
```

```interface
package di_anno;

import java.util.List;

public interface DB {
	public List<String> select(String findStr);
	public String insert(String mid, String pwd);
	public String update(String mid, int serial);
	public int delete(String mid, String pwd, int serial); 
}
```

```java
package di_anno;

import java.util.List;
import java.util.Vector;

public class MyDB implements DB{

	List<String> kkk = new Vector<String>();
	@Override
	public List<String> select(String findStr) {
		System.out.println("오라클DB에서 출력됨.");
		return kkk;
	}

	@Override
	public String insert(String mid, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(String mid, int serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String mid, String pwd, int serial) {
		// TODO Auto-generated method stub
		return 0;
	}

}
```

```java
package di_anno;

import java.util.ArrayList;
import java.util.List;

//개발자 김씨
public class OracleDB implements DB{
	String r = null;
	@Override
	public List<String> select(String findStr) {
		List<String> list = new ArrayList<String>();
		r = "오라클에서 검색됨.";
		list.add(r);
		return list;
	}

	@Override
	public String insert(String mid, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(String mid, int serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String mid, String pwd, int serial) {
		// TODO Auto-generated method stub
		return 0;
	}

}
```

```java
package di_anno;

import org.springframework.beans.factory.annotation.Autowired;

public class MemberDao {
	DB db;

	public MemberDao() {}
	
	@Autowired
	public MemberDao(DB db) {
		this.db = db;
	}

	public DB getDb() {
		return db;
	}

	public void setDb(DB db) {
		this.db = db;
		System.out.println("메서드를 통해 주입 받음...........");
		System.out.println(db.select(""));
	}
	
}
```

```java
package di_anno;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext  context =
				new FileSystemXmlApplicationContext("src/di_anno/di_anno.xml");
		
			MemberDao dao = context.getBean("dao",MemberDao.class);
	}

}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd">
      
      
      <bean id='db' class='di_anno.MyDB'/>
      <bean id='dao' class='di_anno.MemberDao' autowire="byName"/>


</beans>
```

- db
  - byName ok
  - byType ok
- other
  - byName No
  - bytype ok

- autowire="constructor" 생성자 기준
- autowire="byName/ byType" 메서드명/메서드타입 기준

# 점심후 4교시

AOP 용어
1) Aspect: 공통 사항,핵심 사항
2) Weaving: 분리된 관심사(Advice)를 적용하는 행위
3) Advice: 분리된 관심사
   1) Before Advice *중요
   2) After Returning Advice *중요
   3) After Throwing Advice
   4) Introduction
   5) Around Advice *중요
4) Joinpoint(PointCut): Advice가 적용되는 시점.
5) Advisor:Spring에서만 나오는 개념.Advice들의 묶음.

Aspect <- library

```file
aop_step1

로그를 출력해야 하는 과정의 모든 프로그램에 있어야 하기 때문에 모든 개발자는 로그를
출력하기 위한 코드를 작성해야만 한다.
```

```interface
package aop_step1;

public interface Log {
	public String logOut();
}
```

```java
package aop_step1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberDao implements Log{
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
	
	public MemberDao() {
		System.out.println(logOut());
	}
	
	@Override
	public String logOut() {
		String r = sdf.format(new Date());
		return r;
	}
	
}
```

# 5교시

```java
package aop_step1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDao implements Log{

	public BoardDao() {
		System.out.println(logOut());
	}
	
	@Override
	public String logOut() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
	}
}
```

```java
package aop_step1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SaleDao implements Log{
	public SaleDao() {
		System.out.println(logOut());
	}
	
	@Override
	public String logOut() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String rst = sdf.format(new Date());
		return rst;
	}
	
}

```

```java
package aop_step1;

public class Main {
	public Main() {
		BoardDao bDao = new BoardDao();
		MemberDao mDao = new MemberDao();
		SaleDao sDao = new SaleDao();
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
```

2021-01-15 -> BoardDao 출력
2021-01-15(금) 02:51:34:803 -> MemberDao 출력
2021-01-15 02:51:34 -> SaleDao 출력

이런식으로 출력된다 4~5교시 코드들이

# 6~7 교시

aop_Step2

```file
aop_step2

로그를 출력해야 하는 과정의 모든 프로그램에 있어야 하기 때문에 모든 개발자는 로그를
출력하기 위한 코드를 작성해야만 한다.

--> 횡단적으로 분포되어 있는 로그출력부분을 (관심사, 관점, 관심) 분리하여 별도의 Advice 클래스를 구성.
```

```java
package aop_step2;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Advice {
	Dao dao;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
	public Advice(Dao dao) {
		this.dao = dao;
	}
	
	
	public String logOut() {
		String r = sdf.format(new Date());
		
		return r;
	}
	
	public String before() { //Before Advice
		String log = logOut();
		System.out.println(log);
		
		String r = dao.delete();
		System.out.println(r);
		return r;
	}
	
	public String after() { //after Advice
		String r = dao.delete();
		System.out.println(r);
		
		String log = logOut();
		System.out.println(log);
		
		return r;
	
	}
	
	public void around() {
		String log = logOut();
		System.out.println(log);
		
		String r = dao.delete();
		System.out.println(r);
		
		String log2 = logOut();
		System.out.println(log2);

	
	
	}
	
	
	
}
```

```java
package aop_step2;

import java.util.List;

public class BoardDao implements Dao{

	public BoardDao() {
	}

	@Override
	public List<String> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert() {
		return "BoardDao.insert()";
	}

	@Override
	public String update() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String repl() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
```

```interface
package aop_step2;

import java.util.List;

public interface Dao {
	public List<String> select();
	public String insert();
	public String update();
	public String delete();
	public String repl();
}
```

```interface
package aop_step2;

public interface Log {
	public String logOut();
}
```

```java
package aop_step2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop_step2/aop_step2.xml");
		Advice advice = (Advice)context.getBean("advice");
		advice.around();
	}
	
	public static void main(String[] args) {
		new Main();
	}
}

```

```java
package aop_step2;

import java.util.List;

public class MemberDao implements Dao{
	
	public MemberDao() {
	}

	@Override
	public List<String> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() {
		return "MemberDao.update()";
	}

	@Override
	public String delete() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String repl() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
```

```java
package aop_step2;

import java.util.List;

public class SaleDao implements Dao{
	
	public SaleDao() {
	}

	@Override
	public List<String> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete() {
		return "SaleDao.delete()";
	}

	@Override
	public String repl() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd">
      

      <bean id="bDao" class="aop_step2.BoardDao"/>
      <bean id="mDao" class="aop_step2.MemberDao"/>
      <bean id="sDao" class="aop_step2.SaleDao"/>
      (DI 의존성 주입) 
      <bean id='advice' class='aop_step2.Advice'>	
      	<constructor-arg ref="bDao"/> // ref안에 부분을 바꾸고
      </bean>


</beans>
```

# 마지막 교시

```file
aop example

- interface Dao (void seletc())
- dao를 구현한 클래스 : BoardDao, MemberDao, SaleDao
- Advice : 로그인 된 상태라면 mid변수에 임의의 값이 저장되어 있고, 로그인 되지 않았다면 null 값이 대입되어 있다고
	가정하고, dao의 select 메서드를 실행하기전에 로그인 여부를 체크하여
	로그인 된 상태라면 "select ok..."를, 로그인 되지 않았다면 "로그인 필요" 문자를 출력하시오.
	
* 모든 dao의 select()메서드가 실행되기전 로그인 여부를 판단하여 적당한 실행결과를 출력.
```

```java
package aop_exam1;

public class Advice implements LogIn{
	Dao dao;
	public Advice(Dao dao) {
		this.dao = dao;
	}
	
	@Override
	public boolean loginCheck() {
		// 로그인 되어 있는 상태 mid="hong";
		return true;
	}
	
	public void before() { //Before Advice
		String r = "";
		if(loginCheck()) {
			System.out.println("로그인 되었습니다.");
			dao.select();
		}else {
			System.out.println("로그인이 필요합니다.");
		}
	}
}
```

```java
package aop_exam1;

public class BoardDao implements Dao{

	public BoardDao() {
	}

	@Override
	public void select() {
		System.out.println("BoardDao.select()");
	}
	
}
```

```interface
package aop_exam1;

public interface Dao {
	public void select();
}
```

```interface
package aop_exam1;

public interface LogIn {
	public boolean loginCheck();
}
```

```java
package aop_exam1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop_exam1/aop_exam1.xml");
		Advice advice = (Advice)context.getBean("advice");
		advice.before();
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
```

```java
package aop_exam1;

public class MemberDao implements Dao{
	
	public MemberDao() {
	}

	@Override
	public void select() {
		System.out.println("MemberDao.select()");
	}
}
```

```java
package aop_exam1;

public class MemberDao implements Dao{
	
	public MemberDao() {
	}

	@Override
	public void select() {
		System.out.println("MemberDao.select()");
	}
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd">
      

      <bean id="bDao" class="aop_exam1.BoardDao"/>
      <bean id="mDao" class="aop_exam1.MemberDao"/>
      <bean id="sDao" class="aop_exam1.SaleDao"/>
       
      <bean id='advice' class='aop_exam1.Advice'>	
      	<constructor-arg ref="bDao"/>
      </bean>

</beans>
```

