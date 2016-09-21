package com.casamobel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class pageController 
{

	//--------------------------About us page------------------------------------
	@RequestMapping("/about")
	public String showAboutUs() 
	{
	System.out.println("about us");
	return "about";
	}
	
	
	//--------------------------Contact us page------------------------------------
	@RequestMapping("/contactus")
	public String showContactUs() 
	{
	System.out.println("ContactUs");
	return "contactus";
	}
		
}
