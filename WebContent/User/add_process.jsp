<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.database.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.hu.gov.business.User"%>
<%


	User user =(User)request.getSession().getAttribute("user") ; 
	
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>صفحة الموظف الرئيسية</title>
<link rel="stylesheet"	href="/ZGov/bootstrap_libraries/css/admin_pages_style.css" />
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"></script>
<script src="/ZGov/bootstrap_libraries/js/admin_tasks_fun.js"></script>
<SCRIPT type="text/javascript">

$(document).ready(function(){
    $("#form").fadeIn(500);
    window.scroll(0, 50) ; 
});
</SCRIPT>



<style type="text/css">
	.form{
		width: 550px; 
	}
	
	select{
	width: 350px ; 
	border-radius: 4px ; 
	font-weight: bold ; 
	font-size: 16px ; 	
	}
	
	optgroup[label]{
	background: #cecece  ; 
	
	font-size: 16px ; 
	
	}
	option{
	background: #eaeaea ; 
	color: #000 ; 
	font-size: 14px ; 
	}
	label {
	vertical-align: middle; 
	font-size: 15px ; 
	font-weight: bold;
	 
	}



	
#logOutButton {
	float: left;
	position: relative;
	left: -15px;
	top: 8px;
	padding: 5px;
	height: 50px;
	width: 45px;
    box-sizing: border-box;
	
}

#logOutButton:hover {
	padding: 0;
}
	
	
	
</style>

</head>
<body dir = 'RTL' >

	<%@include file="/template_header.jsp"%>

	<br>
			<div class="center form well">

		<h4 class="text-info form-caption">اضافة معاملة</h4>
				<hr class="line" />
	


				<form action="/ZGov/GovSystem" method="post" id="form">
					
					<table class="center">
					
					<tr>
					 <td><label>اختيار اسم المعاملة  :</label></td>
					 <td>
				 <select name='file_name' required>
				 
				 
				 <%
				 
				 				 
				Connection conn = DatabaseConnection.getConnection() ; 
				String query = 
						"select process_num , process_name ,d.department_name ,  d.department_id ,file_name " +
						" from USER_DEPARTMENT_PROCESS u"  +
						" join PROCESS using(process_num)" +
						" join department d on (PROCESS.DEPARTMENT_ID = d.DEPARTMENT_ID)"+
						" where u.USER_ID ="+user.getUserId()+
						" order by d.DEPARTMENT_ID , process_num" ;
				
				PreparedStatement stm = conn.prepareStatement(query);
				ResultSet set = stm.executeQuery();
				
				String department = "" ; 
				boolean first = true ; 
				while(set.next()){
					if(!department.equalsIgnoreCase(set.getString(3))){
						if(!first)
						out.println("</optgroup>") ; 
						department = set.getString(3) ; 
						out.println("<optgroup label = '"+department+"'> ");
					    first = false ; 
					}
				out.print("<option  value='"+set.getString(5)+"'>"+set.getString(2)+"</option>" ); 
				}
				
				 
				 %>
				 
				 </select>
				 </td>
				  </tr>
				  
			
					</table>
					<br>	
					  	<input type="submit" value="دخول" class="btn-primary"/> 
	
			<br>	
						<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=HOME_USER"><input type="button" id="btn-back" value="رجوع"/></a>
					<br>
			
					<input type="hidden" name="HU$CMD" value="ADD_PROCESS">
					
				</form>
			</div>
	
	
	
	
	<%@include file="/template_footer.jsp"%>
</body>
</html>