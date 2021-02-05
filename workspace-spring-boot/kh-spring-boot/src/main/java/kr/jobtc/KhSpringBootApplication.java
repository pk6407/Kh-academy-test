package kr.jobtc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy
public class KhSpringBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(KhSpringBootApplication.class, args);
	}

}
