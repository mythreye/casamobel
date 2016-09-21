package com.casamobel.controller;

import java.util.*;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.casamobel.dao.CartDAO;
import com.casamobel.dao.NewUserDAO;
import com.casamobel.dao.ProductDao;
import com.casamobel.dao.UserDetailsDAO;
import com.casamobel.model.*;
import com.google.gson.Gson;
import com.sun.swing.internal.plaf.synth.resources.synth_sv;

@Controller
public class LoginController
{
	@Autowired
	NewUserDAO dao;

	@Autowired
	UserDetailsDAO dao1;

	@Autowired
	ProductDao da;

	@Autowired
	CartDAO c;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/sendEmail", method = RequestMethod.GET)
	public String doSendEmail(HttpServletRequest request) {
		try {
			System.out.println("Done Danna Dan");
			// takes input from e-mail form
			String recipientAddress = request.getParameter("email");
			String fname = request.getParameter("yourname");
			String subject = request.getParameter("message");
			String message = request.getParameter("comments");
			String finalmessage = "Hi  Admin" + ", " + " " + message;
			SimpleMailMessage email = new SimpleMailMessage();
			email.setTo(recipientAddress);
			email.setSubject(subject);
			email.setText(finalmessage);
			// sends the e-mail
			mailSender.send(email);
			System.out.println("Done Danna Dan");
			// forwards to the view named "Result"
		} catch (Exception x) {
			System.out.println(x);
		}

		return "login";
	}

	@RequestMapping(value = "/forgotpass", method = RequestMethod.GET)
	public String forgotpass() {
		return "forgotpass";
	}

	@RequestMapping(value = "/changepass", method = RequestMethod.POST)
	public String forgotpass(HttpServletRequest request) {
		try {

			String uuid = (String) UUID.randomUUID().toString().subSequence(0, 8);
			String userid = request.getParameter("username");
			NewUser user = dao.getdetails(userid);
			dao1.updatePassword(userid, uuid);
			String recipientAddress = user.getEmailid();
			String fname = user.getName();
			String subject = "Rest Password";
			String message = "The new password is" + uuid;
			String finalmessage = "Hi  " + fname + ", " + " " + message;
			SimpleMailMessage email = new SimpleMailMessage();
			email.setTo(recipientAddress);
			email.setSubject(subject);
			email.setText(finalmessage);		// sends the e-mail
			mailSender.send(email);
			
		} catch (Exception x) {
			System.out.println(x);
		}

		return "login";
	}

	// --------------------------Login page------------------------------------

	@RequestMapping("/Login")
	public String showlogin() {
		return "login";
	}

	@RequestMapping("/perform_Logout")
	public String showlogout() {
		return "login";
	}

	// --------------------------NewUser
	// page------------------------------------

	@RequestMapping(value = "NewUser", method = RequestMethod.GET)
	public ModelAndView showuser(@ModelAttribute("NewUser") NewUser NewUser) {
		System.out.println("hmmmmmmmmmmm");
		ModelAndView model = new ModelAndView("NewUser");
		return model;
	}

	@RequestMapping(value = "Success", method = RequestMethod.POST)
	public ModelAndView Success(NewUser typepro, Model m) {
		dao.addUser(typepro);
		ModelAndView mv = new ModelAndView("login", "Login", new Login());
		return mv;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/loginsuccess")
	public String login_session_attributes(HttpSession session, Model model) {

		String userid = SecurityContextHolder.getContext().getAuthentication().getName();

		NewUser user = dao.getdetails(userid);

		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();
		String page = "";
		String role = "ROLE_USER";
		for (GrantedAuthority authority : authorities) {
			if (authority.getAuthority().equals(role)) {
				session.setAttribute("UserLoggedIn", user.getName());
				session.setAttribute("UserId", userid);
				page = "productpage";
				ArrayList list = (ArrayList) da.showProduct();
				Gson gson = new Gson();
				String jsonInString = gson.toJson(list);
				model.addAttribute("list", jsonInString);
				ArrayList<Cart> cartitem = new ArrayList<Cart>();
				session.setAttribute("mycart", cartitem);
			} else {
				session.setAttribute("UserLoggedIn", "Administrator");
				page = "admin";
			}
		}
		return page;
	}
	
	@RequestMapping(value = "/restpass", method = RequestMethod.GET)
	public String pass()
	{
		return "resetpassword";
	}
	
	@RequestMapping(value = "/modifypassword", method = RequestMethod.POST)
	public String pass(HttpServletRequest request,HttpSession session)
	{
		String opass = request.getParameter("opass");
		String npass = request.getParameter("npass");
		String userid = SecurityContextHolder.getContext().getAuthentication().getName();
		String status=dao1.modifyPassword(userid, opass, npass);
		if(status.equals("PasswordChanged"))
		{
			session.setAttribute("passstatus","Changed successfully");
		}
		else
		{
			session.setAttribute("passstatus","Changed successfully");
		}
		return "resetpassword";
	}
}
