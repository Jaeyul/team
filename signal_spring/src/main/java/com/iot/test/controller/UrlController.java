package com.iot.test.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UrlController {
	
	@RequestMapping("/welcome")
    public String index(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "index";
    }
	
	@RequestMapping("/login")
    public String login(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "user/login";
    }
	
	@RequestMapping("/signup")
    public String signup(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "user/signup";
    }
	
	@RequestMapping("/video")
    public String groupcall(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "groupcall";
    }


	

	
	

	
}
