<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>

<title>بيان ترخيص الشقق المفروشة و الفندقية و سكن الطالبات </title>
</head>



<body dir="rtl">
<div class="form">

<form method="post" action="GovSystem"    enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="113" />
		

<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;"> بيان ترخيص الشقق المفروشة و الفندقية و سكن الطالبات</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:18pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" minlength="10" maxlength="10" required />
<br><br>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" >استدعاء </label> </td> <td> <input type="file" accept="image/*" name="CALL_UP" id="CALLUP"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2"> مخطط الموقع التنظيمي </label> </td> <td> <input type="file" accept="image/*" name="MAP_SITE" id="ORGCHART" disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c3"> رخصة الانشاءات </label> </td> <td> <input type="file" accept="image/*" name="LICENSE" id="LICENSE" disabled ></tr>

</table><br>
<br><br>

<table>
<tr><td style="font-size:20pt; font-weight:bold"> سند الكفالة العدلية :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c4" >سند الكفالة  </label> </td> <td> <input type="file" accept="image/*" name="BOND" id="GURANTEE"  disabled ></tr>
</table><br>
<br><br>



<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">
 الشركاء الداخليين (اللجان) :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" >  الشرطة </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "POLICE_DEPARTMENT" disabled id ="s1">

		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.police_departments";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="POLICE" id="POLICE" disabled ></tr>
		
		
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
				
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c6" >  الدفاع المدني:</label> </td> <td> 
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "CIVIL_DEPARTMENT" disabled id ="s2">
		<%
		sql = "SELECT * FROM gov.civil_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="CIVIL" id="CIVIL" disabled ></tr>
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c7" > الامن العسكري: </label> </td> <td> 
<select style="max-width:75px; min-width:75px" name = "MILITARYSECURITY_DEPARTMENT" disabled id ="s3">
		<%
		sql = "SELECT * FROM gov.MILITARYSECURITY_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="MILITERY" id="MS" disabled></tr>
		
	<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c8" > البلدية: </label> </td> <td> 
<select style="max-width:75px; min-width:75px" name = "MUNICIPAL_DEPARTMENT" disabled id ="s4">
		<%
		sql = "SELECT * FROM gov.MUNICIPAL_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="CITY_HALL" id="MUNI" disabled></tr>	
		
		
		<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c9" > السياحة و الاثار : </label> </td> <td> 
<select style="max-width:75px; min-width:75px" name = "TOURISM_DEPARTMENT" disabled id ="s5">
		<%
		sql = "SELECT * FROM gov.financial_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="TOURISM" id="TOURISM" disabled></tr>	
		
		
		<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c10" > المخابرات العامة: </label> </td> <td> 
<select style="max-width:75px; min-width:75px" name = "INTELLIGANCE_DEPARTMENT" disabled id ="s6">
		<%
		sql = "SELECT * FROM gov.financial_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="INTELLIGANCE" id="GI" disabled></tr>	
		

</table><br><br><br>
	<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حفظ" onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="إنهاء"/>
</a>
<br/><br/><br/>		
</div>
</form>

<label style="font-weight:bold;"> ملاحظة: الزمن المستغرق من تاريخ الاستدعاء : 30 يوم </label>
</div>
</div>
</body>

<script type="text/javascript" >

function myFunction() {
	alert("تـم الحـفـظ بـنـجـاح");
}

function enable(x,y){
	document.getElementById(x).onchange = function() {
	    document.getElementById(y).disabled = !this.checked;};}
	    
function enable2(x,y,z){
document.getElementById(x).onchange = function() {
    document.getElementById(y).disabled = !this.checked;
	document.getElementById(z).disabled = !this.checked;};}
enable("c1","CALLUP");
enable("c2","ORGCHART");
enable("c3","LICENSE");
enable("c4","GURANTEE");
enable2("c5","POLICE","s1");
enable2("c42","unit","s12");
enable2("c6","CIVIL","s2");
enable2("c7","MS","s3");
enable2("c8","MUNI","s4");
enable2("c9","TOURISM","s5");
enable2("c10","GI","s6");

</script>

</html>