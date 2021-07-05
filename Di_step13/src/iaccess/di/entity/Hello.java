package iaccess.di.entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import iaccess.di.ui.Printer;

@Component("hello")
public class Hello {
	
	@Autowired
	@Qualifier("colorPrinter")
	private Printer printer;
	
	@Value("#{'SPRING'+ ' EL ' }")
	String name;
	
	
	public void print(String s) {
		if(name == null) printer.print(s);
		else printer.print(name+" " + s);
	}
	
	

	
	
	
}
