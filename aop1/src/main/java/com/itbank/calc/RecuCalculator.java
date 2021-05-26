package com.itbank.calc;

import org.springframework.stereotype.Component;

@Component
public class RecuCalculator implements Calculator{

	@Override
	public long factorial(long num) {
		// 재귀함수로 팩토리얼 함수를 구현하세요
		if(num == 1) return num;
		
		else return num * factorial(num -1 );
		
	}

}
