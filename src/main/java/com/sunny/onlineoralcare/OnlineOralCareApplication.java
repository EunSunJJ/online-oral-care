package com.sunny.onlineoralcare;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@SpringBootApplication
public class OnlineOralCareApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineOralCareApplication.class, args);
	}

}
