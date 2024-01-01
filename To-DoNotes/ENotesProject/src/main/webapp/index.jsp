<%@page import="javax.swing.plaf.synth.SynthOptionPaneUI"%>
<%@page import="com.Db.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style  type="text/css">
.back-img{
background: url("img/demo3.jpg");
width:  100%;
height: 130vh;
background-repeat: no-repeat;
background-size:  cover;

}
</style>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="all_content/allcss.jsp" %>
</head>
<body>

<%@include file="all_content/navbar.jsp" %>
<div class="container-fluid back-img">
<div class="text-center">
<h1 class="text-black">  To-Do Notes : Save Your  Notes</h1>
<a href="login.jsp" class="btn btn-Light"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a>
<a href="register.jsp" class="btn btn-Light"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
</div>
</div>

<div class="container-fluid bg-dark mt-1">
<p  class="text-center  text-white">Note: Any error occur then  contact  Gayatri Agharde. Designed and devloped by Gayatri Agharde</p>

<p class="text-center  text-white"> All Right @gayatriagharde</p>  

</div>

</body>
</html>