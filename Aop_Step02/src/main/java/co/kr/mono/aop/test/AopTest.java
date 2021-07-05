package co.kr.mono.aop.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import co.kr.mono.aop.entity.Person;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:co/kr/mono/aop/test/config.xml")

public class AopTest {
	
	@Autowired
	ApplicationContext context;
	public static String loginName = "조예은";
	
	@Test
	public void bean1() {
		
		// <aop:before> : 메서드 실행 전에 적용되는 어드바이스를 정의
		System.out.println(context.toString());
		
		// 2. getBean()호출
		Person person = context.getBean(Person.class);
		person.print();
	}

}
