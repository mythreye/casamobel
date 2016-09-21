package com.casamobel.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.casamobel.model.Seller;


@Repository
public class SellerDAO 
{

	@Autowired
	SessionFactory sessionFactory;
	
	public void addSeller(Seller samplecat)
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
	
	public List showSeller()
	{
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		List showcat = s.createQuery("from Seller").list();
		tx.commit();
		s.flush();
		s.clear();
		s.close();return showcat;
	}
	public void deleteSeller(int samplecat)
	{
		Session session = sessionFactory.openSession();
	      Transaction tx = session.getTransaction();
	      tx.begin();
	      Seller c=(Seller)session.get(Seller.class,samplecat);
	        System.out.println(c);
	         session.delete(c); 
	         tx.commit();
	         session.flush();
	         session.clear();
	         session.close();
	}
	public Seller viewSeller(int samplecat)
	{
		Session session = sessionFactory.openSession();
	      Transaction tx = session.getTransaction();
	      tx.begin();
	      Seller c=(Seller)session.get(Seller.class,samplecat);
	                 tx.commit();
	                 session.flush();
	                 session.clear();
	                 session.close();
	         return c;
	 }
	
	public void updateSeller(Seller samplecat)
	{
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		Seller c=(Seller)s.get(Seller.class,samplecat.getSellerid());
		   c.setSellername(samplecat.getSellername());
		   c.setSelleraddress(samplecat.getSelleraddress());
		   c.setSellerphone(samplecat.getSellerphone());
		;	s.update(c);
				tx.commit();
				s.flush();
				s.clear();
				s.close();
	}
	


}
