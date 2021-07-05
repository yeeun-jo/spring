package iaccess.di.test;

import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import iaccess.di.entity.Hello;
import iaccess.di.entity.Person;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:iaccess/di/test/config.xml")
public class JunitExam {

	@Autowired
	ApplicationContext context;
	
	@Test
	public void bean1() {
		Hello hello = context.getBean(Hello.class);
		
		List<Person> persons = hello.getPersons();
		Collections.sort(persons);
		
		// 1.
		for(Person p : persons) {
			System.out.println(p.getName());
		}
		System.out.println();
		
//		for(Person p : persons) {
//			System.out.println(p.getName() + " | " + p.getAge());
//		}
		
		Consumer<Person> personList = p -> System.out.println(p.getName() + " | " + p.getAge());
		persons.forEach(personList);
		
	}
	

}
