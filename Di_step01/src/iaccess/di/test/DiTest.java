package iaccess.di.test;

import iaccess.di.entity.Hello;
import iaccess.di.ui.ColorPrinter;
import iaccess.di.ui.MonoPrinter;
import iaccess.di.ui.Printer;

public class DiTest {

	public static void main(String[] args) {
		Hello hello = new Hello();
//		Printer printer = new ColorPrinter();
		Printer printer = new MonoPrinter();
		
		hello.setPrinter(printer);
		hello.print("Hello Spring");
	}
}
