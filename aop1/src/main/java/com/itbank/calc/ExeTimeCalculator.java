package com.itbank.calc;

public class ExeTimeCalculator implements Calculator {

	private Calculator delegate;
	
	public ExeTimeCalculator(Calculator delegate) {
		this.delegate = delegate;
	}
	
	@Override
	public long factorial(long num) {
		// 핵심 기능 수행 전 코드
		long startTime = System.nanoTime();		// 시작 시간
		
		// 핵심 기능(서로 다른 코드가 올 수 있다)
		long ret = delegate.factorial(num);		// 실제 계산은 위임된 객체가 알아서 수행함
		
		// 핵심 기능 수행 후 코드
		long endTime =System.nanoTime();		// 끝난 시간
		System.out.printf("%s : %d ns \n",			// 누가 계산했는지, 걸린 시간을 출력
				delegate.getClass().getSimpleName(),
				endTime - startTime);
		
		return ret;								// 계산된 결과를 반환
	}
}
