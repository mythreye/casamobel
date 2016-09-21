package com.casamobel.dao;

import java.util.List;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.casamobel.model.Catagory;
import com.google.gson.Gson;

@Repository
public class CatagoryDAO 
{
	@Autowired
	SessionFactory sessionFactory;
	
	public void addCatagory(Catagory samplecat)
	{
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		s.save(samplecat);
		tx.commit();
		s.flush();
		s.clear();
		s.close();
	}	
	
	public List showCatagory()
	{
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		List showcat = s.createQuery("FROM Catagory").list();
		tx.commit();
		s.flush();
		s.clear();
		s.close();
		return showcat;
	}
	public void deleteCatagory(int samplecat)
	{
		Session s = sessionFactory.openSession();
	      Transaction tx = s.getTransaction();
	      tx.begin();
	        Catagory c=(Catagory)s.get(Catagory.class,samplecat);
	        System.out.println(c);
	         s.delete(c); 
	         tx.commit();
	         s.flush();
	 		s.clear();
	 		s.close();
	}
	public Catagory viewCatagory(int samplecat)
	{
		Session s = sessionFactory.openSession();
	      Transaction tx = s.getTransaction();
	      tx.begin();
	        Catagory c=(Catagory)s.get(Catagory.class,samplecat);
	                 tx.commit();
	                 s.flush();
	         		s.clear();
	         		s.close();
	         return c;
	 }
	
	public void updateCatagory(Catagory samplecat)
	{
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		   Catagory c=(Catagory)s.get(Catagory.class,samplecat.getCatagoryid());
		   c.setCatagoryname(samplecat.getCatagoryname());
		   c.setDescription(samplecat.getDescription());
			s.update(c);
		tx.commit();
		s.flush();
		s.clear();
		s.close();
	}
	
}
