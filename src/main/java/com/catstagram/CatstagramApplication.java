package com.catstagram;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan(basePackages = "com.catstagram.mapper")
@SpringBootApplication
public class CatstagramApplication extends SpringBootServletInitializer {
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(CatstagramApplication.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(CatstagramApplication.class, args);
	}
}