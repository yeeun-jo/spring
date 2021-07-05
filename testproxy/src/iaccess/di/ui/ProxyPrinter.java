package iaccess.di.ui;

public class ProxyPrinter implements Printer{
	
	Printer p;

	public ProxyPrinter(Printer p) {
		this.p = p;
	}
	
	@Override
	public void print(String s) {
		System.out.println("*****************BEFORE*****************");	// (먼저 실행할) 공통로직 => 프록시가 실행해줌
		p.print(s);	// 핵심 작업, Business Logic
		System.out.println("*****************AFTER*****************");	// (나중에 실행할)공통로직
	}
	

}
