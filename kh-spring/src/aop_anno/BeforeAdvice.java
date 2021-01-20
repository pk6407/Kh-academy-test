package aop_anno;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class BeforeAdvice {
	
	@Before("execution(* insert(..))||"
			+ "execution(* update(..))||"
			+ "execution(* delete(..))")
	public Object check(JoinPoint point) {
		TVProduct p = (TVProduct)point.getTarget();
		System.out.println("BeforeAdvice : " + p.name);
		p.name = "KNH";
		System.out.println("사전에 로그인 체크를 마쳤습니다....");
		return p;
	}

	@After("execution(* select(..))")
	public Object log(JoinPoint point) {
		System.out.println("AfterAdvice : ");
		return null;
	}
}
