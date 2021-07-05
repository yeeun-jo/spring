package iaccess.di.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import iaccess.di.entity.Hello;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:iaccess/di/test/config.xml")
public class JunitExam {

	@Autowired
	ApplicationContext context;
	
	@Test
	public void bean1() {
		
		Hello hello = context.getBean(Hello.class);
		hello.printString();
//		hello.print("hello");
		
		
		
		
	}
	

}
