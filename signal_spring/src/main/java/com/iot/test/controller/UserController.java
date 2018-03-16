package com.iot.test.controller;


import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping(value="/login", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody Map<String,Object> login(@RequestBody Map<String,Object> tMap) {
		System.out.println(tMap);
        return tMap;
    }
	
	@RequestMapping("/signup")
    public String signup(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "user/signup";
    }
	
	
}
