package com.itbank.aspect;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class ExeTimeAspectAnno {

	// Around = Before + After (함수실행되기 전과 후 )
//	@Around("execution(public long com.itbank.calc.LoopCalculator.factorial(long))"
//			+ " or execution(public long com.itbank.calc.RecuCalculator.factorial(long))")
	
//	@Around("within(com.itbank.calc.*)")
	
//	@Around("bean(*Service)")

	@Around("bean(*Calculator)")
	public Object measure(ProceedingJoinPoint joinPointer) throws Throwable {
		long start = System.nanoTime();
		try {
			Object result = joinPointer.proceed();		// delegate.factorial(num); 이랑 같음
			return result;
		}
		finally {
			long end = System.nanoTime();
			org.aspectj.lang.Signature sig = joinPointer.getSignature();
			System.out.println("joinPointer : " + joinPointer);
			System.out.printf("%s.%s(%s) 실행시간 : %d ns \n ",
					
					joinPointer.getTarget().getClass().getSimpleName(),		// 핵심 기능의 객체
					sig.getName(),											// 호출된 실제 메서드
					joinPointer.getArgs()[0],								// 메서드 호출 인자
					end - start);											// 걸린 시간
		}
	}
}
