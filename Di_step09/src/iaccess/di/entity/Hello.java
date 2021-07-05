package iaccess.di.entity;


import org.junit.Ignore;
import org.springframework.beans.factory.annotation.Autowired;

import iaccess.di.ui.Printer;

public class Hello {
	
//	@Autowired
	private Printer printer;
	
	public Hello() {
	}
	
//	@Autowired
//	<bean id="printer" class="iaccess.di.ui.MonoPrinter"></bean> =  Printer printer
	public Hello(Printer printer) {
		System.out.println("생성자 인잭션");
		this.printer = printer;
	}
	
//	@Autowired
//	@Ignore
//	<property name="printer" ref="printer" />
	public void setPrinter(Printer printer) {
		System.out.println("Setter Method Printer Inject");
		this.printer = printer;
	}
	
	@Autowired
//	<property name="printer" ref="printer" />
	public void norMalPrinter(Printer printer) {
		System.out.println("특정 메소드 인젝션 : ");
		this.printer = printer;
	}
	public Printer getPrinter() {
		return printer;
	}
	
	public void print(String s) {
		printer.print(s);
	}
	
	

	
	
	
}
