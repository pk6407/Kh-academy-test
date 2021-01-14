# 1교시

- spring 설치 및 DI
    - spring 설치
      - Spring 설치 or Spring Boot 설치

- 설치 : 
  - Spring plugln 설치(이클립스 market place)
  - 이클립스에서 Dynamic Web Project를 새로 생성
  - Project유형을 maven 형태로 변경
  - spring에 필요한 각종 dependency추가(mvnrepository.com[각종 libray를 가져올수있다. *spring뿐만 아니라 다른 용도의 libray도])

# 2교시

Dynamic Web project생성

project 오른쪽 클릭후 configure눌러서 Convert Maven project 눌러라~

- https://mvnrepository.com/search?q=spring 검색 ㄱ
  - Spring Context 선택
  - 5.2.12.RELEASE 선택
    - Maven 반자동
    - Gradle 자동
  - 상단메뉴 바에 project에서 BuildAutomatically 클릭 되잇는지 보고 클릭한다
  - 프로젝트 오른쪽 클릭후 Run As 후 Maven install 클릭
  - 프로젝트 오른쪽 클릭후 Maven 후 update project 클릭

* 취업 상담 : 2/15~2/18(1:30 ~ 4:20)
* 취업 특강 : 2/1

```file
di_step1

개발자 별로 Database 연결하는 프로그램을 개발하여 사용.
-개발자의 성향대로 개발 코드가 만들어질것이다.
-공통모듈으로써의 사용상 어려움이 발생.
```

```java
package di_step1;

// 개발자 김씨의 코드
public class OracleDB {
	String databaseName = "오라클에서 검색됨.";
	
	public String find() {
		return databaseName;
	}
}
```

```java
package di_step1;

// 개발자 박씨
public class Database {
	String dbName = "오라클에서 처리된 결과.";
	
}
```

# 3교시

```file
di_step1

개발자 별로 Database 연결하는 프로그램을 개발하여 사용.
-개발자의 성향대로 개발 코드가 만들어질것이다.
-공통모듈으로써의 사용상 어려움이 발생.
-비즈니스를 처리하는 코드내부에서 new 연산자를 사용하여 객체를 생성해서
사용함으로 의존성이 강하게 묶여 있다.
```

```java
package di_step1;

// 개발자 김씨의 코드
public class OracleDB {
	String databaseName = "오라클에서 검색됨.";
	 
	public String findResult() {
		return databaseName;
	}
}
```

```java
package di_step1;

// 개발자 박씨
public class Database {
	String dbName = "오라클에서 처리된 결과.";

	public String select() {
		return dbName;
	}
}
```

```java
package di_step1;

// 개발자 이씨
public class MyDB {
	String db = "오라클에서 검색된 결과입니다.";
	
	public void search() {
		System.out.println(db);
	}
}
```

```java
package di_step1;

//개발자 팀장의 코드
public class Main {

	public Main() {
		String r = null;
		// 개발자 김씨
		OracleDB kim = new OracleDB();
		r = kim.findResult();
		System.out.println(r);
		
		// 개발자 박씨
		Database park = new Database();
		r = park.select();
		System.out.println(r);
		
		// 개발자 이씨
		MyDB lee = new MyDB();
		lee.search();
		
	}
	public static void main(String[] args) {
		new Main();

	}

}
```

```file
step1에서 발생 문제
- 메서드명과 반환형의 종류가 일치하지 않는다. --> 통일
```

```interface
package di_step2;

import java.util.List;

public interface DB {
	public List<String> select(String findStr);
	public String insert(String mid, String pwd);
	public String update(String mid, int serial);
	public int delete(String mid, String pwd, int serial); 
}
```

```java
package di_step2;

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
package di_step2;

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

```java
package di_step2;

import java.util.List;

public class MyDB implements DB{

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

# 점심먹고 4교시

```file
step1에서 발생 문제
- 메서드명과 반환형의 종류가 일치하지 않는다. --> 통일
```

```java
package di_step2;

import java.util.List;

public interface DB {
	public List<String> select(String findStr);
	public String insert(String mid, String pwd);
	public String update(String mid, int serial);
	public int delete(String mid, String pwd, int serial); 
}
```

```java
package di_step2;

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
package di_step2;

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

```java
package di_step2;

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
package di_step2;

public class Main {

	public Main() {
		// 김씨
		OracleDB db = new OracleDB();
		System.out.println(db.select("kim"));
		
		// 박씨
		Database db2 = new Database();
		System.out.println(db2.select("park"));
		
		// 이씨
		MyDB db3 = new MyDB();
		System.out.println(db3.select("lee"));
	
	}
	
	public static void main(String[] args) {
		new Main();

	}

}
```

# 5교시

```filer
------------------
di_step3
------------------

di_step2에서는 interface를 만들면서 작업의 표준화(일관성)을 유지했으나 특정 클래스 내부에서
new 연산자를 사용하여 객체를 생성함으로 의존성이 약화되지 않는 문제 발생.

이를 해결하기 위해 특정 클래스(Main) 내부에서 사용되는 객체를 생성하여 Main에 전달하도록 수정
- 생성자를 통한 전달
- 메서드를 통한 전달
```

```java
package di_step3;

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

```java
package di_step3;

import java.util.List;

public interface DB {
	public List<String> select(String findStr);
	public String insert(String mid, String pwd);
	public String update(String mid, int serial);
	public int delete(String mid, String pwd, int serial); 
}
```

```java
package di_step3;

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
package di_step3;

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
package di_step3;

// 외부에 노출되는 코드
// 외부 조립기라 표현한다.
public class Assembler {
	DB db;
	
	public DB getDB() {
		db = new OracleDB();
		return db;
	}
	
	
}
```

```java
package di_step3;

public class Main {
	DB db;
	// 이부분은 외부에 노출되면 안되는 코드임.
	// 생성자를 통한 의존성 주입
	public Main(DB db) {
		this.db = db;
		System.out.println(db.select("kim"));
		
	}
	
	public static void main(String[] args) {
		Assembler ass = new Assembler();
		DB db = ass.getDB();
		new Main(db);

	}

}
```

```filer
di_step4

di_step3까지는 POJO를 통한 DI를 구현함. di_step4에서는 POJO에서 구현한 외부 조립기(Assembler)
를 Spring에서 지원해 주는 방법을 사용.

- Spring은 기본적으로 외부 조립기 역할을 외부의 xml 파일로 지원하고 있음.

```

```xml
<?xml version='1.0' encoding='utf-8' ?>

<beans
	xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="
		http://www.springframework.org/schema/beans
		htpp://www.springframework.org/schema/beans/spring-beans-4.0.xsd">





</beans>
```

# 6교시

```file
di_step4

di_step3까지는 POJO를 통한 DI를 구현함. di_step4에서는 POJO에서 구현한 외부 조립기(Assembler)
를 Spring에서 지원해 주는 방법을 사용.

- Spring은 기본적으로 외부 조립기 역할을 외부의 xml 파일로 지원하고 있음.
```

```java
package di_step4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Assembler {
	DB db;

	public DB getDB() {
		ApplicationContext context = 
			new FileSystemXmlApplicationContext("src/di_step4/di_step4.xml"); //파일 경로명	
				
		db = context.getBean("db",DB.class);	// or db = (DB)context.Bean("db");
		return db;
	}
	
	
}
```

```java
package di_step4;

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
package di_step4;

import java.util.List;

public interface DB {
	public List<String> select(String findStr);
	public String insert(String mid, String pwd);
	public String update(String mid, int serial);
	public int delete(String mid, String pwd, int serial); 
}
```

```java
package di_step4;

public class Main {
	DB db;
	// 이부분은 외부에 노출되면 안되는 코드임.
	// 생성자를 통한 의존성 주입
	public Main(DB db) {
		this.db = db;
		System.out.println(db.select("kim"));
		
	}
	
	// 메서드를 통한 의존성 주입
	public void method(DB db) {
		this.db = db;
		System.out.println(db.select("your"));
	}
	
	
	public static void main(String[] args) {
		Assembler ass = new Assembler();
		DB db = ass.getDB();
		Main m = new Main(db);
		
		m.method(db);
		
		
		
	}

}
```

```java
package di_step4;

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
package di_step4;

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

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd">
      
      <bean id='db' class='di_step4.MyDb'/>



</beans>
```

```java
package di_step5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext  context =
				new FileSystemXmlApplicationContext("src/di_step5/di_step5.xml");
		
			MemberDao dao = context.getBean("dao",MemberDao.class);
	}

}
```

```java
package di_step5;

public class MemberDao {
	DB db;
	
	public MemberDao(DB db) {
		this.db = db;
		System.out.println(db.select(""));
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
      
      
      <bean id='db' class='di_step5.MyDb'/>
      <bean id='dao' class='di_step5.MemberDao'>
      	<constructor-arg ref="db"/>
      </bean>


</beans>
```

```java
package di_step5;

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

```java
package di_step5;

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
package di_step5;

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

```interface
package di_step5;

import java.util.List;

public interface DB {
	public List<String> select(String findStr);
	public String insert(String mid, String pwd);
	public String update(String mid, int serial);
	public int delete(String mid, String pwd, int serial); 
}
```

# 7교시

어제 시험본거 풀이 해준당

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원 조회 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<h2>학원 정보 조회하기</h2>
<hr/>
<form name='frm'>
	<input type='text' name='findStr' id='findStr' value='옹'/>
	<input type='button' value='조회하기' id='btn'/>
</form>
<div id='result'></div>

<script>
var findStr = $('#findStr').val();
var sendData = {'findStr' : findStr}

${'#btn'}.on('click',function(){
	$.ajax({
		url : '/searchKH',
		data : sendData,
		type : get,
		dataType : 'json',
		success : function(data){
			${'#result'}.htlm(data);
		}
	});
})

</script>
</body>
</html>
```

```java
package exam;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/searchKH")
public class ExamAjax extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 관련 dao 를 호출한 결과를 가져왔다.
		KH kh = new KH();
		kh.setKh_no(100);
		kh.setKh_name("당산지원");
		kh.setAddr("당산");
		kh.setFax("010-1111-2222");
		
		
		
	}

}
```

```java
package exam;

public class KH {
	int kh_no;
	String kh_name;
	String addr;
	String fax;
	
	
	public int getKh_no() {
		return kh_no;
	}
	public void setKh_no(int kh_no) {
		this.kh_no = kh_no;
	}
	public String getKh_name() {
		return kh_name;
	}
	public void setKh_name(String kh_name) {
		this.kh_name = kh_name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	
	
}
```

# 마지막 교시

