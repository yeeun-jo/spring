package iaccess.di.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;

import org.junit.Test;
import org.junit.experimental.categories.Categories.IncludeCategory;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import iaccess.di.entity.Hello;
import iaccess.di.entity.Person;
import iaccess.di.ui.Printer;
import jdk.nashorn.internal.ir.annotations.Ignore;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:iaccess/di/test/config.xml")
public class JunitExam {

	@Autowired
	ApplicationContext context;
	
	@Test
	public void bean1() {
		Hello hello = context.getBean(Hello.class);
		hello.print("hello");
		System.out.println();
		
		
		// Hello LIST
		System.out.println("-------hello name list -----------");
		List<String> list = hello.getNames();
		
		// 람다
		Consumer<String> nmList = s-> System.out.println(s);
		list.forEach(nmList);
		System.out.println("-------hello name list -----------");

		// 확장 for
		for(String value : list) {
//			nmList.accept(value);
			System.out.println(value);
		}
		System.out.println("-----------------------");

		// Iterator
		Iterator<String> lst = list.iterator();
		while(lst.hasNext()) {
			System.out.println(lst.next());
		}
		
		System.out.println("-----------------------");
		
		// person List정렬
		List<Person> persons = hello.getPersons();
		System.out.println("-------person name sort before ----------");
		persons.forEach(row -> System.out.println(row.getName() + " : "  + row.getAge()));
		
		Collections.sort(persons);
		
		System.out.println("-------person name sort after -----------");
		persons.forEach(row -> System.out.println(row.getName()+ " : "  + row.getAge()));

		System.out.println("----------------------------------------");
		
		// Map
		Map<String, Integer> ages = hello.getAges();
		for (Map.Entry<String, Integer> entry : ages.entrySet()) {
			System.out.println("Key : " + entry.getKey() + ", Value : "+ entry.getValue());
		}
		System.out.println("----------------------------------------");
		
		// Set
		Set<String> hs = hello.getEmails();
		Iterator<String> hi = hs.iterator();
		
		// 중복제거
		while(hi.hasNext()) {
			System.out.println(hi.next());
		}
		
		for(String s : hs) {
			System.out.println(s);
		}
		System.out.println("-------------");
		
	}
	
	@Test
	public void bean2() {
		System.out.println("컨테이너 : " + context);
		System.out.println("bean2(): "+ this);
		
		Printer printer = (Printer) context.getBean("printer");
		Printer printer2 = context.getBean(Printer.class);
		
		// Same :같은 주소 = 같은 객체 = 객체가 하나 생성됨 => 싱글톤(인스턴스변수를 두지않음)
		// 싱글톤패턴을 만들 때 에는 상태변수를 만들면 안된다.
		// 데이터의 일관성이 깨짐 => 동기화 시켜야됨
		assertSame(printer, printer2);
		
	}

}
