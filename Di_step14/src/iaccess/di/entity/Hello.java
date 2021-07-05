package iaccess.di.entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import iaccess.di.ui.Printer;

public class Hello {
	
	private Printer printer;

	public Hello(Printer p) {
		System.out.println("생성자 1개 호출 ");
		this.printer = p;
	}
	
	public void print(String s) {
		printer.print(s);
	}
	
	
	
	

	
	
	
}
