<%@page import="org.apache.tomcat.jni.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Userdetails user1 = (Userdetails) session.getAttribute("userD");
if (user1== null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login..");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_content/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="all_content/navbar.jsp"%>
		<h1 class="text-center">Add Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action=" AddNotesServlet" method="post">
						<div class="form-group">
							<%
							Userdetails us1 = (Userdetails) session.getAttribute("userD");
							if (us1 != null) {
							%>
							<input type="hidden" value="<%=us1.getId()%>" name="uid">
							<%
							}
							%>





							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="" name="title"
								required="required">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="9" cols="" class="form-control" name="content"
								required="required"></textarea>

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