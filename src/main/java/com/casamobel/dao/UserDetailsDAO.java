package com.casamobel.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.casamobel.model.NewUser;
import com.casamobel.model.UserDetails;

@Repository
public class UserDetailsDAO 
{
	@Autowired
	SessionFactory sessionFactory;

	public void updatePassword(String user,String password)
	{
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		UserDetails c = (UserDetails) s.get(UserDetails.class, user);
		c.setPassword(password);
		System.out.println(c.getPassword());
		s.update(c);
		tx.commit();
		s.flush();
		s.clear();
		s.close();
	}
	
	public String modifyPassword(String user,String opassword,String npassword)
	{
		String p;
		Session s=sessionFactory.openSession();
		Transaction tx=s.getTransaction();
		tx.begin();
		UserDetails c = (UserDetails) s.get(UserDetails.class, user);
		if(opassword.equals(c.getPassword()))
		{
			c.setPassword(npassword);			
			s.update(c);
			p="PasswordChanged";
			
		}
		else
		{
			p="PasswordNotChanged";
		}
		tx.commit();
		s.flush();
		s.clear();
		s.close();
		return p;
	}

}
