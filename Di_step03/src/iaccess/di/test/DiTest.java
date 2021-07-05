package iaccess.di.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import iaccess.di.entity.Hello;

public class DiTest {

	public static void main(String[] args) {
//		Hello hello = new Hello();
//		Printer printer = new ColorPrinter();
//		Printer printer = new MonoPrinter();
//		
//		hello.setPrinter(printer);
//		hello.print("Hello Spring");

		ApplicationContext ctx = new GenericXmlApplicationContext("iaccess/di/test/config.xml");
		// GenericXmlApplicationContext 가 ApplicationContext를 구현받기 때문에 applicationContext에 넣을 수 있음
		
		Hello hello = ctx.getBean(Hello.class);
		hello.print("Hello");
		
	
	}
}
