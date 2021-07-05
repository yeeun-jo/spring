package iaccess.di.entity;

import iaccess.di.ui.Printer;

public class Hello {
	private Printer printer;

	public void setPrinter(Printer printer) {
		this.printer = printer;
	}

	public void print(String s) {
		printer.print(s);
	}
	
}
