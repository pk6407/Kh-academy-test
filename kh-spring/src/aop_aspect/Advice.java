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
