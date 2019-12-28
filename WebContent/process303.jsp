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


<title>
اقامة مركز توزيع الغاز

</title>



</head>

<body dir="rtl" >




	<div class="form" style="background: #EF9A9A">
		<form method="post" action="GovSystem" 
			enctype="multipart/form-data">

			<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" /> <input
				type="hidden" name="HU$PROCESS_NUM" value="303" />
				
				
				
				
							<p
				style="text-align: center; margin-top: -1px; font-size: 30pt; font-weight: bold;">
				
				اقامة مركز توزيع الغاز
				
				</p>

			<hr style="margin-left: 6%; margin-right: 6%; margin-top: -3%">


				<div style="padding-let: 3%; padding-right: 3%">
					<br> 
					<label style="font-size: 18pt; font-weight: bold;">
							الرقم الوطني :</label>
							 <input type="text" name="PERSON_ID" size="40"
						style="height: 25px; border-radius: 5pt;" required minlength="10" maxlength="10"/>
						
						 <br><br>
						 
						 
						 								<table>
									<tr>
										<td style="font-size: 20pt; font-weight: bold">تقديم طلب
											:</td>
									</tr>
						 
						 
						 			<tr>
						<td width="210pt"><label> <input type="checkbox"
								id="chk1">  كتاب رسمي (اشركة مصفاة البترول) </label></td>
						<td><input type="file" accept="image/*" name="OFF_BOOK"
							id="off_book" disabled>
					</tr>
						 
						 
						 
						 
						 	 
					
					 
						 			<tr>
						<td width="210pt"><label> <input type="checkbox"
								id="chk3">
								مخطط تنظيمي حديث
								</label></td>
						<td><input type="file" accept="image/*" name="NEW_PLAN"
							id="new_plan" disabled>
					</tr>
					
					
						 			<tr>
						<td width="210pt"><label> <input type="checkbox"
								id="chk4">
								رخصة انشاءات
								</label></td>
						<td><input type="file" accept="image/*" name="CON_LICENSE"
							id="con_license" disabled>
					</tr>
					
					
					
						 			<tr>
						<td width="210pt"><label> <input type="checkbox"
								id="chk5">
								مخطط اراضي حديث



								</label></td>
						<td><input type="file" accept="image/*" name="GROUND_BP"
							id="ground_bp" disabled>
					</tr>
					
					
					
					

					
						 			<tr>
						<td width="210pt"><label> <input type="checkbox"
								id="chk6">
								استدعاء من صاحب االعلاقة



								</label></td>
						<td><input type="file" accept="image/*" name="CALL_PERSON"
							id="call_person" disabled>
					</tr>
					
					
											 				</table>
					
					</div>
                   					
					
					<br>
				<br>
				<br>
				<table>
					<tr>
						<td colspan="2" style="font-size: 20pt; font-weight: bold">الشركاء
						الداخلين
							:</td>
					</tr>



					<tr>
					<td>
						<table>
							<tr>
								<td width="100pt"><label><input type="checkbox"
										id="chk7"> الشرطة </label></td>




								<td><select style="max-width: 75px; min-width: 75px"
									name="POLICE_DEPARTMENT" disabled id="s2">

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
					
					<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="chk8" >  الصحة </label> </td> <td>
<select style="max-width:75px; min-width:75px" name = "HEALTH_DEPARTMENT" disabled id ="s4">
		<%
		sql = "SELECT * FROM gov.health_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="HEALTH" id="health" disabled></tr>
					
					
					
					<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="chk9" >  الدفاع المدني </label> </td> <td>
<select style="max-width:75px; min-width:75px" name = "CIVIL_DEPARTMENT" disabled id ="s3">
		<%
		sql = "SELECT * FROM gov.civil_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="CIVIL" id="civil" disabled></tr>
					
					
					
					
					
	<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="chk10" > المخابرات </label> </td> <td>
<select style="max-width:75px; min-width:75px" name = "INTELLIGANCE_DEPARTMENT" disabled id ="s1">
		<%
		sql = "SELECT * FROM gov.intelligance_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="INTELLIGANCE" id="intelligance" disabled></tr>
					
					
					
					
					
					
					
					<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="chk11" > البيئة</label> </td> <td>
<select style="max-width:75px; min-width:75px" name = "ENV_DEPARTMENT" disabled id ="s5">
		<%
		sql = "SELECT * FROM gov.intelligance_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="ENV" id="env" disabled></tr>
					
					
			</table>
					
					<br><br><br><br><br>
			<table>		
				
					<tr>
						<td colspan="2" style="font-size: 20pt; font-weight: bold">الشركاء
						الخارجيين
							:</td>
					</tr>
					
						<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="chk12" >شركة مصفاة البترول</label> </td> <td>
<select style="max-width:75px; min-width:75px" name = "ENERGY_DEPARTMENT" disabled id ="s6">
		<%
		sql = "SELECT * FROM gov.intelligance_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="ENERGY" id="energy" disabled></tr>
		</table><br><br><br>
		
																						<hr
																							style="margin-left: 6%; margin-right: 6%; margin-top: -3%">
																							<br>
																								<div style="margin-right:28%">
<input class="form-appointment" type="submit" value="حـفـظ"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>
<br/><br/><br/>		
</div>
																								<br><br><br>
		</form>

	
	
		<label style="font-weight: bold;"> 
ملاحظة: الزمن المستغرق من
	تاريخ الاستدعاء :يوم عمل رسمي
</label>
	
	</div>
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
	enable("chk1", "off_book");
	
	enable("chk3", "new_plan");
	enable("chk4", "con_license");
	enable("chk5", "ground_bp");
	enable("chk6", "call_person");
	
	enable2("chk7", "police", "s2");
	enable2("c42", "unit", "s12");
	enable2("chk8", "health", "s4");
	enable2("chk9", "civil", "s3");
	enable2("chk10", "intelligance", "s1");
	enable2("chk11", "env", "s5");
	enable2("chk12", "energy", "s6");
</script>
							
						 
						 </html>
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
				



