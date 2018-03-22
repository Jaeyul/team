package com.iot.test;

import org.kurento.client.KurentoClient;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.iot.test.groupcall.CallHandler;
import com.iot.test.groupcall.RoomManager;
import com.iot.test.groupcall.UserRegistry;

@SpringBootApplication
@EnableWebSocket
public class Test2Application implements WebSocketConfigurer{

	@Bean
	public UserRegistry registry() {
		return new UserRegistry();
	}

	@Bean
	public RoomManager roomManager() {
		return new RoomManager();
	}

	@Bean
	public CallHandler groupCallHandler() {
		return new CallHandler();
	}

	@Bean
	public KurentoClient kurentoClient() {
		return KurentoClient.create("wss://13.125.108.31:8433/kurento");
	}

	public static void main(String[] args) {
		SpringApplication.run(Test2Application.class, args);
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(groupCallHandler(), "/groupcall");
	}
}
