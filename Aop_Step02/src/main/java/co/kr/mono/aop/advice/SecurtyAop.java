package co.kr.mono.aop.advice;


import org.aspectj.lang.ProceedingJoinPoint;

import co.kr.mono.aop.util.UtilLib;

public class SecurtyAop {
	
	public void displayLine() {
		System.out.println(UtilLib.lpad("*", 50, "*"));
	}
	
	public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
		String singatureStr = joinPoint.getSignature().toShortString();
		System.out.println("### : " + singatureStr + " 시작.");
		
		// 핵심 기능 시작 실행시간 측정
		long start = System.currentTimeMillis();
		
		try {
			// 핵심기능
			Object result = joinPoint.proceed();
			return result;
		} finally {
			// 핵심 기능 종료 실행시간 측정
			long finish = System.currentTimeMillis();
			
			System.out.println("### : " + singatureStr +" 실행시간 :" + (finish - start) + "ms");
			System.out.println("### : " + singatureStr +" 종료.");
			
		}
	}

}
