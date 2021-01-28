package aop_exam2;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class AdviceProduct implements MethodInterceptor{

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object o=null;
		System.out.println("-----------------------------------");
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
