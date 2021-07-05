package iaccess.di.entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import iaccess.di.ui.Printer;
@Component("hello")
public class Hello {
	
	@Autowired
	@Qualifier("monoPrinter")
	private Printer printer;

	public Hello() {}
	
	public void print(String s) {
		printer.print(s);
	}
	
	
	
	

	
	
	
}
