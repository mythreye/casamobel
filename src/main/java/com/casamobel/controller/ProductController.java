package com.casamobel.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.casamobel.dao.ProductDao;
import com.casamobel.model.Catagory;
import com.casamobel.model.Product;
import com.casamobel.model.Seller;
import com.google.gson.Gson;

@Controller
public class ProductController
{
	@Autowired
	ProductDao dao;
	
	//--------------------adding product-----------------------
	
	@RequestMapping(value="/addproduct",method=RequestMethod.GET)
	public ModelAndView addproduct(Model m) 
	{
		String[] s=dao.showCatsell();
		System.out.println(s[0]);
		m.addAttribute("catlist",s[0]);
		m.addAttribute("selllist",s[1]);		
		ModelAndView mv=new ModelAndView("addproduct","prdt",new Product());
		return mv;

	}
	
	@RequestMapping(value="/addproduct",method=RequestMethod.POST)
	public ModelAndView addproduct(Model m,@ModelAttribute("prdt")Product prdt, HttpServletRequest request,RedirectAttributes attributes) 
	{
		System.out.println(prdt.getPid());
		dao.addproduct(prdt);
		
		String path="C:\\Users\\admin\\workspace\\casamobel1609\\src\\main\\webapp\\resources\\WebContent\\img\\";
		path=path+String.valueOf(prdt.getPid())+".jpg";
		System.out.println(path);
		File f=new File(path);
		MultipartFile filedet=prdt.getPimage();
		
		if(!filedet.isEmpty())
		{
			try
			{
			  byte[] bytes=filedet.getBytes();
			  System.out.println(bytes.length);
			  FileOutputStream fos=new FileOutputStream(f);
              			BufferedOutputStream bs=new BufferedOutputStream(fos);
              			bs.write(bytes);
              			bs.close();
             			 System.out.println("File Uploaded Successfully");
			}
			catch(Exception e)
			{
				System.out.println("Exception Arised"+e);
			}
		}
		else
		{
			System.out.println("File is Empty not Uploaded");
			
		}
		ArrayList list=(ArrayList)dao.showProduct();
		Gson gson = new Gson();
		String jsonInString = gson.toJson(list);
		m.addAttribute("list",jsonInString);
		ModelAndView mv=new ModelAndView("product","product",new Product());
		return mv;
	}
	//---------------Showing product-----------------
	
	@RequestMapping(value="/product")
	public ModelAndView viewCatagory1(Model m)
	{
		ArrayList list=(ArrayList)dao.showProduct();
		Gson gson = new Gson();
		String jsonInString = gson.toJson(list);
		m.addAttribute("list",jsonInString);
		ModelAndView mv=new ModelAndView("product","product",new Product());
		return mv;
	}
	
	@RequestMapping(value="/ppage")
	public ModelAndView userviewCatagory1(Model m)
	{
		ArrayList list=(ArrayList)dao.showProduct();
		Gson gson = new Gson();
		String jsonInString = gson.toJson(list);
		m.addAttribute("list",jsonInString);
		ModelAndView mv=new ModelAndView("productpage","product",new Product());
		return mv;
	}
	
		@RequestMapping(value="/delproduct",method=RequestMethod.GET)
	public ModelAndView DeleteCatagory(@RequestParam("id")int cid,Model m)
	{
		System.out.println(cid);
		dao.deleteproduct(cid);
		ArrayList list=(ArrayList)dao.showProduct();
		Gson gson = new Gson();
		String jsonInString = gson.toJson(list);
		m.addAttribute("list",jsonInString);
		ModelAndView mv=new ModelAndView("product","product",new Product());
		return mv;
	}
	

	@RequestMapping(value="/editproduct",method=RequestMethod.GET)
	public ModelAndView editcategory(@RequestParam("id")int cid,Model m) 
	{
		Product s=dao.viewProduct(cid);
		m.addAttribute("editproduct",s);
		ModelAndView mv=new ModelAndView("editproduct","editproduct1",new Product());
		return mv;

	}
	
	@RequestMapping(value="/editproduct",method=RequestMethod.POST)
	public ModelAndView editcategory(Product typepro,Model m) 
	{
		dao.updateCatagory(typepro);
		ArrayList list=(ArrayList)dao.showProduct();
		Gson gson = new Gson();
		String jsonInString = gson.toJson(list);
		m.addAttribute("list",jsonInString);
		ModelAndView mv=new ModelAndView("product","product",new Product());
		return mv;

	}
	
	@RequestMapping(value="/productdescription",method=RequestMethod.GET)
	public ModelAndView deleteSeller(@RequestParam("id")int cid,Model m)
	{
		System.out.println(cid);
		Product p=dao.getproductdata(cid);
		Gson gson = new Gson();
		String list=gson.toJson(p);
		System.out.println(list);
		m.addAttribute("list1",list);
		ModelAndView mv=new ModelAndView("productdescription","product",new Product());
		return mv;
	}

}
