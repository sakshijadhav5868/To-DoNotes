<%@page import="com.user.post"%>
<%@page import="com.Db.DBconnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Userdetails user1 = (Userdetails) session.getAttribute("userD");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login..");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Notes</title>
<%@include file="all_content/allcss.jsp"%>
</head>
<body>
	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	
	PostDAO pst=new PostDAO(DBconnect.getConn());
	post  p=pst.getDataById(noteid);
	%>


	<div class="container-fluid">
		<%@include file="all_content/navbar.jsp"%>
		<h1 class="text-center">Edit your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action=" NoteEditServlet" method="post">
						<input type="hidden" value=<%=noteid%> name="noteid">
						<div class="form-group">

							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="" name="title"
								required="required" value="<%=p.getTitle() %>">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="9" cols="" class="form-control" name="content"
								required="required"><%= p.getContent() %></textarea>

						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add Notes</button>

						</div>
					</form>

				</div>
			</div>


		</div>
	</div>
</body>
</html>