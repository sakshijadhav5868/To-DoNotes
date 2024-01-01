package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBconnect;
import com.user.Userdetails;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("uemail");
		String password = request.getParameter("upassword");

		Userdetails us = new Userdetails();
		us.setEmail(email);
		us.setPassword(password);

		UserDAO dao = new UserDAO(DBconnect.getConn());
		Userdetails user = dao.loginUser(us);

		if (user!=null) 
		{
			HttpSession session = request.getSession();
			session.setAttribute("userD", user);
			response.sendRedirect("home.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("login-failed", "Invaild Username and password");
			response.sendRedirect("login.jsp");
		}

	}

}
