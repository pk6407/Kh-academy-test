package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.example.domain.User;
import com.example.repository.UserRepository;

@SpringBootApplication
public class SpringMybatisExampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringMybatisExampleApplication.class, args);
	}

	@Autowired
	private UserRepository userRepository;
	
	@Bean
	public void test() {
		final int affectedRows = userRepository.deleteUser(1);
		System.out.println(affectedRows);
	}
}
