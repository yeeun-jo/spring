package iaccess.di.entity;

import iaccess.di.ui.Printer;

public class Hello {
	
	private Printer printer;
	private String name = "";

	public Hello() {
	}

	public Hello(Printer printer, String name) {
		this.printer = printer;
		this.name = name;
	}
	
	public Hello(Printer printer) {
		this.printer = printer;
	}
	
	public Printer getPrinter() {
		return printer;
	}

	public void setPrinter(Printer printer) {
		this.printer = printer;
	}

	public void print(String s) {
		if(this.name != null) 
			printer.print(this.name + " " + s);
		else 
			printer.print(s);
	}
	
	
	
}
