package com.catstagram;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ConfigurableApplicationContext;

@MapperScan(basePackages = "com.catstagram.mapper")
@SpringBootApplication
public class CatstagramApplication extends SpringBootServletInitializer {
	
//	public CatstagramApplication() {
//		
//	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(CatstagramApplication.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(CatstagramApplication.class, args);
	}
}