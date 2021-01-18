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
		System.out.println("출력되는중이오");
		return true;
	}
	
}
