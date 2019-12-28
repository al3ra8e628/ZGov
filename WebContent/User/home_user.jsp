<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.hu.gov.business.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


	User user =(User)request.getSession().getAttribute("user") ; 
	
%>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>صفحة المدير الرئيسية</title>


<link rel="stylesheet"	href="/ZGov/bootstrap_libraries/css/admin_pages_style.css" />
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"></script>

<SCRIPT type="text/javascript">
$(document).ready(function(){
    $("#form").fadeIn(500);
    window.scroll(0, 70) ; 
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
	width: 400px ; 
	height300px ; 
    padding-top: 40px;
	padding-bottom: 30px; 

}

.form-caption{
	margin-right: 30px ; 

}

hr{
	margin-bottom: 20px ; 
}
	div#title label{
		text-align: center;
		color:red ; 
		font-size: 14pt ; 
		height: 32px ;  
	}
	div#title label strong  {
		font-size: 16pt ; 
		color : black ; 
	}


</style>

</head>
<body dir="rtl">
	<%@include file="/template_header.jsp"%>

<div class="center" id="title">
	<label> اهلا بك  <strong><%= user.getFirstName()%></strong></label>
	</div>		
	<br>

			<div class="center form well">
				<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=LOGIN">
				 <img id="logOutButton" class="icons" src="/ZGov/photos/log_out.png" alt="log out button" />
				</a>
				<h3 class="text-info form-caption">واجهة الموظف الرئيسية</h3>
                <hr class="line" />
                <br>

			
				<table class="icons" id="form" dir="ltr">

					<tr>

						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PERSON"> <img alt="add person"
								src="/ZGov/photos/add_person.png" />
						</a></th>



						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS"> <img alt="add user"
								src="/ZGov/photos/add_process.png" />
						</a></th>

						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=OPEN_PROCESS"> <img alt="add user"
								src="/ZGov/photos/open_process.png" />
						</a></th>

					</tr>


					<tr>

						<th></th>

						<th><a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=QUERY_BY_ID"> <img alt="add user"
								src="/ZGov/photos/query_by_id.png" />
						</a></th>

						<th></th>

					</tr>

			
				</table>


			</div>
	 
	<%@include file="/template_footer.jsp"%>

</body>
</html>