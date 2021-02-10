package kr.jobtc;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.jobtc.board.BoardDao;
import kr.jobtc.board.BoardVo;

//Spring boot에서 DI를 구성하는 또다른 방법

@Aspect
@Configuration
public class AppConfig {

	Logger logger = LoggerFactory.getLogger(AppConfig.class);
	BoardVo boardVo;
	
	// <bean id='boardDao' class='kr.jobtc.BoardDao'/>

	@Before("execution(* kr.jobtc.board.*.*(..))")
	public void before(JoinPoint point) {
		//일단 주석~
		//System.out.println("실행 메서드 이전에 처리될 내용");
		//logger.info("llll");
	}
	
}








