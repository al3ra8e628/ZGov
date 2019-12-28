<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.hu.gov.business.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>صفحة تسجيل الدخول</title>



<link rel="stylesheet"	href="/ZGov/bootstrap_libraries/css/admin_pages_style.css" />
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"></script>
<script src="/ZGov/bootstrap_libraries/js/admin_tasks_fun.js"></script>

<SCRIPT type="text/javascript">
$(document).ready(function(){
    $("#form").fadeIn(500);
});

function clearLogInResult() {
	var username  = document.getElementsByName("username")[0] ; 	
	var password  = document.getElementsByName("password")[0] ;
	var errorIcons = document.getElementsByClassName("error_icon"); 
	username.classList = "" ;
	password.classList = "" ;  
	for (var i = 0; i < errorIcons.length; i++) {
		errorIcons[i].style.visibility = "hidden";
	}
}


</SCRIPT>




<style type="text/css">

.form{
	width: 400px ; 
}

input[type="submit"] {
	 width:40%; 
	 height:35px;  
}
p.text-danger{
	 margin-top:5px;
	 color:#ea524f; 
	 margin-right:15px; 
	 font-size:14px; 
}

h4{

margin-right: -10px ; 

}

.error_password{
box-shadow: 0 0px 1px 0 red, 0 0px 1px 0 red;
}

.error_password:focus{
box-shadow: 0 0px 1px 0 red, 0 0px 1px 0 red;
outline:none ;  
}

.error_icon{
vertical-align:middle ; 
margin-right:4px; 
font-size:18pt; 
color: #F47B7B; 
}

</style>

</head>
<body dir="rtl">


	<%@include file="/template_header.jsp"%>


			<div class="center form well">

				<h4 class="text-info form-caption"> واجهة تسجيل الدخول </h4>
				<hr class="line" />

				<form action="GovSystem" method="post">

					<table class="center" id="form">
					
						<tr>
							<td><label>اسم المستخدم :</label></td>

							<td>
							<%
							if(request.getParameter("res") == null)
							out.print("<input type='text' name='username' oninput='clearLogInResult()' required/>") ; 
							else{
								if(request.getParameter("res").equals("-1")){
							out.print("<input type='text' class='error_password' name='username' oninput='clearLogInResult()' required/>") ; 
							out.print("<label class='error_icon'>&#8902</label>") ; 
								}else if(request.getParameter("res").equals("-2")){
									out.print("<input type='text' name='username' oninput='clearLogInResult()' required value='"+request.getParameter("username")+"'/>") ; 
								}
							}
							%>
							
							</td>
						
						</tr>

						<tr>
							<td><label>كلمة المرور :</label></td>
							<td>
							
							<%
							if(request.getParameter("res") == null)
							out.print("<input type='password' name='password' oninput='clearLogInResult()' required>") ; 
							else{
								if(request.getParameter("res").equals("-1") || request.getParameter("res").equals("-2")){
							out.print("<input type='password' class='error_password' name='password' oninput='clearLogInResult()' required>") ; 
							out.print("<label class='error_icon'>&#8902</label>") ; 
								}
							}
							
							%> 
								 
								 </td>
						</tr>
                        
					</table>

						<br>


						<input type="submit" value="دخول"  class="btn-primary" />
						<br>


					<input type="hidden" name="HU$CMD" value="LOG_IN">
				</form>



			</div>


	<%@include file="/template_footer.jsp"%>
</body>
</html>