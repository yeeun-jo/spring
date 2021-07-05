package iaccess.di.ui;

import org.springframework.stereotype.Component;

@Component("monoPrinter")	// ()안에 이름을 안쓸경우 클래스이름 시작을 소문자로 주면 됨
public class MonoPrinter implements Printer{

	@Override
	public void print(String s) {
		System.out.println("====== Mono Print Start ======");
		System.out.println(s);
		System.out.println("====== Mono Print End ======");
	}

}
