<%@page import="com.user.post"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBconnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Userdetails user2 = (Userdetails) session.getAttribute("userD");
if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please Login...-_-");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<%@include file="all_content/allcss.jsp"%>
</head>
<body>
	<%@include file="all_content/navbar.jsp"%>
	<%
String updateMsg=(String)session.getAttribute("updateMsg");
	if(updateMsg!=null)
	{%>
		<div class="alert alert-sucess" role="alert"><%= updateMsg%></div>
	<%
	session.removeAttribute("updateMsg");
	}
	%>
	
	<%
String wrongMsg=(String)session.getAttribute("wrongMsg");
	if(wrongMsg!=null)
	{%>
		<div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
	<%
	session.removeAttribute("wrongMsg");
	}
	%>
	
	
	<div class="container">
	<h2 class=" text-center  mt-2">All Notes</h2>
	<div class="row-margin-top:20px   margin-right:300px margin-left:300px-space">		
	<div class="col-md-12">
			<%
				if(user2!=null){
					PostDAO ob=new PostDAO(DBconnect.getConn());
					List<post> p2=ob.getData(user2.getId());
					for(post p3:p2)
					{%>
					
					<div class="card mt-7">

						<img alt="" src="img/glow.jpg" class="card-img-top mt-2 mx-auto"
							style="max-width: 300px;">

						<div class="card-body p-2">
						

							<h5 class="card-title"><%=p3.getTitle()%></h5>
							<p>
								<%= p3.getContent()%>.</p>

							<p >
								<b class="text-success">Published By :<%=user2.getName() %></b><br>
								<b class="text-primary"></b>
							</p>

							  

							<div class="container text-center mt-2">

								<a href="deleteServlet?note_id=<%=p3.getId() %>" class="btn btn-danger">Delete</a>
								 <a href=" edit.jsp?note_id=<%=p3.getId() %>"
									class="btn btn-primary">Edit</a>
							</div>

						</div>
					</div>	
					<%
					}
				     }
					%>	
			</div>
		</div>
	</div>
</body>
</html>