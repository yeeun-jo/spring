package iaccess.di.entity;


import javax.annotation.Resource;

import org.junit.Ignore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import iaccess.di.ui.Printer;

public class Hello {
	
	private Printer printer;
	
	public Hello() {
	}
	
	public Hello(Printer printer) {
		this.printer = printer;
	}
	
//	@Autowired	// 타입을 통해서 주입해준다
//	@Qualifier("monoPrinter")	// 두개 이상의 같은 타입이 있을 때 지정한 타입의 이름을 넣어준다!
	@Resource(name = "colorPrinter")	// 이름을 반드시 지정해줘야함 = 이름을 통해서 주입해준다
	public void setPrinter(Printer printer) {
		this.printer = printer;
	}
	
	public Printer getPrinter() {
		return printer;
	}
	
	public void print(String s) {
		printer.print(s);
	}
	
	

	
	
	
}
