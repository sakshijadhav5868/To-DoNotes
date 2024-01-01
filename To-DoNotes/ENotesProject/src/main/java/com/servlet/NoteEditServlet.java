package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.Db.DBconnect;


@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		Integer noteid=Integer.parseInt(request.getParameter("noteid"));
		String Title=request.getParameter("title");
		String Content=request.getParameter("content");

			PostDAO dao=new PostDAO(DBconnect.getConn());
			boolean f=  dao.PostUpdate(noteid, Title, Content);
			
			if(f) {
				System.out.println("data updated sucessfully");
				HttpSession session=request.getSession();
				session.setAttribute("updateMsg", "Notes update Sucessfully");
				response.sendRedirect("showNotes.jsp");
				
			}else {
				System.out.println("data is not updated ");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
