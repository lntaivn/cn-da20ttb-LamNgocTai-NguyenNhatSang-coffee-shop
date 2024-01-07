package com.lntai.coffee;

import com.lntai.coffee.request.RegisterRequest;
import com.lntai.coffee.service.AuthenticationService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import static com.lntai.coffee.entity.Role.ADMIN;
import static com.lntai.coffee.entity.Role.USER;

@SpringBootApplication
public class CoffeeApplication {

	public static void main(String[] args) {
		SpringApplication.run(CoffeeApplication.class, args);
	}

//	@Bean
//	public CommandLineRunner commandLineRunner(
//			AuthenticationService service
//	) {
//		return args -> {
//			var admin = RegisterRequest.builder()
//					.username("Admin")
//					.address("Admin")
//					.email("admin@gmail.com")
//					.password("password")
//					.role(ADMIN)
//					.build();
//			System.out.println("Admin token: " + service.register(admin).getAccessToken());
//
//			var manager = RegisterRequest.builder()
//					.username("tai")
//					.address("Trà Vinh")
//					.email("tai@gmail.com")
//					.password("password")
//					.role(USER)
//					.build();
//			System.out.println("USER token: " + service.register(manager).getAccessToken());
//
//		};
//	}

}
