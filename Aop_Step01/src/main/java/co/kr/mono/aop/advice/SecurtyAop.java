package co.kr.mono.aop.advice;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.aspectj.lang.JoinPoint;
import org.springframework.test.util.AopTestUtils;

import co.kr.mono.aop.test.AopTest;
import co.kr.mono.aop.util.UtilLib;

public class SecurtyAop {
	
	public void displayLine() {
		System.out.println(UtilLib.lpad("*", 50, "*"));
	}
	
	public void logBefore(JoinPoint joinPoint) {
		displayLine();
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
		String dateStr = format.format(Calendar.getInstance().getTime());
		
		System.out.println("### 조회 : " + AopTest.loginName);
		System.out.println("### 날짜 : " + dateStr );
		
		System.out.println("### Before ["+ joinPoint + "] 메서드 실행 전처리 수행");	// 타켓을 호출한 정보가 출력됨
		for(Object arg : joinPoint.getArgs()) {
			System.out.println("Before [" + joinPoint + "] 아규먼트 : " + arg);
		}
		
		displayLine();
	}

}
