package com.casamobel.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.casamobel.model.Catagory;
import com.casamobel.model.Product;
import com.google.gson.Gson;

@Repository
public class ProductDao 
{
	@Autowired
	SessionFactory sessionFactory;
	
	public void addproduct(Product samplecat)
	{
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		s.save(samplecat);
		System.out.println(s);
		tx.commit();
		s.flush();
		s.clear();
		s.close();
	}
	
	public String[] showCatsell()
	{
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		List showcat = s.createQuery("FROM Catagory").list();
		List showsel = s.createQuery("FROM Seller").list();
		tx.commit();
		s.flush();
		s.clear();
		s.close();
		Gson g=new Gson();
		String[] cat=new String[2];
		cat[0]=g.toJson(showcat);
		cat[1]=g.toJson(showsel);
		return cat;
	}
	public List showProduct()
	{
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		List showcat = s.createQuery("FROM Product").list();
		tx.commit();
		s.flush();
		s.clear();
		s.close();
		return showcat;
	}
	public void deleteproduct(int samplecat)
	{
		Session s = sessionFactory.openSession();
	      Transaction tx = s.getTransaction();
	      tx.begin();
	      Product c=(Product)s.get(Product.class,samplecat);
	        System.out.println(c);
	         s.delete(c); 
	         tx.commit();
	         s.flush();
	 		s.clear();
	 		s.close();
	}
	
	public Product getproductdata(int samplecat)
	{
		Session s = sessionFactory.openSession();
	      Transaction tx = s.getTransaction();
	      tx.begin();
	      Product c=(Product)s.get(Product.class,samplecat);
	        System.out.println(c);
	         tx.commit();
	         s.flush();
	 		s.clear();
	 		s.close();
	 		return c;
	}
	
	public Product viewProduct(int samplecat)
	{
		Session s = sessionFactory.openSession();
	      Transaction tx = s.getTransaction();
	      tx.begin();
	      Product c=(Product)s.get(Product.class,samplecat);
	                 tx.commit();
	                 s.flush();
	         		s.clear();
	         		s.close();
	         return c;
	 }
	
	public void updateCatagory(Product samplecat)
	{
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		Product c=(Product)s.get(Product.class,samplecat.getPid());
		c.setQuantity(samplecat.getQuantity());
		   c.setPrice(samplecat.getPrice());
			s.update(c);
		tx.commit();
		s.flush();
		s.clear();
		s.close();
		
	}
}
