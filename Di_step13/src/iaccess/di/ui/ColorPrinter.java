package iaccess.di.ui;

import org.springframework.stereotype.Component;

@Component("colorPrinter")
public class ColorPrinter implements Printer{

	@Override
	public void print(String s) {
		System.out.println("====== Color Print Start ======");
		System.out.println(s);
		System.out.println("====== Color Print End ======");
	}

}
