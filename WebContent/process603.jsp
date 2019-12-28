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

<title>
 اللجنة اللوائية 

</title>



</head>

<body dir="rtl" >




	<div class="form" style="background: #F0F3BD">
		<form method="post" action="GovSystem" 
			enctype="multipart/form-data" id="form">

			<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" /> <input
				type="hidden" name="HU$PROCESS_NUM" value="603" />
				
				
				
				
							<p
				style="text-align: center; margin-top: -1px; font-size: 30pt; font-weight: bold;">
				
				  اللجنة اللوائية
				
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
								id="chk1">  استدعاء </label></td>
						<td><input type="file" accept="image/*" name="OFF_BOOK"
							id="off_book" disabled>
					</tr>
						 
						 
						 
						 
						 	 
					
					 
						 			<tr>
						<td width="210pt"><label> <input type="checkbox"
								id="chk3">
								مخطط الاراضي
								</label></td>
						<td><input type="file" accept="image/*" name="NEW_PLAN"
							id="new_plan" disabled>
					</tr>
					
					

					
					
						 			<tr>
						<td width="210pt"><label> <input type="checkbox"
								id="chk5">
								البطاقة الشخصية للمستدعي  



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
						
							:</td>
					</tr>



					<tr>
					<td>
						<table>
							<tr>
								<td width="100pt"><label><input type="checkbox"
										id="chk7"> لجنة تنظيم المدن والقرى </label></td>




								<td><select style="max-width: 75px; min-width: 75px"
									name="ORGANIZING_COMMITTEE" disabled id="s2">

										<%
																			Connection conn = DatabaseConnection.getConnection();
																			String sql = "SELECT * FROM gov.ORGANIZING_COMMITTEE";
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
					<td><input type="file" accept="image/*" name="ORGANIZING"
						id="police" disabled>
					</tr>
					<tr>
					<td>
						<table>
							<tr>
								<td width="100pt"><label><input type="checkbox"
										id="c42"> قرار الموافقة  </label></td>
								
							</tr>
						</table>
					</td>
					<td><input type="file" accept="image/*" name="APROVAL"
						id="unit" disabled>
				</tr>
					
					<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="chk8" >  الاعلان </label> </td> 
					</tr></table> </td> <td> <input type="file" accept="image/*" name="ALERT" id="health" disabled></tr>
					
					
					
					<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="chk9" >  كتاب تغطية لوزير البلديات </label> </td> 
					</tr></table> </td> <td> <input type="file" accept="image/*" name="BOOK" id="civil" disabled></tr>
					
					
					
					
					
	
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

	enable("chk5", "ground_bp");
	enable("chk6", "call_person");
	
	enable2("chk7", "police", "s2");
	enable("c42", "unit");
	enable("chk8", "health");
	enable("chk9", "civil");
</script>
							
						 
						 </html>
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
				



