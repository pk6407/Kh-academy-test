package kr.jobtc;

import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.jobtc.board.BoardVo;

//Spring boot에서 DI를 구성하는 또다른 방법

@Aspect
@Configuration
public class AppConfig {
	
	BoardVo boardVo;

	// <bean id='boardVo' class='kr.jobtc.BoardVo'/>
	@Bean
	public BoardVo getBoardVo() {
		return new BoardVo();
	}
	
	@Before("execution(* kr.jobtc.*.*(..))")
	public void before(Joinpoint point) {
		System.out.println("실행 메서드 이전에 처리될 내용");
	}
	
	@Around("execution(* kr.jobtc.*.*(..))")
	public void around(ProceedingJoinPoint point) throws Throwable {
		//메서드를 실행하려면
		Object o = point.proceed();
	}
}
