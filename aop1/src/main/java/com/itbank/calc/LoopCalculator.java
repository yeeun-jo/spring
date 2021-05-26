package com.itbank.calc;

import org.springframework.stereotype.Component;

@Component
public class LoopCalculator implements Calculator{

	@Override
	public long factorial(long num) {
		// 전달된 num의 팩토리얼을 반환하는 함수를 for문으로 구현하세요
		// 4 * 3 * 2 * 1 = 1 * 2 * 3 * 4 =24
		long result = 1;
		for(long i = 1 ; i<= num; i++) {
			result *= i;
		}
		return result;
	}
}
