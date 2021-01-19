# 1교시

- AspectJ를 사용한 AOP구현
- Spring의 MVC

kh-spring 프로젝트안에 pom.xml

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>kh-spring</groupId>
  <artifactId>kh-spring</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>war</packaging>
  <build>
    <sourceDirectory>src</sourceDirectory>
    <plugins>
      <plugin>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.8.1</version>
        <configuration>
          <source>1.8</source>
          <target>1.8</target>
        </configuration>
      </plugin>
      <plugin>
        <artifactId>maven-war-plugin</artifactId>
        <version>3.2.3</version>
        <configuration>
          <warSourceDirectory>WebContent</warSourceDirectory>
        </configuration>
      </plugin>
    </plugins>
  </build>
  
  <dependencies>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.2.12.RELEASE</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-aop</artifactId>
    <version>5.2.12.RELEASE</version>
</dependency>
<dependency>
    <groupId>org.aspectj</groupId>
    <artifactId>aspectjweaver</artifactId>
    <version>1.9.6</version>
</dependency>
 
  </dependencies>
  
  
  
</project>
```

aop_exam2안에잇는 xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd">
      
      <bean id="tv" class="aop_exam2.TVProduct"/>
      <bean id="radio" class="aop_exam2.RadioProduct"/>
      <bean id="smart" class="aop_exam2.SmartTVProduct"/>
       
      <bean id='advice' class='aop_exam2.AdviceProduct'/>
      	
    <!-- spring aop -->
	<bean id='job' class='org.springframework.aop.framework.ProxyFactoryBean'>
		<property name='target'	ref='tv' />
		<property name='interceptorNames'>
			<list>
				<value>advisor</value>
			</list>
		</property>
	</bean>
	
	<bean id='advisor' class='org.springframework.aop.support.DefaultPointcutAdvisor'>
		<property name="advice" ref='advice'/>
		<property name="pointcut">
		<bean class='org.springframework.aop.support.JdkRegexpMethodPointcut'>
		<property name="patterns">
			<list>
				<value>.*select.*</value>
				<value>.*insert.*</value>
				<value>.*delete.*</value>
				<value>.*update.*</value>
			</list>
		</property>
		</bean>
		</property>
	
	</bean>
</beans>
```

# 2교시

aop_aspect라는 패키지 만들고 그거 작업시작

```java
package aop_aspect;

import org.aspectj.lang.JoinPoint;

public class Advice{

	
	//before
	public boolean loginCheck(JoinPoint point) {
		// 로그인 여부를 판단하는 프로세스
		System.out.println("출력되는중이오");
				
		return true;
	}
	
}
```

```java
package aop_aspect;

import java.util.ArrayList;
import java.util.List;

public class BoardDao implements Dao{

	public BoardDao() {
	}

	@Override
	public List<String> select() {
		List<String>list = new ArrayList<String>();
		list.add("kim");
		list.add("lee");
		list.add("park");
		
		return list;
	}

	@Override
	public String insert() {
		return "BoardDao.insert()";
	}

	@Override
	public String update() {
		return "BoardDao.update()";
	}

	@Override
	public String delete() {
		return "BoardDao.delete()";
	}

	@Override
	public String repl() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
```

```interface
package aop_aspect;

import java.util.List;

public interface Dao {
	public List<String> select();
	public String insert();
	public String update();
	public String delete();
	public String repl();
}
```

```java
package aop_aspect;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop_aspect/aop_aspect.xml");

		Dao dao =(Dao)context.getBean("bDao");
		List<String> r = dao.select();
		System.out.println(r);
		
		
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
```

```java
package aop_aspect;

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
		return "MemberDao.insert()";
	}

	@Override
	public String update() {
		return "MemberDao.update()";
	}

	@Override
	public String delete() {
		return "MemberDao.delete()";
	}

	@Override
	public String repl() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
```

```java
package aop_aspect;

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
		return "SaleDao.insert()";
	}

	@Override
	public String update() {
		return "SaleDao.update()";
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
   xmlns:context = "http://www.springframework.org/schema/context"
   xmlns:aop = "http://www.springframework.org/schema/aop"
   
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd
      
      http://www.springframework.org/schema/context
      http://www.springframework.org/schema/context/spring-context-4.0.xsd
      
      http://www.springframework.org/schema/aop
      http://www.springframework.org/schema/aop/spring-aop-4.0.xsd
      
      ">
      

      <bean id="bDao" class="aop_aspect.BoardDao"/>
      <bean id="mDao" class="aop_aspect.MemberDao"/>
      <bean id="sDao" class="aop_aspect.SaleDao"/>
       
      <bean id='advice' class='aop_aspect.Advice'/>	
      
      <!-- aspectj aop -->
      <aop:config>
      	<aop:aspect id="aspect" ref='advice'>
      		<aop:pointcut id="pointcut" 
      			expression="execution(* select(..))"/>
      		<aop:before method="loginCheck" pointcut-ref="pointcut"/>
      	
      	</aop:aspect>
      
      </aop:config>
	
	
	
	
</beans>
```

# 3교시

aspectj 라이브러리의expression

execute(...)

[접근제한자패턴][리턴값패턴][패키지패턴]메서드이름패턴(파라메터패턴)

ex) expression="execute(*select(...))" -> 메서드명이 select라면 aop실행
ex) expression="execute(public * aop_aspect..*(..))" ->

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:context = "http://www.springframework.org/schema/context"
   xmlns:aop = "http://www.springframework.org/schema/aop"
   
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd
      
      http://www.springframework.org/schema/context
      http://www.springframework.org/schema/context/spring-context-4.0.xsd
      
      http://www.springframework.org/schema/aop
      http://www.springframework.org/schema/aop/spring-aop-4.0.xsd
      
      ">
      
      <bean id="bDao" class="aop_aspect.BoardDao"/>
      <bean id="mDao" class="aop_aspect.MemberDao"/>
      <bean id="sDao" class="aop_aspect.SaleDao"/>
       
      <bean id='advice' class='aop_aspect.Advice'/>	
      
      <!-- aspectj aop -->
      <aop:config>
      	<aop:aspect id="aspect" ref='advice'>
      		<aop:pointcut id="pointcut" 
      			expression="execution(* select(..))"/>
      		<aop:before method="loginCheck" pointcut-ref="pointcut"/>	
      	</aop:aspect>
      
      	<aop:aspect id='around' ref='advice'>
      		<aop:pointcut expression="execution(* insert(..))" id="aroundPointcut"/>
      		<aop:around method="around" pointcut-ref="aroundPointcut"/>
      	
      	</aop:aspect>
      </aop:config>
</beans>
```

```java
package aop_aspect;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class Advice{
	//before or after
	public boolean loginCheck(JoinPoint point) {
		// 로그인 여부를 판단하는 프로세스
		System.out.println("출력되는중이오");
				
		return true;
	}
	
	//around(insert 작업시 around 타입으로 작업시간을 log로 출력
	public Object around(ProceedingJoinPoint point) {
		System.out.println(log());
			try {
				point.proceed();
			} catch (Throwable ex) {}
				
			System.out.println(log());
			return null;
		}
	public String log() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
		return sdf.format(new Date());
	}
}
```

```java
package aop_aspect;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop_aspect/aop_aspect.xml");

		Dao dao =(Dao)context.getBean("bDao");
		List<String> r = dao.select();
		System.out.println(r);
		
		String str = dao.insert();
		System.out.println(str);
	
	
		
	

	}
		
	public static void main(String[] args) {
		new Main();
	}
}
```

# 점심후 4교시

```java
package aop_aspect;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class Advice{
	//before or after
	public boolean loginCheck(JoinPoint point) {
		// 로그인 여부를 판단하는 프로세스
		System.out.println("출력되는중이오");
				
		return true;
	}
	
	//around(insert 작업시 around 타입으로 작업시간을 log로 출력
	public Object around(ProceedingJoinPoint point) {
		System.out.println(log());
		Object o = null;
			try {
				o = point.proceed();
				System.out.println(o);
			} catch (Throwable ex) {}
				
			System.out.println(log());
			return o;
		}
	public String log() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
		return sdf.format(new Date());
	}
}
```

```java
package aop_aspect;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop_aspect/aop_aspect.xml");

		Dao dao =(Dao)context.getBean("bDao");
		List<String> r = dao.select();
		System.out.println(r);
		
		String str = dao.insert();
		System.out.println(str);
	
	
		
	

	}
		
	public static void main(String[] args) {
		new Main();
	}
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:context = "http://www.springframework.org/schema/context"
   xmlns:aop = "http://www.springframework.org/schema/aop"
   
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd
      
      http://www.springframework.org/schema/context
      http://www.springframework.org/schema/context/spring-context-4.0.xsd
      
      http://www.springframework.org/schema/aop
      http://www.springframework.org/schema/aop/spring-aop-4.0.xsd
      
      ">
      
      <bean id="bDao" class="aop_aspect.BoardDao"/>
      <bean id="mDao" class="aop_aspect.MemberDao"/>
      <bean id="sDao" class="aop_aspect.SaleDao"/>
       
      <bean id='advice' class='aop_aspect.Advice'/>	
      
      <!-- aspectj aop -->
      <aop:config>
      	<aop:aspect id="aspect" ref='advice'>
      		<aop:pointcut id="pointcut" 
      			expression="execution(* select(..))"/>
      		<aop:before method="loginCheck" pointcut-ref="pointcut"/>	
      	</aop:aspect>
      
      	<aop:aspect id='around' ref='advice'>
      		<aop:pointcut expression="execution(* insert(..))" id="aroundPointcut"/>
      		<aop:around method="around" pointcut-ref="aroundPointcut"/>
      	
      	</aop:aspect>
      </aop:config>
</beans>
```

xml에서 	<aop:before method="loginCheck" pointcut-ref="pointcut"/>하면

출력되는중이오
BoardDao Select()
[kim, lee, park]
2021-01-19(화) 01:58:42:180
BoardDao.insert()
2021-01-19(화) 01:58:42:181
BoardDao.insert()

이라고 출력되고

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:context = "http://www.springframework.org/schema/context"
   xmlns:aop = "http://www.springframework.org/schema/aop"
   
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd
      
      http://www.springframework.org/schema/context
      http://www.springframework.org/schema/context/spring-context-4.0.xsd
      
      http://www.springframework.org/schema/aop
      http://www.springframework.org/schema/aop/spring-aop-4.0.xsd
      
      ">
      
      <bean id="bDao" class="aop_aspect.BoardDao"/>
      <bean id="mDao" class="aop_aspect.MemberDao"/>
      <bean id="sDao" class="aop_aspect.SaleDao"/>
       
      <bean id='advice' class='aop_aspect.Advice'/>	
      
      <!-- aspectj aop -->
      <aop:config>
      	<aop:aspect id="aspect" ref='advice'>
      		<aop:pointcut id="pointcut" 
      			expression="execution(* select(..))"/>
      		<aop:after method="loginCheck" pointcut-ref="pointcut"/>	
      	</aop:aspect>
      
      	<aop:aspect id='around' ref='advice'>
      		<aop:pointcut expression="execution(* insert(..))" id="aroundPointcut"/>
      		<aop:around method="around" pointcut-ref="aroundPointcut"/>
      	
      	</aop:aspect>
      </aop:config>
</beans>
```

xml에서 <aop:after method="loginCheck" pointcut-ref="pointcut"/>	라고 하면

BoardDao Select()
출력되는중이오
[kim, lee, park]
2021-01-19(화) 01:59:50:348
BoardDao.insert()
2021-01-19(화) 01:59:50:349
BoardDao.insert()

라고 출력된다.

# 5~6 교시

aop_exam3 패키지만들어서 작업

```file
---------------------------------------------
Spring aspectj library를 사용한 AOP 응용
---------------------------------------------
1) interface Product를 구현하여 TVProduct, RadioProduct, SmartTVProduct 클래스를 작성
2) AfterAdvice 클래스에서는 Product의 select 메서드가 실행되면 after로 형태로 로그를 출력
3) BeforeAdvice 클래스에서는 Product의 insert, update, delete가 실행될때 사전에 로그인 체크를 하여
 로그인된 경우만 프로세스를 실행하도록 advice를 작성하시오.
4) Main 클래스를 사용하여 전체 테스트 진행.
```

재정의(@Override)
- 접근제한자 : 부모보다 접근범위는 넓어야함
- 예외처리

```java
package aop_exam3;

import org.aspectj.lang.JoinPoint;

public class AfterAdvice{

	public Object log(JoinPoint point) {
		System.out.println("after 형태로 log를 출력하였습니다.......");
		
		return null;
	}
	
}
```

```java
package aop_exam3;

import org.aspectj.lang.JoinPoint;

public class BeforeAdvice {
	
	public Object check(JoinPoint point) {
		System.out.println("사전에 로그인 체크를 마쳤습니다....");
		return true;
	}
}
```

```java
package aop_exam3;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context =
				new FileSystemXmlApplicationContext("src/aop_exam3/aop_exam3.xml");
		
		Product p = (Product)context.getBean("tv");
		
		System.out.println("------------------");
		
		p.insert("");
		System.out.println("------------------");
		p.update("");
		
		System.out.println("------------------");
		p.delete(1);
		
		System.out.println("------------------");
		p.select("");
		
		
		
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
```

```interface
package aop_exam3;

import java.util.List;

public interface Product {
	public List<String>select(String findStr);
	public int insert(String name);
	public int update(String name);
	public int delete(int serial);
}
```

```java
package aop_exam3;

import java.util.ArrayList;
import java.util.List;

public class RadioProduct implements Product{

	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		return list;
	}
	
	@Override
	public int insert(String name) {
		System.out.println("RadioProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("RadioProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("RadioProduct.delete()");
		return 3;
	}
}
```

```java
package aop_exam3;

import java.util.ArrayList;
import java.util.List;

public class SmartTVProduct implements Product {

	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		return list;
	}
	
	@Override
	public int insert(String name) {
		System.out.println("SmartTVProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("SmartTVProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("SmartTVProduct.delete()");
		return 3;
	}
}
```

```java
package aop_exam3;

import java.util.ArrayList;
import java.util.List;

public class TVProduct implements Product{
	
	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		System.out.println("TVProduct.select()");
		return list;
	}
	@Override
	public int insert(String name) {
		System.out.println("TVProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("TVProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("TVProduct.delete()");
		return 3;
	}
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:context = "http://www.springframework.org/schema/context"
   xmlns:aop = "http://www.springframework.org/schema/aop"
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd
      
      http://www.springframework.org/schema/context
      http://www.springframework.org/schema/context/spring-context-4.0.xsd
      
      http://www.springframework.org/schema/aop
      http://www.springframework.org/schema/aop/spring-aop-4.0.xsd
      
      
      ">
      
      <bean id="tv" class="aop_exam3.TVProduct"/>
      <bean id="radio" class="aop_exam3.RadioProduct"/>
      <bean id="smart" class="aop_exam3.SmartTVProduct"/>
       
      <bean id='beforeAdvice' class='aop_exam3.BeforeAdvice'/>
      <bean id='afterAdvice' class='aop_exam3.AfterAdvice'/>
      	 
   <!-- aspectj aop -->
      <aop:config>
      	<aop:aspect id="after" ref='afterAdvice'>
      		<aop:pointcut id="afterPointcut" 
      			expression="execution(* select(..))"/>
      		<aop:after method="log" pointcut-ref="afterPointcut"/>	
      	</aop:aspect>
      
      	<aop:aspect id='before' ref='beforeAdvice'>
      		<aop:pointcut expression="execution(* aop_exam3..insert(..)) || execution(* aop_exam3..update(..)) || execution(* aop_exam3..delete(..))"
      		
      		 id="beforePointcut"/>
      		<aop:before method="check" pointcut-ref="beforePointcut"/>
      	
      	</aop:aspect>
      </aop:config>
</beans>
```

# 7교시~ 끝

```java
package aop_exam3;

import org.aspectj.lang.JoinPoint;

public class AfterAdvice{

	public Object log(JoinPoint point) {
		TVProduct p = (TVProduct)point.getTarget();
		System.out.println("AfterAdvice:log" + p.name);
		System.out.println("after 형태로 log를 출력하였습니다.......");
		
		return null;
	}
	
}
```

```java
package aop_exam3;

import org.aspectj.lang.JoinPoint;

public class BeforeAdvice {
	
	public Object check(JoinPoint point) {
		TVProduct p = (TVProduct)point.getTarget();
		System.out.println("BeforeAdvice : " + p.name);
		p.name = "KNH";
		System.out.println("사전에 로그인 체크를 마쳤습니다....");
		return p;
	}
}
```

```java
package aop_exam3;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context =
				new FileSystemXmlApplicationContext("src/aop_exam3/aop_exam3.xml");
		
		Product p = (Product)context.getBean("tv");
		
		System.out.println("------------------");
		
		TVProduct p2 = (TVProduct)p;
		System.out.println(p2.name);
		
		int i = p.insert("");
		
		System.out.println("------------------");
		p.update("");
		
		System.out.println("------------------");
		p.delete(1);
		
		System.out.println("------------------");
		p.select("");
		
		
		
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
```

```interface
package aop_exam3;

import java.util.List;

public interface Product {
	public List<String>select(String findStr);
	public int insert(String name);
	public int update(String name);
	public int delete(int serial);
}
```

```java
package aop_exam3;

import java.util.ArrayList;
import java.util.List;

public class RadioProduct implements Product{

	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		return list;
	}
	
	@Override
	public int insert(String name) {
		System.out.println("RadioProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("RadioProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("RadioProduct.delete()");
		return 3;
	}
}
```

```java
package aop_exam3;

import java.util.ArrayList;
import java.util.List;

public class SmartTVProduct implements Product {

	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		return list;
	}
	
	@Override
	public int insert(String name) {
		System.out.println("SmartTVProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("SmartTVProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("SmartTVProduct.delete()");
		return 3;
	}
}
```

```java
package aop_exam3;

import java.util.ArrayList;
import java.util.List;

public class TVProduct implements Product{
	String name = "kim";
	
	@Override
	public List<String> select(String findStr){
		List<String> list = new ArrayList<String>();
		list.add("model 1");
		list.add("model 2");
		list.add("modle 3");
		System.out.println("TVProduct.select()");
		this.name = "lee";
		return list;
	}
	@Override
	public int insert(String name) {
		this.name = name;
		System.out.println("TVProduct.insert()");
		return 1;
	}
	
	@Override
	public int update(String name) {
		System.out.println("TVProduct.update()");
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		System.out.println("TVProduct.delete()");
		return 3;
	}
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans
   xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:context = "http://www.springframework.org/schema/context"
   xmlns:aop = "http://www.springframework.org/schema/aop"
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd
      
      http://www.springframework.org/schema/context
      http://www.springframework.org/schema/context/spring-context-4.0.xsd
      
      http://www.springframework.org/schema/aop
      http://www.springframework.org/schema/aop/spring-aop-4.0.xsd
      
      
      ">
      
      <bean id="tv" class="aop_exam3.TVProduct"/>
      <bean id="radio" class="aop_exam3.RadioProduct"/>
      <bean id="smart" class="aop_exam3.SmartTVProduct"/>
       
      <bean id='beforeAdvice' class='aop_exam3.BeforeAdvice'/>
      <bean id='afterAdvice' class='aop_exam3.AfterAdvice'/>
      	 
   <!-- aspectj aop -->
      <aop:config>
      	<aop:aspect id="after" ref='afterAdvice'>
      		<aop:pointcut id="afterPointcut" 
      			expression="execution(* select(..))"/>
      		<aop:after method="log" pointcut-ref="afterPointcut"/>	
      	</aop:aspect>
      
      	<aop:aspect id='before' ref='beforeAdvice'>
      		<aop:pointcut expression="execution(* aop_exam3..insert(..)) || execution(* aop_exam3..update(..)) || execution(* aop_exam3..delete(..))"
      		
      		 id="beforePointcut"/>
      		<aop:before method="check" pointcut-ref="beforePointcut"/>
      	
      	</aop:aspect>
      </aop:config>
</beans>
```

