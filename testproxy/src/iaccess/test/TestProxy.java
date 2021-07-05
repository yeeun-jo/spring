package iaccess.test;

import iaccess.di.ui.ColorPrinter;
import iaccess.di.ui.Printer;
import iaccess.di.ui.ProxyPrinter;

public class TestProxy {
	public static void main(String[] args) {
		Printer p = new ProxyPrinter(new ColorPrinter());
		p.print("Hello");
		
	}


}
