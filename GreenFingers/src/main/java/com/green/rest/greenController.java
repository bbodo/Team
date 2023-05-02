package com.green.rest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.green.rest.service.greenService;

@Controller
public class greenController {

	
	@RequestMapping("/Green")
	public  String  galmaetgil() {
		return "redirect:/static/html/green.html";
	}
	
	@RequestMapping("service")
	@ResponseBody
	public  void service(
		String   keyword,
		HttpServletResponse  response) {
		
		RestTemplate restTemplate = new RestTemplate();
		String url = "https://www.example.com/api/books"; // API 엔드포인트
		String xmlString = restTemplate.getForObject(url, String.class);
		
	}
}
