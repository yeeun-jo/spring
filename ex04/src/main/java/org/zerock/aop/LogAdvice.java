package org.zerock.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j
@Component	// spring Bean으로 인식하기 위해서 사용(aop와는 관계없음)
@Aspect
public class LogAdvice {
	
	// 맨앞에 *는 접근제한자를 의미, 맨 뒤의 *는 클래스의 이름과 메서드의 이름을 의미
	@Before("execution(* org.zerock.service.SampleService*.*(..))")
	public void logBefore() {
		log.info("===================");
	}
	
	@Before("execution(* org.zerock.service.SampleService*.doAdd(String,String)) && args(str1,str2)")
	public void logBeforeWithParam(String str1, String str2) {
		log.info("str1 : " + str1);
		log.info("str2 : " + str2);
	}
	
	// 예외발생
	@AfterThrowing(pointcut = "execution(* org.zerock.service.SampleService*.*(..))", throwing = "exception")
	public void logException(Exception exception) {
		log.info("Exception !!!!!!!!!!!!");
		log.info("exception : " + exception);
	}

	@Around("execution(* org.zerock.service.SampleService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		long start = System.currentTimeMillis();
		log.info("Target : " + pjp.getTarget());
		log.info("Param : "+ Arrays.toString(pjp.getArgs()));
		
		//invoke method
		Object result = null;
		
		try {
			result = pjp.proceed();
		}catch(Throwable e) {
			e.printStackTrace();
		}
		
		long end = System.currentTimeMillis();
		log.info("TIME : " + (end - start));
		return result;
		
	}
}
