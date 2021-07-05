package iaccess.di;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import iaccess.di.entity.Hello;
import iaccess.di.ui.ColorPrinter;
import iaccess.di.ui.MonoPrinter;

@Configuration	// 설정파일 이라는 뜻
public class Iass_di_config {

	@Bean
	public Hello hello() {
		return new Hello(colorPrinter());
	}
	
	@Bean
	public ColorPrinter colorPrinter() {
		return new ColorPrinter();
	}
	
	@Bean
	public MonoPrinter monoPrinter() {
		return new MonoPrinter();
	}
}
