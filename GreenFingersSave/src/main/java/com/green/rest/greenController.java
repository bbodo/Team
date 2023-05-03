package com.green.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.green.menus.service.MenuService;
import com.green.menus.vo.SubmenuVo;

@RestController
@RequestMapping("/Data")
public class greenController {

	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/Green")
	public  String  galmaetgil() {
		return "redirect:/static/html/green.html";
	}
	
	@RequestMapping(value= {"/List", "List/{menu_id}"})
	public List<SubmenuVo> getSubmenusList(
			@PathVariable(required = false) String menu_id) {
		System.out.println(menu_id);
		HashMap<String, Object> map = new HashMap<>();
		map.put("menu_id", menu_id);
		List<SubmenuVo> submenuList = menuService.getSubmenuList(map);
		System.out.println(submenuList);
		
		
		return submenuList;
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
