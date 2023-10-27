package com.catstagram;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(basePackages = "com.catstagram.mapper")
@SpringBootApplication
public class CatstagramApplication {

	public static void main(String[] args) {
		SpringApplication.run(CatstagramApplication.class, args);
	}

}
