<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.hu.gov.business.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>صفحة اضافة مديرية امن عام</title>



<link rel="stylesheet"	href="/ZGov/bootstrap_libraries/css/admin_pages_style.css" />
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"></script>
<script src="/ZGov/bootstrap_libraries/js/admin_tasks_fun.js"></script>

<SCRIPT type="text/javascript">
$(document).ready(function(){
    $("#form").fadeIn(500);
});
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

</style>

</head>
<body dir="rtl">


	<%@include file="/template_header.jsp"%>


			<div class="center form well">

				<h4 class="text-info form-caption"> اضافة مركز دفاع مدني </h4>
				<hr class="line" />

				<form action="/ZGov/GovSystem" method="post">

					<table class="center" id="form">

					
						<tr>
							<td><label>رقم المركز  :</label></td>
							<td><input type="text" name="c_dept_id" oninput="clearResult()" maxlength="10" 
								required /></td>
						</tr>

						<tr>
							<td><label>اسم المركز  :</label></td>
							<td><input type="text" name="c_dept_name"  maxlength="80"
								 required></td>
						</tr>
                      
                      	</table>

						
						<h4 class="text-danger" id="result"
						style="text-align: center; margin-top: 20px;"></h4>

					<input type="submit" value="حفظ" class="btn-primary"/> 
					<br>	
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=HOME_ADMIN"><input type="button" id="btn-back" value="رجوع"/></a>
					<br>
					
					<input type="hidden" name="HU$CMD" value="ADD_CIVIL_DEPARTMENTS">
				</form>

			</div>
<% 
     if(request.getParameter("res") != null){
    	 String res = request.getParameter("res") ; 
         out.append("<SCRIPT type='text/javascript'>setResultText(6 ,'"+res+"');</SCRIPT>"); 
     }
    %>

	<%@include file="/template_footer.jsp"%>
</body>
</html>