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
<title>صفحة اضافة قسم</title>

<SCRIPT type="text/javascript">
$(document).ready(function(){
    $("#form").fadeIn(500);
    window.scroll(0, 60) ; 
});
</SCRIPT>




<style type="text/css">

	.form{
		width: 450px; 
	}


</style>

</head>
<body dir="rtl">
	<%@include file="/template_header.jsp"%>



			<div class="center form well">


				<h4 class="text-info form-caption">اضافة دائرة جديدة</h4>
				<hr class="line"/>


				<form action="/ZGov/GovSystem" id="form" method="post">

					<table class="center">

						<tr>
							<td><label>رقم الدائرة :</label></td>
							<td><input type="text"  maxlength="2"
								style="float: none" oninput="clearResult()" name="department_id"
								required></td>
						</tr>

						<tr>
							<td><label>اسم الدائرة :</label></td>
							<td><input type="text" name="department_name" maxlength="300" required /></td>
						</tr>

						<tr>
							<td><label>عنوان الدائرة :</label></td>
							<td><input type="text" name="address" maxlength="500"></td>
						</tr>


					</table>


					<h4 class="text-danger" id="result"
						style="text-align: center; margin-top: 20px;"></h4>


					<input type="submit" value="حفظ" class="btn-primary"/> 
					<br>	
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=HOME_ADMIN"><input type="button" id="btn-back" value="رجوع"/></a>
					<br>
					
					<input type="hidden" name="HU$CMD" value="ADD_DEPARTMENT">

				</form>
			</div>




	<% 
     if(request.getParameter("res") != null){
    	 String res = request.getParameter("res") ; 
         out.append("<SCRIPT type='text/javascript'>setResultText(4 ,'"+res+"');</SCRIPT>"); 
     }
    %>



	<%@include file="/template_footer.jsp"%>
</body>
</html>