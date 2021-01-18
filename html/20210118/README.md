# 1교시

- POSO AOP
- Spring AOP
- AspectJ AOP

- 일정
  - 1~18/1~20
    - 조편성
  - 1~21/1~22
    - 주제선정 및 컨셉설정
  - 1/25~1/28
    - 자료조사
      - 벤치마킹 사이트 선정
      - 컨텐츠 요소(메뉴)
      - 실제 개발한 내용을 조사하느것이 아님(업무 전체 흐름이나 시나리오를 아는게 목적[무슨 기술이 쓰엿는지 파악하는게 중요])
  - 1/29~2/1
    - 개발 범위 설정 및 업무 분장
      - 개발할 컨텐츠 선정
  - 2/2
    - 사용 기술 선택
      - 필수 : mybatis,spring
      - 부분적으로 ajax 또는 jquery
  - 2/3~2/8
    - 스토리 보드 작성
      - 와이어 프레임
      - 표준 양식 배포
  - 2/9~2/10
    - 개발 일정 수립
      - 개발 계획 발표
      - 계획서 제출
  - 2/15~2/25
    - 개발
      - 계획대 실적 분석 및 대안
      - 회의록 작성
  - 2/26
    - 1차 발표
      - 향후 계획 수정
  - 2/26~3/3
    - 보고서 작성
      - 표준 양식 배포
      - 회의록,보고서 제출
  - 3/4
    - 파이널 PPT 작성 및 발표

겁나 빡쌔당...벌써 스트레스 받는다..신난다

# 2교시

저번주 금요일날한거 복습함
- https://mvnrepository.com/artifact/org.springframework/spring-aop 검색함 

# 3교시

Spring AOP Library 추가
- mvnrepository.com에서 Spring aop로 검색 후 spring 버전과 최대한 일치하는 버전으로 설치
- maven dependenty 정보를 pom.xml에 복사
- https://mvnrepository.com/artifact/org.aspectj/aspectjweaver/1.9.6 이거 받아서 pom.xml 에 넣어라
- AOP 의 Spring Library 추가
  - mvnrepository.com 에서 'aspectj'로 검색한 후 aspectj-weaver 설치

```file
- spring aop library를 사용한 AOP 구현

- mvnrepository.com에서 'spring aop'로 검색후 해당 dependency를
  pom.xml 에추가
  
  
- interface Dao 작성
- MemberDao, BoardDao, SaleDao 작성
- Advice : spring aop를 구현하는 클래스
- Main : AOP 실행하는 클래스
- aop_step3.xml : AOP를 구현한 xml
```

```java
package aop_step3;

import java.util.List;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class Advice implements MethodInterceptor{

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object o = null;
		if(loginCheck()) {
			//String rs = (String)invocation.proceed();
			//List<String> list = (List<String>)invocation.proceed();
			o = invocation.proceed();
		}
		return o;
	}
	
	public boolean loginCheck() {
		// 로그인 여부를 판단하는 프로세스
		return true;
	}
	
}
```

```java
package aop_step3;

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
package aop_step3;

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
package aop_step3;

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
package aop_step3;

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
package aop_step3;

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
      

      <bean id="bDao" class="aop_step3.BoardDao"/>
      <bean id="mDao" class="aop_step3.MemberDao"/>
      <bean id="sDao" class="aop_step3.SaleDao"/>
       
      <bean id='advice' class='aop_step3.Advice'/>	
      

</beans>
```

# 점심후 4교시

```java
package aop_step3;

import java.util.List;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class Advice implements MethodInterceptor{

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object o = null;
		if(loginCheck()) {
			//String rs = (String)invocation.proceed();
			//List<String> list = (List<String>)invocation.proceed();
			o = invocation.proceed();
		}
		return o;
	}
	
	public boolean loginCheck() {
		// 로그인 여부를 판단하는 프로세스
		return true;
	}
	
}
```

```java
package aop_step3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop_step3/aop_step3.xml");

		Dao dao =(Dao)context.getBean("proxy");
		String r = dao.insert();
		System.out.println(r);
		
		
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
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd">
      

      <bean id="bDao" class="aop_step3.BoardDao"/>
      <bean id="mDao" class="aop_step3.MemberDao"/>
      <bean id="sDao" class="aop_step3.SaleDao"/>
       
      <bean id='advice' class='aop_step3.Advice'/>	
      
	<!-- Spring aop -->
	<bean id='proxy' class='org.springframework.aop.framework.ProxyFactoryBean'>
		<property name='target'	ref='bDao' />
		<property name='interceptorNames'>
			<list>
				<value>advisor</value>
			</list>
		</property>
	</bean>
	
	<bean id='advisor' class='org.springframework.aop.support.DefaultPointcutAdvisor'>
		<property name="advice" ref='advice'/>
		<property name="patterns">
			<list>
				<value>*.select.*</value>
				<value>*.delete.*</value>
				<value>*.update.*</value>
			</list>
		</property>
	
	</bean>
</beans>
```

# 5교시

```java
package aop_step3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop_step3/aop_step3.xml");

		Dao dao =(Dao)context.getBean("proxy");
		String r = dao.update();
		System.out.println(r);
		
		
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
```

```java
package aop_step3;

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

```java
package aop_step3;

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
package aop_step3;

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
   xsi:schemaLocation="
      http://www.springframework.org/schema/beans
      http://www.springframework.org/schema/beans/spring-beans-4.0.xsd">
      

      <bean id="bDao" class="aop_step3.BoardDao"/>
      <bean id="mDao" class="aop_step3.MemberDao"/>
      <bean id="sDao" class="aop_step3.SaleDao"/>
       
      <bean id='advice' class='aop_step3.Advice'/>	
      
	<!-- Spring aop -->
	<bean id='proxy' class='org.springframework.aop.framework.ProxyFactoryBean'>
		<property name='target'	ref='bDao' />
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
				<value>.*insert.*</value>
				<value>.*select.*</value>
				<value>.*delete.*</value>
				<value>.*update.*</value>
			</list>
		</property>
		</bean>
		</property>
	
	</bean>
</beans>
```

# 6~7 교시

- Spring aop 응용 예(aop_exam2)

- 1. 생산제품을 처리하는 Dao의 interface Product작성
  - 메서드는 CRUD를 처리하는 메서드
- 2. Product를 구현한 TVProduct,RadioProduct,SmartTVProduct클래스 작성
- 3. AdviceProduct 클래스를 사용하여 CRUD 처리시 현재시간을 로그로 화면에 출력하도록 advice 클래스 작성
  - around타입으로
- 4. aop_exam2.xml에서 spring aop설정
- 5. Main 클래스에서 실행.

# 마지막 교시

```java
package aop_exam2;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class AdviceProduct implements MethodInterceptor{

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object o = null;
		System.out.println("----------------------------");
		log();
		o = invocation.proceed();
		System.out.println(o);
		log();
		return o;
	}
	
	public boolean log() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd[E] hh:mm:ss:SS");
		System.out.println(sdf.format(new Date()));
		return true;
	}
	
}
```

```java
package aop_exam2;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public Main() {
		ApplicationContext context =
				new FileSystemXmlApplicationContext("src/aop_exam2/aop_exam2.xml");
		
		Product p = (Product)context.getBean("job");
		List<String> r = p.select("abc");
		p.insert("abc");
		p.update("abc");
		p.delete(100);
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
```

```interface
package aop_exam2;

import java.util.List;

public interface Product {
	public List<String>select(String findStr);
	public int insert(String name);
	public int update(String name);
	public int delete(int serial);
}
```

```java
package aop_exam2;

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
		return 1;
	}
	
	@Override
	public int update(String name) {
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		return 3;
	}
}
```

```java
package aop_exam2;

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
		return 1;
	}
	
	@Override
	public int update(String name) {
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		return 3;
	}
}
```

```java
package aop_exam2;

import java.util.ArrayList;
import java.util.List;

public class TVProduct implements Product{
	
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
		return 1;
	}
	
	@Override
	public int update(String name) {
		return 2;
	}
	
	@Override
	public int delete(int serial) {
		return 3;
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
      

      <bean id="tv" class="aop_exam2.TVProduct"/>
      <bean id="radio" class="aop_exam2.RadioProduct"/>
      <bean id="smart" class="aop_exam2.SmartTVProduct"/>
       
      <bean id='advice' class='aop_exam2.AdviceProduct'>
      	
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
</bean>
</beans>
```

```file
Spring aop 응용 예(aop_exam2)

1)생산제품을 처리하는 Dao의 interface Product작성
  - 메서드는 CRUD를 처리하는 메서드
2)Product를 구현한 TVProduct,RadioProduct,SmartTVProduct클래스 작성

3)AdviceProduct 클래스를 사용하여 CRUD 처리시 현재시간을 로그로 화면에 출력하도록 advice 클래스 작성
  - around타입으로

4)aop_exam2.xml에서 spring aop설정

5)Main 클래스에서 실행
```
