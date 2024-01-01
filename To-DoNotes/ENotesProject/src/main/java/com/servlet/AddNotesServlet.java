package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.PostDAO;
import com.Db.DBconnect;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NumberFormatException {

		try {
		String title=request.getParameter("title");
		String  content=request.getParameter("content");
		int uid   = Integer.parseInt(request.getParameter("uid"));
		
		
	 PostDAO dao=new PostDAO(DBconnect.getConn());
	  boolean f= dao.AddNotes(title, content, uid);
		
		
	  
	 if(f) {
		 System.out.println("Data is inserted ");
		 response.sendRedirect("showNotes.jsp");
	 }
	 else {
		 System.out.println("data is not inserted ");
	 }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
