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
<title>Insert title here</title>
<%@ include file="all_content/allcss.jsp" %>
</head>
<body>

<div class="container-fluid">
<%@ include file="all_content/navbar.jsp" %>
<div  class="card py-4">
<div   class="card-body  text-center">
<img alt=""  src="img/glow.jpg" class="img-fluid mx-auto"  style="max-width: 700px ;" >
<h1> START TAKING YOUR NOTES</h1>
<a  href="addNotes.jsp"  class="btn btn-outline - primary">Start Here</a>
</div>
</div>
</div>

</body>
</html>