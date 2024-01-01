package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBconnect;
import com.mysql.cj.Session;
import com.user.Userdetails;

@WebServlet("/Userservlet")
public class Userservlet  extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res ) throws SecurityException,IOException{
	
		String name=req.getParameter("fname");
		String email=req.getParameter("uemail");
		String password=req.getParameter("upassword");
		
		Userdetails us=new Userdetails();
	
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao=new UserDAO(DBconnect.getConn());
	     boolean f=	dao.addUser(us);
	     
	     HttpSession session;
	     if(f) {
	    	  session=req.getSession();
	    	 session.setAttribute("reg-sucess", "Registration Successfully ....");
	    	 res.sendRedirect("register.jsp");
	     }
	     else {
	    	session=req.getSession();
	    	session.setAttribute("failed-msg","Something went wrong..");
	    	res.sendRedirect("register.jsp");
	     }
		
	}

}
