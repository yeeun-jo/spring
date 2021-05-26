package com.itbank.aspect;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggerAspect {

	// Around = Before + After (함수실행되기 전과 후 )

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	
//	@Before("within(com.itbank.service.*)")
//	public void startLog(JoinPoint jp) {	// @Before, @AfterReturning, @AfterThrowing
	
	@Around("within(com.itbank.service.*)")
	public Object startLog(ProceedingJoinPoint jp) throws Throwable {
		//ProceedingJoinPoint 매개 변수는 @Around에서만 사용 가능하다(결과물을 얻어내고 싶을때 사용)
		
		String data = sdf.format(new Date());
		Object returnValue = jp.proceed();
		
//		System.out.println("---------------------------------------");
//		System.out.println(data + " : " + jp.getSignature().toString());
//		System.out.println(data + " : " + Arrays.toString(jp.getArgs()));
//		System.out.println("---------------------------------------");

		System.out.println("---------------------------------------");
		System.out.println(data + " [method] : " + jp.getSignature().toString());
		System.out.println(data + " [argument] : " + Arrays.toString(jp.getArgs()));
		System.out.println(data + " [returnValue] : " +returnValue.toString());
		System.out.println("---------------------------------------");
		return returnValue;
	}
}
