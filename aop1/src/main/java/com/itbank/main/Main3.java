package com.itbank.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itbank.calc.LoopCalculator;
import com.itbank.calc.RecuCalculator;

@Controller
public class Main3 {
	
	@Autowired
	private  LoopCalculator loopCalc;
	
	@Autowired
	private  RecuCalculator recuCalc;

	@GetMapping("")
	public void main() {
		System.out.println(loopCalc.factorial(20));
		System.out.println(recuCalc.factorial(20));
	}
}
