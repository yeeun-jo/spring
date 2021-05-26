package com.itbank.main;

import com.itbank.calc.LoopCalculator;
import com.itbank.calc.RecuCalculator;

public class Main1 {
	public static void main(String[] args) {
		long value = 20;
		
		LoopCalculator calc1 = new LoopCalculator();
		long facto1 = calc1.factorial(value);
		System.out.println("facto1 :" + facto1);
		
		RecuCalculator calc2 = new RecuCalculator();
		long facto2 = calc2.factorial(value);
		System.out.println("facto2 : " + facto2);
	}
}
