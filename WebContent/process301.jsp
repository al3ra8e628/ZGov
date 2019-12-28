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
<title>

الشكاوي المتعلقة بامور الصحة و السلامة العامة
</title>

</head>
<body dir="rtl">

<div class="form"  style="background: #EF9A9A">
	<form method="post" action="GovSystem" enctype="multipart/form-data">

		<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" /> <input
			type="hidden" name="HU$PROCESS_NUM" value="301" />

		<p
			style="text-align: center; margin-top: -1px; font-size: 30pt; font-weight: bold;">
	الشكاوي المتعلقة بامور الصحة و السلامة العامة

		</p>


		<hr style="margin-left: 6%; margin-right: 6%; margin-top: -3%">
		<div style="padding-let: 3%; padding-right: 3%">
			<br>
			<label style="font-size: 18pt; font-weight: bold;">الرقم
				الوطني :</label> <input type="text" name="PERSON_ID" size="40"
				style="height: 25px; border-radius: 5pt;" required  minlength="10" maxlength="10"/> <br>
			<br>
			<table>
				<tr>
					<td style="font-size: 20pt; font-weight: bold">تقديم طلب :</td>
				</tr>
				<tr>
					<td width="210pt"><label> <input type="checkbox"
							id="c1"> استدعاء </label></td>
					<td><input type="file" accept="image/*" name="CALL_UP"
						id="call_up" disabled>
				</tr>
				<tr>
					<td width="210pt"><label> <input type="checkbox"
							id="c122"> اثبات هوية </label></td>
					<td><input type="file" accept="image/*" name="ACCEPT"
						id="accept" disabled>
				</tr>

			</table>

			<TABLE>
				<tr>
					<td colspan="2" style="font-size: 20pt; font-weight: bold">الشركاء
						الداخليين (اللجان) :</td>
				<tr>
					<td>
						<table>
							<tr>
								<td width="100pt"><label><input type="checkbox"
										id="c4"> الشرطة </label></td>
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
										id="c5"> البلدية </label></td>
								<td><select style="max-width: 75px; min-width: 75px"
									style="max-width:200px;" name="MUNICIPAL_DEPARTMENT" disabled
									id="s2">
										<%
																			sql = "SELECT * FROM gov.municipal_departments";
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
					<td><input type="file" accept="image/*" name="CITY_HALL"
						id="city_hall" disabled>
				</tr>
				<tr>
					<td width="210pt">
						<table>
							<tr>
								<td width="100pt"><label><input type="checkbox"
										id="c6"> الدفاع المدني </label></td>
								<td><select style="max-width: 75px; min-width: 75px"
									name="CIVIL_DEPARTMENT" disabled id="s3">
										<%
																			sql = "SELECT * FROM gov.civil_departments";
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
					<td><input type="file" accept="image/*" name="CIVIL"
						id="civil" disabled>
				</tr>
				<tr>
					<td width="210pt">
						<table>
							<tr>
								<td width="100pt"><label><input type="checkbox"
										id="c7"> الصحة </label></td>
								<td><select style="max-width: 75px; min-width: 75px"
									name="HEALTH_DEPARTMENT" disabled id="s4">
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
						<tr>
							<td width="210pt"><table><tr>
								<td width="100pt"><label><input type="checkbox"
							id="c3322"> مديرية البيئة </label></td>
					<td><select style="max-width: 75px; min-width: 75px"
						name="GOV_DEPARTMENT2" disabled id="s442">
							<%
																			sql = "SELECT * FROM gov.GOV_DEPARTMENTS";
																			pstmt = conn.prepareStatement(sql);
																			rs = pstmt.executeQuery();
																			while (rs.next()) {

																				out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
																			}
																		%>
					</select></td></tr></table></td>
					<td><input type="file" accept="image/*" name="GOV_DEP2"
						id="gov_dep2" disabled></td>
							
							</tr>
				<tr>
					<td width="210pt"><table>
							<tr>
								<td width="100pt"><label><input type="checkbox"
										id="c33">جهات اخرى </label></td>

								
							</tr>		
						</table>
					</td>
					<td><input type="file" accept="image/*" name="OTHERS"
									id="others" disabled>
							
							</td>
				</tr>





			</TABLE>

			<br>
			<br>
			<br>
			<table>
				<tr>
					<td colspan="2" style="font-size: 20pt; font-weight: bold">   الشركاء الخارجيين <br></td>
					</tr>	
<tr>
					<td><table><tr>
					<td width="100pt"><label><input type="checkbox"
							id="c332"> مديرية البيئة </label></td>
					<td><select style="max-width: 75px; min-width: 75px"
						name="GOV_DEPARTMENT" disabled id="s44">
							<%
																			sql = "SELECT * FROM gov.GOV_DEPARTMENTS";
																			pstmt = conn.prepareStatement(sql);
																			rs = pstmt.executeQuery();
																			while (rs.next()) {

																				out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
																			}
																		%>
					</select></td></tr></table></td>
					<td><input type="file" accept="image/*" name="GOV_DEP"
						id="gov_dep" disabled></td>
				</tr>
				
				<tr>
					<td>
						<table>
							<tr>
								<td width="100pt"><label><input type="checkbox"
										id="c422"> الشرطة </label></td>
								<td><select style="max-width: 75px; min-width: 75px"
									name="POLICE_DEPARTMENT2" disabled id="s122">

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
								<td width="100pt"><label><input type="checkbox"
										id="c52"> البلدية </label></td>
								<td><select style="max-width: 75px; min-width: 75px"
									style="max-width:200px;" name="MUNICIPAL_DEPARTMENT2" disabled
									id="s22">
										<%
																			sql = "SELECT * FROM gov.municipal_departments";
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
					<td><input type="file" accept="image/*" name="CITY_HALL2"
						id="city_hall2" disabled>
				</tr>
				
			</table>

			<br>
			<br>
			<br>
			<table>
			<tr>
																			<td colspan="2"
																				style="font-size: 20pt; font-weight: bold">
																				   الكفالة او التعهد </td>
																		</tr>
			<tr>
																<td width="210pt"><label><input
																		type="checkbox" id="c8">نموذج الكفالة او التعهد
																	</label></td>
																<td><input type="file" accept="image/*" name="BOND"
																	id="bond" disabled>
															</tr>
														</table>
			<br>
			<br>
			<hr style="margin-left: 6%; margin-right: 6%; margin-top: -3%">
			<br>
			<div style="margin-right: 28%">
				<input class="form-appointment" type="submit" value="حـفـظ" /> <input
					class="form-appointment" type="reset" value="تفريغ" /> <a
					href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS"> <input
					class="form-appointment" type="button" value="انـهـاء" />
				</a> <br /> <br /> <br />
			</div>
			<br>
			<br>
			<br>
	</form>

	
		<label style="font-weight: bold;"> 
ملاحظة: الزمن المستغرق من
	تاريخ الاستدعاء :يوم عمل رسمي
</label>
	
</div>


</div>
</form>
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
	enable("c1", "call_up");
	enable("c122","accept");
	enable("c8", "bond");
	enable("c33","others");
	enable2("c4", "police", "s1");
	enable2("c422", "police2", "s122");
	enable2("c42", "unit", "s12");
	enable2("c5", "city_hall", "s2");
	enable2("c52", "city_hall2", "s22");
	enable2("c6", "civil", "s3");
	enable2("c7", "health", "s4");
	enable2("c332","gov_dep","s44");
	enable2("c3322","gov_dep2","s442");
	</script>


</html>