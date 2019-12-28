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

<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css">
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>

<title>فعاليات الاحزاب</title>
</head>


<body dir="rtl" >




	<div class="form" style="background-color: #A8DADC;">
		<form method="post" action="GovSystem" 
			enctype="multipart/form-data" id="form">

			<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" /> 
			<input type="hidden" name="HU$PROCESS_NUM" value="401" />

			<p
				style="text-align: center; margin-top: -1px; font-size: 30pt; font-weight: bold;">
				فعاليات الاحزاب
				</p>

			<hr style="margin-left: 6%; margin-right: 6%; margin-top: -3%">


				<div style="padding-let: 3%; padding-right: 3%">
					<br> 
					<label style="font-size: 18pt; font-weight: bold;">
							الرقم الوطني :</label>
							 <input type="text" name="PERSON_ID" size="40"
						style="height: 25px; border-radius: 5pt;" required  minlength="10" maxlength="10"/>
						
						 <br><br>
								<table>
									<tr>
										<td style="font-size: 20pt; font-weight: bold">تقديم طلب
											:</td>
									</tr>
									<tr>
										<td width="210pt"><label> <input type="checkbox"
												id="c1"> كتاب رسمي </label></td>
										<td><input type="file" accept="image/*" name="DOC"
											id="doc" disabled>
									</tr>
									<tr>
										<td width="210pt"><label> <input type="checkbox"
												id="c12">لاي حزب يبتع </label></td>
										<td><input type="text"  name="DOC2"
											id="doc2" disabled>
									</tr>
									
								</table>
								<br> <br><br>

											<table>
												<tr>
													<td colspan="2" style="font-size: 20pt; font-weight: bold">الشركاء الداخليين
														 :</td>
												</tr>
								
												<tr>
													<td>
														<table>
															<tr>
																<td width="100pt"><label><input
																		type="checkbox" id="c4"> الشرطة </label></td>
																<td><select
																	style="max-width: 75px; min-width: 75px"
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
												<tr>
													<td width="210pt">
														<table>
															<tr>
																<td width="100pt"><label><input
																		type="checkbox" id="c5"> المخابرات  </label></td>
																<td><select
																	style="max-width: 75px; min-width: 75px"
																	name="INTELLIGENCE_DEPARTMENT" disabled id="s2">
																		<%
																			sql = "SELECT * FROM gov.INTELLIGANCE_DEPARTMENTS";
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
													<td><input type="file" accept="image/*" name="INTELLIGENCE"
														id="intelligence" disabled>
												</tr>
												<tr>
													<td width="210pt">
														<table>
															<tr>
																<td width="100pt"><label><input
																		type="checkbox" id="c6"> الاستخبارات  </label></td>
																<td><select
																	style="max-width: 75px; min-width: 75px"
																	name="MILITARY_DEPARTMENT" disabled id="s3">
																		<%
																			sql = "SELECT * FROM gov.militarysecurity_departments";
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
													<td><input type="file" accept="image/*" name="MILITARY"
														id="military" disabled>
												</tr>
												
											</table>
											<br><br><br>
											<table>
											<tr>
													<td colspan="2" style="font-size: 20pt; font-weight: bold">الشركاء الخارجيين
														 :</td>
												</tr>
								
													<tr>
													<td>
														<table>
															<tr>
																<td width="100pt"><label><input
																		type="checkbox" id="c24"> الشرطة </label></td>
																<td><select
																	style="max-width: 75px; min-width: 75px"
																	name="POLICE_DEPARTMENT2" disabled id="s21">

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
												</tr>
												<tr>
													<td width="210pt">
														<table>
															<tr>
																<td width="100pt"><label><input
																		type="checkbox" id="c52"> المخابرات  </label></td>
																<td><select
																	style="max-width: 75px; min-width: 75px"
																	name="INTELLIGENCE_DEPARTMENT2" disabled id="s22">
																		<%
																			sql = "SELECT * FROM gov.INTELLIGANCE_DEPARTMENTS";
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
													<td><input type="file" accept="image/*" name="INTELLIGENCE2"
														id="intelligence2" disabled>
												</tr>
												<tr>
													<td width="210pt">
														<table>
															<tr>
																<td width="100pt"><label><input
																		type="checkbox" id="c62"> الاستخبارات  </label></td>
																<td><select
																	style="max-width: 75px; min-width: 75px"
																	name="MILITARY_DEPARTMENT2" disabled id="s32">
																		<%
																			sql = "SELECT * FROM gov.militarysecurity_departments";
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
													<td><input type="file" accept="image/*" name="MILITARY2"
														id="military2" disabled>
												</tr>
												
											</table>
											<br><br><br>

														

																						<hr
																							style="margin-left: 6%; margin-right: 6%; margin-top: -3%">
																							<br>
																								<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حـفـظ" onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>
<br/><br/><br/>		
</div>
		</div>																						<br><br><br>
		</form>

		<label style="font-weight: bold;"> ملاحظة: الزمن المستغرق من
			تاريخ الاستدعاء : 7 ايام عمل </label>
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
	enable("c1", "doc");
	enable("c12", "doc2");

	//enable("c8", "bond");
	//enable("c10", "city_hall2");
	
	enable2("c4", "police", "s1");
	enable2("c42", "unit", "s12");
	enable2("c5", "intelligence", "s2");
	enable2("c6", "military", "s3");

	enable2("c24", "police2", "s21");
	enable2("c52", "intelligence2", "s22");
	enable2("c62", "military2", "s32");

</script>

</html>


</script>
</html>