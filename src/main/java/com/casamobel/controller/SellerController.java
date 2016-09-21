package com.casamobel.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.casamobel.dao.SellerDAO;
import com.casamobel.model.Seller;
import com.google.gson.Gson;

@Controller
public class SellerController 
{
	@Autowired
	SellerDAO d;
	
	public String getdata()
	{
		ArrayList list=(ArrayList) d.showSeller();
		Gson gson = new Gson();
		String jsonInString = gson.toJson(list);
		return jsonInString;
	}
	
	@RequestMapping(value="/seller",method=RequestMethod.GET)
	public ModelAndView viewseller1(Model m)
	{
		m.addAttribute("list",getdata());
		ModelAndView mv=new ModelAndView("seller","seller",new Seller());
		return mv;
	}

	@RequestMapping(value="/addseller",method=RequestMethod.GET)
	public ModelAndView addseller(Model m) 
	{
		System.out.print("error");
		ModelAndView mv=new ModelAndView("addseller","seller",new Seller());
		return mv;

	}
	
	@RequestMapping(value="/addsellerpost",method=RequestMethod.POST)
	public ModelAndView addseller(Seller typepro,Model m) 
	{
		d.addSeller(typepro);
		m.addAttribute("list",getdata());
		ModelAndView mv=new ModelAndView("seller","seller",new Seller());
		return mv;
	}
	
	@RequestMapping(value="/delseller",method=RequestMethod.GET)
	public ModelAndView deleteSeller(@RequestParam("id")int cid,Model m)
	{
		d.deleteSeller(cid);
		m.addAttribute("list",getdata());
		ModelAndView mv=new ModelAndView("seller","seller",new Seller());
		return mv;
	}
	

	@RequestMapping(value="/editseller",method=RequestMethod.GET)
	public ModelAndView editSeller(@RequestParam("id")int cid,Model m) 
	{
		
		Seller s=d.viewSeller(cid);
		m.addAttribute("list",s);
		ModelAndView mv=new ModelAndView("editseller","editseller",new Seller());
		return mv;

	}
	
	@RequestMapping(value="/editseller",method=RequestMethod.POST)
	public ModelAndView editSeller(Seller typepro,Model m) 
	{
		d.updateSeller(typepro);
		m.addAttribute("list",getdata());
		ModelAndView mv=new ModelAndView("seller","seller",new Seller());
		return mv;

	}
}
