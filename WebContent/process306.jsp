<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet" type="text/css"
	href="./bootstrap_libraries/css/processes_style.css">
<title>اغلاق المؤسسات الطبية او محطات تحلية المياه ا</title>
</head>
<body>   
<body dir="rtl">

<div class="form" style="background: #EF9A9A">
		<form method="post" action="GovSystem" enctype="multipart/form-data">

			<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" /> <input
				type="hidden" name="HU$PROCESS_NUM" value="306" />

			<p
				style="text-align: center; margin-top: -1px; font-size: 30pt; font-weight: bold;">اغلاق المؤسسات الطبية او محطات تحلية المياه 
				</p>

			<hr style="margin-left: 6%; margin-right: 6%; margin-top: -3%">
			<div style="padding-let: 3%; padding-right: 3%">
				<br>
				<label style="font-size: 18pt; font-weight: bold;"> الرقم
					الوطني :</label> <input type="text" name="PERSON_ID" size="40"
					style="height: 25px; border-radius: 5pt;" required  minlength="10" maxlength="10"/> <br>
				<br>
				<table>
					<tr>
						<td style="font-size: 20pt; font-weight: bold">تقديم طلب :</td>
					</tr>
					<tr>
						<td width="210pt"><label> <input type="checkbox"
								id="mh1"> كتاب رسمي </label></td>
						<td><input type="file" accept="image/*" name="FORMAL_PAPER"
							id="formal_paper" disabled>
					</tr>
					
					
				</table>
				<br>
				<br>
				<br>
				<table>
					<tr>
						<td colspan="2" style="font-size: 20pt; font-weight: bold">الشركاء الداخليين
							 :</td>
					</tr>
					<tr>
						<td>
							<table>
								<tr>
									<td width="100pt"><label><input type="checkbox"
											id="mh2">مديرية  الشرطة </label></td>
									<td><select style="max-width: 75px; min-width: 75px"
										name="POLICE_DEPARTMENT" disabled id="s1">

											<%
												Connection conn = DatabaseConnection.getConnection();
												String sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
												PreparedStatement pstmt = conn.prepareStatement(sql);
												ResultSet rs = pstmt.executeQuery();
												while (rs.next()) {

													out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
												}
											%>
									</select></td>
								</tr>
							</table>
						</td>
						<td><input type="file" accept="image/*" name="POLICE"
							id="police" disabled>
					</tr>
					<tr>
					<td>
						<table>
							<tr>
								<td width="100pt"><label><input type="checkbox"
										id="c42"> الوحدات الادارية </label></td>
								<td><select style="max-width: 75px; min-width: 75px"
									name="ADMINISTRATIVE_UNIT" disabled id="s12">

										<%
																			 conn = DatabaseConnection.getConnection();
																			 sql = "SELECT * FROM gov.ADMINISTRATIVE_UNITS";
																			 pstmt = conn.prepareStatement(sql);
																			rs = pstmt.executeQuery();
																			while (rs.next()) {

																				out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
																			}
																		%>
								</select></td>
							</tr>
						</table>
					</td>
					<td><input type="file" accept="image/*" name="UNIT"
						id="unit" disabled>
				</tr>
					<tr>
						<td width="210pt">
							<table>
								<tr>
									<td width="100pt"><label><input type="checkbox"
											id="mh3">وزارة الصحة  </label></td>
									<td><select style="max-width: 75px; min-width: 75px"
										style="max-width:200px;" name="MINISTRY_HEALTH" disabled
										id="s2">
											<%
												sql = "SELECT * FROM gov.health_departments";
												pstmt = conn.prepareStatement(sql);
												rs = pstmt.executeQuery();
												while (rs.next()) {

													out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
												}
											%>
									</select></td>
								</tr>
							</table>
						</td>
						<td><input type="file" accept="image/*" name="MINISTRY_OF_HEALTH"
							id="ministry_of_health" disabled>
					</tr>
					<tr>
						<td width="210pt">
							
						</td>
					
					</tr>
					<tr>
						<td width="210pt">
							<table>
								<tr>
									<td width="100pt"><label><input type="checkbox"
											id="mh4">مديرية الصحة</label></td>
									<td><select style="max-width: 75px; min-width: 75px"
										name="HEALTH_DEPARTMENT" disabled id="s3">
											<%
												sql = "SELECT * FROM gov.health_departments";
												pstmt = conn.prepareStatement(sql);
												rs = pstmt.executeQuery();
												while (rs.next()) {

													out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
												}
											%>
									</select></td>
								</tr>
							</table>
						</td>
						<td><input type="file" accept="image/*" name="HEALTH"
							id="health" disabled>
					</tr>
				</table>
				<br>
				<br>
				<br>
			<table>
					<tr>
						<td colspan="2" style="font-size: 20pt; font-weight: bold">الشركاء الخارجيين
							 :</td>
					</tr>
					<tr>
						<td>
							<table>
								<tr>
									<td width="100pt"><label><input type="checkbox"
											id="mh22">مديرية  الشرطة </label></td>
									<td><select style="max-width: 75px; min-width: 75px"
										name="POLICE_DEPARTMENT2" disabled id="s123">

											<%
												 conn = DatabaseConnection.getConnection();
												 sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
												 pstmt = conn.prepareStatement(sql);
												 rs = pstmt.executeQuery();
												while (rs.next()) {

													out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
												}
											%>
									</select></td>
								</tr>
							</table>
						</td>
						<td><input type="file" accept="image/*" name="POLICE2"
							id="police2" disabled>
					</tr></table>
				<br>
				<br>
				<br>
				
				<hr style="margin-left: 6%; margin-right: 6%; margin-top: -3%">
				<br>
				<div style="margin-right: 28%">
					<input class="form-appointment" type="submit" value="حـفـظ" /> <input
						class="form-appointment" type="reset" value="تفريغ" /> <a
						href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS"> <input
						class="form-appointment" type="button" value="انـهـاء" />
					</a> <br />
					<br />
					<br />
				</div>
				<br>
				<br>
				<br>
		</form>

		<label style="font-weight: bold;"> الزمن المستغرق : يوم عمل رسمي </label>
	</div>
	

</body>

<script type="text/javascript">
	function myFunction() {
		alert("تـم الحـفـظ بـنـجـاح");
	}

	function enable(x, y) {
		document.getElementById(x).onchange = function() {
			document.getElementById(y).disabled = !this.checked;
		};
	}

	function enable2(x, y, z) {
		document.getElementById(x).onchange = function() {
			document.getElementById(y).disabled = !this.checked;
			document.getElementById(z).disabled = !this.checked;
		};
	}
	enable("mh1", "formal_paper");

	enable2("mh22", "police2", "s123");
	enable2("c42", "unit", "s12");
	enable2("mh2", "police", "s1");
	enable2("mh3", "ministry_of_health", "s2");
	enable2("mh4", "health", "s3");
</script>

</html>







</body>
</html>