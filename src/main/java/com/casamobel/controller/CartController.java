package com.casamobel.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.casamobel.dao.CartDAO;
import com.casamobel.dao.NewUserDAO;
import com.casamobel.dao.ProductDao;
import com.casamobel.model.Address;
import com.casamobel.model.Cart;
import com.casamobel.model.NewUser;
import com.casamobel.model.Product;
import com.google.gson.Gson;


@Controller
public class CartController 
{
	@Autowired
	CartDAO dao1;
	
	@Autowired
	ProductDao dao;
	
	@Autowired
	NewUserDAO n;

	@RequestMapping(value="/payment",method = RequestMethod.GET)
	public String payment(HttpSession session,Model M) 
	{
		return "payment";
	}
	
	public int getGrandTotal(ArrayList<Cart> item)
	{
		int gtotal=0;
		ListIterator<Cart> itr=item.listIterator();
		while(itr.hasNext())
		{
			Cart ob=(Cart)itr.next();	
			gtotal=gtotal+(ob.getQty()*ob.getPrice());
		}
		return gtotal;
	}
	
	@RequestMapping(value="/billingAddress",method = RequestMethod.GET)
	public ModelAndView billingAddress(HttpSession session)
	{
		String UserName=session.getAttribute("UserId").toString();
		System.out.println(UserName);
		NewUser user=n.getdetails(UserName);
		Address a=new Address();
		a.setName(user.getName());
		a.setNumber(user.getMobilenumber());
		a.setEmail(user.getEmailid());
		ModelAndView mv=new ModelAndView("billingAddress","Address",a);
		return mv;
	}	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/checkout",method = RequestMethod.POST)
	public String checkout(HttpSession session,Address a,Model M) 
	{
		ArrayList<Cart> cartobj=(ArrayList<Cart>)session.getAttribute("mycart");
		Gson g=new Gson();
		String l=g.toJson(cartobj);
		M.addAttribute("cart", l);
		session.setAttribute("mycart", cartobj);
		String l1=g.toJson(a);
		System.out.println(l1);
		M.addAttribute("user", l1);		
		session.setAttribute("userdetails1",a);
		session.setAttribute("userdetails",l1);
		session.setAttribute("gtotal",getGrandTotal(cartobj));
		return "checkout";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/addcart",method = RequestMethod.GET)
	public String addCart(@RequestParam("adpid")int id,HttpSession session,Model M) 
	{
		Product p=dao.viewProduct(id);
		Cart c=new Cart();
		c.setPid(p.getPid());
		c.setPname(p.getPname());
		c.setPrice(p.getPrice());
		c.setQty(1);
		c.setTotal(p.getPrice()); 
		ArrayList<Cart> cartobj=(ArrayList<Cart>)session.getAttribute("mycart");
		cartobj.add(c);
		Gson g=new Gson();
		String l=g.toJson(cartobj);
		session.setAttribute("mycart", cartobj);
		M.addAttribute("cart", l);
		M.addAttribute("cartitem",cartobj);
		session.setAttribute("gtotal",getGrandTotal(cartobj));
		return "cart";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cart",method = RequestMethod.GET)
	public ModelAndView showCart(HttpSession session) 
	{
		ArrayList<Cart> ld=(ArrayList<Cart>)session.getAttribute("mycart");
		session.setAttribute("mycart",ld);
		ModelAndView mv = new ModelAndView("cart", "cart", new Cart());
		Gson gsonli = new Gson();
		String gs = gsonli.toJson(ld);
		mv.addObject("cart",gs);
		mv.addObject("cartitem",ld);
		session.setAttribute("gtotal",getGrandTotal(ld));
		return mv;
		
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/removeitem",method = RequestMethod.GET)
	public ModelAndView removeCart(@RequestParam("pid") int id,HttpSession session) 
	{
		ArrayList<Cart> ld=(ArrayList<Cart>)session.getAttribute("mycart");
		ListIterator<Cart> lit=(ListIterator<Cart>) ld.listIterator();
		while(lit.hasNext())
		{
		Cart d=lit.next();
		if(d.getPid()==id)
		{
		ld.remove(ld.indexOf(d));
		break;
		}
		}
		session.setAttribute("mycart",ld);
		ModelAndView mv = new ModelAndView("cart", "cart", new Cart());
		Gson gsonli = new Gson();
		String gs = gsonli.toJson(ld);
		mv.addObject("cart",gs);
		mv.addObject("cartitem",ld);
		session.setAttribute("gtotal",getGrandTotal(ld));
		return mv;
	}

}
