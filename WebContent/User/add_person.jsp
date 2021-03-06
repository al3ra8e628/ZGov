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
<title>صفحة اضافة سجل فرد</title>

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

<body dir="rtl" onLoad="window.scroll(0, 150)">
	<%@include file="/template_header.jsp"%>


			<div class="center form well">


				<h4 class="text-info form-caption">اضافة سجل فرد</h4>
				<hr class="line" />


				<form action="/ZGov/GovSystem" method="post" id="form">

							<table class="center">

						<tr>
							<td><label> الرقم الوطني :</label></td>
							<td><input type="text" pattern="^[0-9]{10}$" maxlength="10"
								name="person_id" oninput="clearResult()" required></td>
						</tr>

						<tr>
							<td><label>اسم الاول :</label></td>
							<td><input type="text" name="first_name" maxlength="80" pattern="^[أ-ي]+$"  required /></td>
							<td><label style="margin-right: 15px;">اسم الاب :</label></td>
							<td><input type="text" name="mid_name" maxlength="80" pattern="^[أ-ي]+$"/></td>
						</tr>
						<tr>
							<td><label>اسم العائلة :</label></td>
							<td><input type="text"   name="last_name" maxlength="80" pattern="^[أ-ي]+$" required /></td>
						</tr>
						<tr>
							<td><label>تاريخ الميلاد :</label></td>
							<td><input type="date" name="birth_date"></td>
						</tr>
						<tr>
							<td><label>عنوان السكن :</label></td>
							<td><input type="text" name="address" pattern="^[0-9أ-ي\s]+$"
							 maxlength="500"></td>
						</tr>
						<tr>
							<td><label>رقم الهاتف :</label></td>
							<td><input type="text" name="phone_number" pattern="^[0-9]{10}$"
								maxlength="10"></td>
						</tr>
					</table>

					<h4 class="text-danger" id="result"
						style="text-align: center; margin-top: 20px;"></h4>

					<input type="submit" value="حفظ" class="btn-primary"/> 
					<br>	
						<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=HOME_USER"><input type="button" id="btn-back" value="رجوع"/></a>
					<br>
					
					<input type="hidden" name="HU$CMD" value="ADD_PERSON"/>
					
				</form>
			</div>

	<% 
     if(request.getParameter("res") != null){
    	 String res = request.getParameter("res") ; 
         out.append("<SCRIPT type='text/javascript'>setResultText(1 ,'"+res+"');</SCRIPT>"); 
     }
    %>


	<%@include file="/template_footer.jsp"%>
</body>
</html>