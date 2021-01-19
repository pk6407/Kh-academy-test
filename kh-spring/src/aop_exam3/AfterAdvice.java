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
 