package com.example.demo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(
    methods = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE},
    exposedHeaders = {
      "Access-Control-Allow-Origin",
      "Access-Control-Allow-Credentials"
    }) // https://spring.io/guides/gs/rest-service-cors/
// https://reflectoring.io/spring-cors/
public class MainController {
      @GetMapping(path = "")
  public String helloWorld() {
    return "Hello World";
  }
}
