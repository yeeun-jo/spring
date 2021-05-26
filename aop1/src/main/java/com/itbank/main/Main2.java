package com.itbank.main;

import com.itbank.calc.Calculator;
import com.itbank.calc.ExeTimeCalculator;
import com.itbank.calc.LoopCalculator;
import com.itbank.calc.RecuCalculator;

public class Main2 {
	public static void main(String[] args) {
		
		Calculator calc1 = new LoopCalculator();
		Calculator calc2 = new RecuCalculator();
		Calculator e1 = new ExeTimeCalculator(calc1);
		Calculator e2 = new ExeTimeCalculator(calc2);
		
		System.out.println(e1.factorial(20));
		System.out.println(e2.factorial(20));
		
			
		
	}
}
