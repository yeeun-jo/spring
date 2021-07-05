package co.kr.mono.aop.ui;

public class MonoPrinter implements Printer{

	public void print(String s) {
		System.out.println("====== Mono Print Start ======");
		System.out.println(s);
		System.out.println("====== Mono Print End ======");
	}

}
