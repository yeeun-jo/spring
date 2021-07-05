package iaccess.di.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import iaccess.di.entity.Hello;
import iaccess.di.ui.Printer;
import jdk.nashorn.internal.ir.annotations.Ignore;

public class JunitExam {

	ApplicationContext context;
	
	@Before
	public void init() {
		// IoC컨테이너를 생성
		// 1. ApplicationContext 객채 생성
		context = new ClassPathXmlApplicationContext("iaccess/di/test/config.xml");
		System.out.println("\n컨테이너 생성 "+ this);
	}
	
	@Test
	public void bean1() {
		System.out.println("bean1 method : "+ this);
		
		Hello hello = context.getBean(Hello.class);
		assertEquals("SPRING", hello.getName());
		
		hello.print("hello");
	}
	
	@Test
	public void bean2() {
		System.out.println("bean2 method : "+ this);
		
		Printer printer = (Printer) context.getBean("printer");
		Printer printer2 = context.getBean(Printer.class);
		
		// Same :같은 주소 = 같은 객체 = 객체가 하나 생성됨 => 싱글톤(인스턴스변수를 두지않음)
		// 싱글톤패턴을 만들 때 에는 상태변수를 만들면 안된다.
		// 데이터의 일관성이 깨짐 => 동기화 시켜야됨
		assertSame(printer, printer2);
		
	}

}
