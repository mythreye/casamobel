package com.casamobel.controller;

import java.util.ArrayList;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.casamobel.dao.CatagoryDAO;
import com.casamobel.model.Catagory;
import com.casamobel.model.Login;
import com.google.gson.Gson;

import antlr.collections.List;

@Controller
public class CatagoryController
{
	@Autowired
	CatagoryDAO d;
	
	public String getdata()
	{
		ArrayList list=(ArrayList) d.showCatagory();
		Gson gson = new Gson();
		String jsonInString = gson.toJson(list);
		return jsonInString;
	}
	
	@RequestMapping(value="/catagory",method=RequestMethod.GET)
	public ModelAndView viewCatagory1(Model m)
	{
		m.addAttribute("list",getdata());
		ModelAndView mv=new ModelAndView("catagory","catagory",new Catagory());
		return mv;
	}

	@RequestMapping(value="/addcatagory",method=RequestMethod.GET)
	public ModelAndView addcategory(Model m) 
	{
		ModelAndView mv=new ModelAndView("addcatagory","catagory",new Catagory());
		return mv;

	}
	
	@RequestMapping(value="/addcatagory",method=RequestMethod.POST)
	public ModelAndView addcategory(Catagory typepro,Model m) 
	{
		d.addCatagory(typepro);
		m.addAttribute("list",getdata());
		ModelAndView mv=new ModelAndView("catagory","catagory",new Catagory());
		return mv;
	}
	
	@RequestMapping(value="/delcatagory",method=RequestMethod.GET)
	public ModelAndView DeleteCatagory(@RequestParam("id")int cid,Model m)
	{
		d.deleteCatagory(cid);
		m.addAttribute("list",getdata());
		ModelAndView mv=new ModelAndView("catagory","catagory",new Catagory());
		return mv;
	}
	

	@RequestMapping(value="/editcatagory",method=RequestMethod.GET)
	public ModelAndView editcategory(@RequestParam("id")int cid,Model m) 
	{
		Catagory s=d.viewCatagory(cid);
		m.addAttribute("catagory",s);
		ModelAndView mv=new ModelAndView("editcatagory","editcatagory",new Catagory());
		return mv;

	}
	
	@RequestMapping(value="/editcatagory",method=RequestMethod.POST)
	public ModelAndView editcategory(Catagory typepro,Model m) 
	{
		d.updateCatagory(typepro);
		m.addAttribute("list",getdata());
		ModelAndView mv=new ModelAndView("catagory","catagory",new Catagory());
		return mv;

	}


}