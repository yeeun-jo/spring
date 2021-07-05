package iaccess.di;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import iaccess.di.entity.Hello;
import iaccess.di.ui.ColorPrinter;
import iaccess.di.ui.MonoPrinter;

@ComponentScan({"iaccess.di.ui, iaccess.di.entity"})
@Configuration	// 설정파일 이라는 뜻
public class Iass_di_config {

}
