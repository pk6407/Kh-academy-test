# 1교시

2/1 ~ 2/22 6교시
Spring boot설정
취업면담 및 취업 특강 (7~8교시)

[프로젝트]
개발 범위 및 업무분장 완료

- Spring boot을 사용한 프로젝트 생성
1. 기존 프로젝트가 담긴 workspace와 분리(workspace-spring-boot)
   - 편집 인코딩 확인 : utf-8
   - java 연결 체크
2. Spring suit4 프로그인 추가
3. dao,vo,Controller와 같은 클래스를 작성할 때 사용되는 패키지는 반드시 기본 패키지 하위에 생성해야 된다.(*중요!*)
- spring starter project 만들기
- name이 프로젝트 명
- packing : war
- Type : Maven
- java version : 8
- Language : java
sql - oracle Driver 눌러서 햇는데 충돌나면 지우고 ojdbc8 이걸 lib 에 넣는다..

# 2교시

프로젝트 클릭하고 상단메뉴에 재생옆에 메뉴 누르고 Spring boot app클릭

스타트할때 Application가 먼저 실행된다.
application.properties
  - #이 주석
  - application 환경설정할때 쓰는것
# server port
server.port=7788
라고 치면 서버 포트를 7788로 바꾼다 라는 거닷..

src안에 main안에 resources안에 static 안에 정적페이지(html,css,js)
src안에 main안에 resources안에 webapp 안에 서버페이지(jsp) = > DWP -> Web Content
pom.xml - > 의존성

tomcat이 내장되잇다..spring boot안에..

# 3교시

@RestController 반환타입
- ModelAndView
- Object
- text,json(gson),html

```java
package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TestController {
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test() {
		String msg = "hi...spring boot controller test";
		return msg;
	}
	
	@RequestMapping(value="/gugudan", method=RequestMethod.GET)
	public ModelAndView gugudan() {
		ModelAndView mv = new ModelAndView();
	
		//2단 출력(TODO)
		
		mv.addObject("gugudan",dan);
		mv.setViewName("gugudan");
		return mv;
	}
}
```

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring boot Test Page</title>
</head>
<body>
hi...Spring boot index.html 페이지 입니다.^^
<br/>
김남호^^


</body>
</html>
```

```java
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}
```

```java
package com.example.demo;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(DemoApplication.class);
	}

}
```

# 점심 먹구 4교시

```application.properties
# server port
server.port=7788

#viewwresolver
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp
```

webapp안에 WEB-INF폴더생성하고 jsp폴더만들고 .jsp만들어서 쓴다

