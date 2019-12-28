<?xml version="1.0" encoding="UTF-8" ?>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="com.hu.gov.business.User"%>


<html>
<head>
<title>صفحة اضافة الصلاحيات</title>

<link rel="stylesheet"
	href="/ZGov/bootstrap_libraries/css/admin_pages_style.css" />
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"></script>
<script src="/ZGov/bootstrap_libraries/js/admin_tasks_fun.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<SCRIPT type="text/javascript">

$(document).ready(function(){
    $("#form").fadeIn(500);
    window.scroll(0, 90) ; 
	var select = document.getElementsByName("department_id")[0] ; 
	select.selectedIndex = "-1";
});

</SCRIPT>



<style type="text/css">
.multiselect {
	width: 400px;
}

.selectBox {
	position: relative;
}

.selectBox select {
	width: 100%;
	font-weight: bold;
}

.overSelect {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
}

.checkboxes {
	position: absolute;
	display: none;
	width: 400PX;
	margin: 0;
	padding: 0;
	height: 250px;
	z-index: 1;
	background-color: #EAEAEA;
	border: 1px #2E6DA4 solid;
	overflow: scroll;
}

.checkboxes  label {
	display: block;
	font-size: 9pt;
	margin: 0;
	padding: 0;
	height: 18px;
}

.checkboxes  label:hover {
	background-color: #1e90ff;
}

label.option {
	float: none;
	margin-left: 1px;
	margin-top: 0;
	text-align: right;
	background-color: #EAEAEA;
}

.form {
	width: 700px;
}

input[type="checkbox"] {
	width: 13px;
	height: 13px;
	background-color: #fff;
	border: 1px solid #ccc;
	vertical-align: middle;
	margin-top: 3px;
}
</style>

</head>
<body dir="rtl">

	<%@include file="/template_header.jsp"%>

	<div class="center form well">


		<h4 class="text-info form-caption">حجب صلاحيات لموظف</h4>
		<hr class="line" />


		<form action="/ZGov/GovSystem" method="post" id="form">

			<table class="center">

				<tr>

					<%
						String user_id = request.getParameter("user_id");
					%>

					<td><label>الرقم الوظيفي :</label></td>
					<td><input type='text'  maxlength='10'
						name='user_id' oninput='clearResult()' required><img
						src='/ZGov/photos/check.png' id="check_icon" onclick='getUser(0)' />
					</td>
				</tr>

				<tr>
					<td><label>اسم الاول :</label></td>
					<td><input type="text" id="first_name" disabled="disabled" /></td>
					<td><label style="margin-right: 15px;">اسم العائلة :</label></td>
					<td><input type="text" id="last_name" disabled="disabled" /></td>
				</tr>

				<tr>
					<td><label>رقم الدائرة :</label></td>
					<td><select required name="department_id"
						onchange="changeDepartment()">

							<%
								List<Integer> departments = new ArrayList<Integer>();
								Connection conn = null;
								try {
									conn = DatabaseConnection.getConnection();
									String query = "SELECT DEPARTMENT_ID , DEPARTMENT_NAME FROM DEPARTMENT";
									Statement stm = conn.createStatement();
									ResultSet rs = stm.executeQuery(query);
									while (rs.next()) {
										out.println("<option value='" + rs.getInt(1) + "'>" + rs.getString(2) + "</option>");
										departments.add(rs.getInt(1));
									}
								} catch (Exception e) {

								}
							%>
					</select></td>
				</tr>
			</table>
			<%
				if (user_id != null) {
					for (int department_id : departments) {
						out.print(
								"<div class='multiselect center' id='select" + department_id + "' style='display:none;'> ");
						out.print("<div class='selectBox'  onclick='showCheckboxesFor" + department_id + "()'>");
						out.print("<select >");
						out.print("<option>اختيار المعاملات المراد التصريح بها</option>");
						out.print("</select>");
						out.print("<div class='overSelect'></div>");
						out.print("</div>");

						out.print("<div class='checkboxes' id='d" + department_id + "'>");
						String query = "select process_num , process_name from process where department_id ="
								+ department_id
								+ "  and process_num in(select process_num from user_department_process where "
								+ " 	user_id =" + user_id + ")";
						PreparedStatement ps = conn.prepareStatement(query);
						ResultSet rs = ps.executeQuery();

						while (rs.next()) {
							out.print("<label class='option'>");
							out.print("<input type='checkbox' name='process_num' value='" + rs.getInt(1) + "'/>");
							out.print(rs.getString(2) + "</label>");
						}

						out.print("</div>");

						out.print("</div>");
					}
				}
			%>


			<h4 class="text-danger" id="result"
				style="text-align: center; margin-top: 20px;"></h4>

			<input type="button" value="حفظ" name="submit"
				onclick="errorMsg('notEmployee')" class="btn-primary" /> <br>
			<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=HOME_ADMIN"><input
				type="button" id="btn-back" value="رجوع" /></a> <br>
			<input type="hidden" name="HU$CMD" value="REMOVE_PRIVILEGE">
		</form>
		<%
			String person_id = request.getParameter("person_id");
			if (person_id != null) {
				out.print("<script>");
				out.print("setUserValues('" + user_id + "','" + person_id + "');");
				out.print("</script>");
			}
		%>

	</div>





	<script type="text/javascript">
	
	function changeDepartment() {
		var select = document.getElementsByName("department_id")[0] ; 
		<%for (int department_id : departments) {%>	
		
		var inVisSelect = document.getElementById("select"+<%=department_id%>) ; 
		inVisSelect.style.display = "none" ; 
		
		<%}%>
		var visSelect = document.getElementById("select"+select.value) ; 
		visSelect.style.display = "block" ; 
	}
	
	
	
	
	var expanded = false;
	
		<%for (int departmnet : departments) {
				out.print("function showCheckboxesFor" + departmnet + "() {");%>
		var checkboxes = document.getElementById("d"+<%=departmnet%>);
		 	if(!expanded){
		 		checkboxes.style.display = "block";
		 		expanded = true; 
		 	} else {
		 		checkboxes.style.display = "none";
		 		expanded = false; 
		 	}
		 }
	
		<%}%>
	</script>


	<%
		if (request.getParameter("res") != null) {
			String res = request.getParameter("res");
			out.append("<SCRIPT type='text/javascript'>setResultText(6 ,'" + res + "');</SCRIPT>");
		}
	%>

	<%@include file="/template_footer.jsp"%>



</body>
</html>