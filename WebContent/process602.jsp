<?xml version="1.0" encoding="windows-1256" ?>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>

<title> الشكاوي و مخالفات التنظيم كتاب من البلدية</title>
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>
</head>
<body dir="rtl">
<div class="form" style="background: #F0F3BD">

<form method="post" action="GovSystem"  enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="602" />
		
<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;"> الشكاوي و مخالفات التنظيم كتاب من البلدية</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%" />


<div style="padding-let:3%;padding-right:3%"></div><br/>
<label style="font-size:20pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text" name="PERSON_ID" size="40"
						style="height: 25px; border-radius: 5pt;" required minlength="10" maxlength="10"/>
<br/>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" /> استدعاء </label> </td> <td> <input type="file" accept="image/*" name="CALL_UP" id="call_up"  disabled="disabled" /></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2"/> اثبات شخصية </label> </td> <td> <input type="file" accept="image/*" name="PERSONAL_PROOF" id="personal_proof" disabled="disabled" /></td></tr>
</table><br/>
<br/><br/>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الداخليين  :</td> </tr>
<tr><td > <table> <tr> <td width="150pt"> <label><input type="checkbox" id="c3" />  الشرطة </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "JURISDICTION" disabled id ="s1">

		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="MUNICIPAL_DEPARTMENT" id="jurisdiction2" disabled="disabled" /></td></tr>
<tr><td width="210pt"> <table> <tr> <td width="150pt"> <label><input type="checkbox" id="c4" />  الوحدات الادارية </label> </td> <td> 
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "ADMIN_UNITS" disabled="disabled" id ="s2">
		<%
		sql = "SELECT * FROM gov.ADMINISTRATIVE_UNITS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="ADMIN_UNITS2" id="admin_units2" disabled="disabled" /></td></tr>
<tr><td width="210pt"> <table> <tr> <td width="150pt"> <label><input type="checkbox" id="c5" />  البلدية </label> </td> <td> 
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "MUNICIPAL_DEPARTMENT2" disabled="disabled" id ="s3">
		<%
		sql = "SELECT * FROM gov.municipal_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="CITY_HALL" id="city_hall" disabled="disabled" /></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c7" /> شؤؤن الفلسطينية </label> </td> <td> <input type="file" accept="image/*" name="GUARANTEE" id="guarantee15"  disabled="disabled" /></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c8" /> ادارة خط الحجازي </label> </td> <td> <input type="file" accept="image/*" name="GUARANTEE51" id="guarantee51"  disabled="disabled" /></td></tr>

</table><br/>

<table>
<tr><td colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الخارجين  :</td> </tr>
<tr><td > <table> <tr> <td width="120pt"> <label><input type="checkbox" id="c9" />  الشرطة  </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "POLICE2" disabled="disabled" id ="s4">

		<%
		Connection conn2 = DatabaseConnection.getConnection();
		String sql2 = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		PreparedStatement pstmt2 = conn2.prepareStatement(sql2);
		ResultSet rs2 = pstmt2.executeQuery();
		while(rs2.next()){
			
			out.println("<option value = "+rs2.getInt(1)+">"+rs2.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="JURISDICTION42" id="jurisdiction42" disabled="disabled" /></td></tr>
<tr><td width="210pt"> <table> <tr> <td width="120pt"> <label><input type="checkbox" id="c10" />  البلدية </label> </td> <td> 
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "MUNICIPAL_DEPARTMENT3" disabled="disabled" id ="s5">
		<%
		sql = "SELECT * FROM gov.municipal_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="CITY_HALL2" id="city_hall2" disabled="disabled" /></td></tr>
		<tr><td width="210pt"> <label> <input type="checkbox" id="c11" /> شؤؤن الفلسطينية </label> </td> <td> <input type="file" accept="image/*" name="GUARANTEE3" id="guarantee3"  disabled="disabled" /></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c13" /> ادارة خط الحجازي </label> </td> <td> <input type="file" accept="image/*" name="GUARANTEE44" id="guarantee44"  disabled="disabled" /></td></tr></table><br/><table>
<tr><td style="font-size:20pt; font-weight:bold"> نموئج كفالة او تعهد :</td> </tr>
		<tr><td width="210pt"> <label> <input type="checkbox" id="c12" /> نموئج كفالة او تعهد </label> </td> <td> <input type="file" accept="image/*" name="GUARANTEE4" id="guarantee4"  disabled="disabled" /></td></tr>

</table><br/><br/>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%"/><br/>
<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حـفـظ" onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>
<br/><br/><br/>		
</div>
<br/><br/><br/>		
</form>

<label style="font-weight:bold;"> ملاحظة: الزمن المستغرق من تاريخ الاستدعاء : 30 يوم </label>
</div>
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
enable("c1","call_up");
enable("c2","personal_proof");
enable2("c3","jurisdiction2","s1");
enable2("c4","admin_units2","s2");
enable2("c5","city_hall","s3");
enable("c13","guarantee44");
enable2("c7","guarantee15");
enable("c8","guarantee51");
enable2("c9","jurisdiction42","s4");
enable2("c10","city_hall2","s5");
enable("c11","guarantee3");
enable("c12","guarantee4");

</script>
</body>

</html>