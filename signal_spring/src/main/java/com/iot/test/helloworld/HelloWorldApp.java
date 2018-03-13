package com.iot.test.helloworld;

import org.kurento.client.KurentoClient;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * Hello World (WebRTC in loobpack) main class.
 *
 * @author Boni Garcia (bgarcia@gsyc.es)
 * @since 5.0.0
 */
//@SpringBootApplication
//@EnableWebSocket
public class HelloWorldApp implements WebSocketConfigurer {

  @Bean
  public HelloWorldHandler handler() {
    return new HelloWorldHandler();
  }

  @Bean
  public KurentoClient kurentoClient() {
    return KurentoClient.create("ws://13.125.108.31:8888/kurento");
  }

  @Override
  public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    registry.addHandler(handler(), "/helloworld");
  }

  public static void main(String[] args) throws Exception {
    new SpringApplication(HelloWorldApp.class).run(args);
  }
}