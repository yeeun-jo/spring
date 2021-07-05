package co.kr.mono.aop.ui;

public class ColorPrinter implements Printer{

	public void print(String s) {
		System.out.println("====== Color Print Start ======");
		System.out.println(s);
		System.out.println("====== Color Print End ======");
	}

}
