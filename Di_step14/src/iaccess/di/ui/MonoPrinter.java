package iaccess.di.ui;

import org.springframework.stereotype.Component;

public class MonoPrinter implements Printer{

	@Override
	public void print(String s) {
		System.out.println("====== Mono Print Start ======");
		System.out.println(s);
		System.out.println("====== Mono Print End ======");
	}

}
