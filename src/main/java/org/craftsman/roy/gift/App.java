package org.craftsman.roy.gift;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * 
 * @author luoyh
 * @date Mar 18, 2017
 */
@SpringBootApplication
public class App extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(App.class);
	}
	
	public static final int OK = 200;
	public static final int ERR = 500;
	public static final String JSESSION_TOKEN = "auth_session";
	
	public static void main(String[] args) {
		SpringApplication.run(App.class, args);
	}
}
