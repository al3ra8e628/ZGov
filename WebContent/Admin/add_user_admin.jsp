<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.hu.gov.business.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	

<html>
<head>

<link rel="stylesheet"	href="/ZGov/bootstrap_libraries/css/admin_pages_style.css" />
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"></script>
<script src="/ZGov/bootstrap_libraries/js/admin_tasks_fun.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>صفحة اضافة مستخدم</title>

<SCRIPT type="text/javascript">
$(document).ready(function(){
    $("#form").fadeIn(500);
    window.scroll(0, 150) ; 
});
</SCRIPT>

<style type="text/css">

	.form{
		width: 700px; 
	}

</style>


</head>
<body dir="rtl">
	<%@include file="/template_header.jsp"%>


			<div class="center form well">


				<h4 class="text-info form-caption">اضافة مستخدم جديد للنظام</h4>
				<hr class="line" />


				<form action="/ZGov/GovSystem" method="post" id="form">

					<table class="center">

						<tr>
							<td><label>الرقم الوطني :</label></td>
							<td><input type="text"  maxlength="10"
								name="person_id" oninput="clearResult()" required><img
								src="/ZGov/photos/check.png" width="30px" height="30px"
								onclick="getPerson(1)" /></td>
						</tr>

						<tr>
							<td><label>اسم الاول :</label></td>
							<td><input type="text" name="first_name" disabled="disabled" /></td>
							<td><label style="margin-right: 15px;">اسم العائلة :</label></td>
							<td><input type="text" name="last_name" disabled="disabled" /></td>
						</tr>

						<tr>
							<td><label>اسم المستحدم :</label></td>
							<td><input type="text" name="username" maxlength="20"  required></td>
						</tr>

						<tr>
							<td><label>كلمة المرور :</label></td>
							<td><input type="password" name="password" maxlength="20"  required></td>
						</tr>

						<tr>
							<td><label style="vertical-align:sub;">اضافة كمسؤول :</label></td>
							<td><input type="checkBox" name="isAdmin"></td>
						</tr>

					</table>
					<h4 class="text-danger" id="result"
						style="text-align: center; margin-top: 20px;"></h4>

					<input type="button" value="حفظ" name="submit"
						onclick="errorMsg('notPerson')" class="btn-primary" />
						 
					<br>	
	<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=HOME_ADMIN"><input type="button" id="btn-back" value="رجوع"/></a>
				<br>
	
					<input type="hidden" name="HU$CMD" value="ADD_USER">
					<input type="hidden" name="user_id" value="">
				
				</form>
			</div>

	<% 
     if(request.getParameter("res") != null){
    	 String res = request.getParameter("res") ; 
         out.append("<SCRIPT type='text/javascript'>setResultText(3 ,'"+res+"');</SCRIPT>"); 
     }
    %>



	<%@include file="/template_footer.jsp"%>
</body>
</html>