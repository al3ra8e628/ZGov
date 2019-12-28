<?xml version="1.0" encoding="UTF-8" ?>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="com.hu.gov.business.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<html>
<head>


<link rel="stylesheet"
	href="/ZGov/bootstrap_libraries/css/admin_pages_style.css" />
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"></script>
<script src="/ZGov/bootstrap_libraries/js/admin_tasks_fun.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>صفحة اضافة موظف</title>


<SCRIPT type="text/javascript">
	$(document).ready(function() {
		$("#form").fadeIn(500);
		window.scroll(0, 150);
	});
</SCRIPT>




<style type="text/css">
.form {
	width: 700px;
}
</style>






</head>
<body dir="rtl">
	<%@include file="/template_header.jsp"%>




	<div class="center well form">


		<h4 class="text-info form-caption">اضافة موظف جديد</h4>
		<hr class="line" />


		<form action="/ZGov/GovSystem" id="form" method="post">

			<table class="center">

				<tr>
					<td><label>الرقم الوطني :</label></td>
					<td><input type="text" maxlength="10" 
						oninput="clearResult()" name="person_id" required /> <img
						src="/ZGov/photos/check.png" onclick="getPerson(2)" /></td>
				</tr>

				<tr>
					<td><label>اسم الاول :</label></td>
					<td><input type="text" name="first_name" disabled="disabled" /></td>
					<td><label style="margin-right: 15px;">اسم العائلة :</label></td>
					<td><input type="text" name="last_name" disabled="disabled" /></td>
				</tr>

				<tr>


					<td><label>رقم الدائرة :</label></td>
					<td><select name="department_id" required>
							<%
								try {

									Connection conn = DatabaseConnection.getConnection();
									String query = "SELECT DEPARTMENT_ID , DEPARTMENT_NAME FROM DEPARTMENT";
									Statement stm = conn.createStatement();
									ResultSet rs = stm.executeQuery(query);

									while (rs.next()) {
										out.println("<option value='" + rs.getInt(1) + "'>" + rs.getString(2) + "</option>");
									}

								} catch (Exception e) {

								}
							%>

					</select></td>

				</tr>



				<tr>
					<td><label>الرقم الوظيفي :</label></td>
					<td><input type="text" name="employee_id"
						 required></td>
				</tr>


				<tr>
					<td><label>المسمى الوظيفي :</label></td>
					<td><input type="text" name="job_title" maxlength="100"
						required></td>
				</tr>

			</table>

			<h4 class="text-danger" id="result"
				style="text-align: center; margin-top: 20px;"></h4>

			<input type="button" value="حفظ" name="submit"
				onclick="errorMsg('notPerson||department')" class="btn-primary" /> <br>
			<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=HOME_ADMIN"><input
				type="button" id="btn-back" value="رجوع" /></a> <br>
			<input type="hidden" name="HU$CMD" value="ADD_EMPLOYEE" />

		</form>
	</div>

	<%
		if (request.getParameter("res") != null) {
			String res = request.getParameter("res");
			out.append("<SCRIPT type='text/javascript'>setResultText(2 ,'" + res + "');</SCRIPT>");
		}
	%>



	<%@include file="/template_footer.jsp"%>
</body>
</html>