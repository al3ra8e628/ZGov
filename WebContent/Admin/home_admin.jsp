<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.hu.gov.business.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>صفحة المدير الرئيسية</title>


<link rel="stylesheet"	href="/ZGov/bootstrap_libraries/css/admin_pages_style.css" />
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"></script>

<SCRIPT type="text/javascript">
$(document).ready(function(){
    $("#form").fadeIn(500);
    window.scroll(0, 210) ; 
});
</SCRIPT>


<style type="text/css">

#logOutButton {
	float: left;
	position: relative;
	left: -15px;
	top: -10px;
	padding: 5px;
	height: 50px;
	width: 45px;
    box-sizing: border-box;
	
}

#logOutButton:hover {
	padding: 0;
}

.form{
	width: 600px ; 
    padding-top: 40px;
	padding-bottom: 20px; 
}

.form-caption{
	margin-right: 30px ; 

}

hr{
	margin-bottom: 20px ; 
}


</style>

</head>
<body dir="rtl">
	<%@include file="/template_header.jsp"%>

			<div class="center form well">
				<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=LOGIN">
				 <img id="logOutButton" class="icons" src="/ZGov/photos/log_out.png" alt="log out button" />
				</a>
				<h3 class="text-info form-caption">الوظائف الادارية</h3>
                <hr class="line" />
                <br>

			
				<table class="icons" id="form" dir="ltr">

					<tr>

						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PERSON"> <img alt="add person"
								src="/ZGov/photos/add_person.png" />
						</a></th>

						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_EMPLOYEE_ADMIN"> <img
								alt="add employee" src="/ZGov/photos/add_employee.png" />
						</a></th>

						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_USER_ADMIN"> <img alt="add user"
								src="/ZGov/photos/add_user.png" />
						</a></th>

					</tr>

					<tr>

						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_DEPARTMENT_ADMIN"> <img
								alt="add depaertment" src="/ZGov/photos/add_department.png" />
						</a></th>

						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PRIVILEGE"> <img
								alt="add privilege" src="/ZGov/photos/add_privilege.png" />
						</a></th>
			
			
						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_CIVIL_DEPARTMENT"> <img
								alt="add civil" src="/ZGov/photos/add_civil_department.png" />
						</a></th>
					</tr>

					<tr>

						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_HEALTH_DEPARTMENT" > <img
								alt="add civil" src="/ZGov/photos/add_health_department.png" />
						</a></th>
						
						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_POLICE_DEPARTMENT"> <img
								alt="add civil" src="/ZGov/photos/add_police_department.png" />
						</a></th>
						
						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_MUNICIPAL_DEPARTMENT"> <img
								alt="add muicipal" src="/ZGov/photos/add_muni_department.png" />
						</a></th>
						
					</tr>

					<tr>

						<th></th>
						
						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=REMOVE_PRIVILEGE"> <img
								alt="remove privilege" src="/ZGov/photos/remove_privilege.png" />
						</a></th>
						
						<th></th>
						
					</tr>

			
				</table>


			</div>
	 
	<%@include file="/template_footer.jsp"%>

</body>
</html>