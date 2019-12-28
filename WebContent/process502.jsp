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
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>
<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>

<title>الافراج عن موقوف</title>
</head>
<body dir="rtl">
<div class="form" style="background-color: #E2E2E2;">

<form method="post" action="GovSystem"  enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="502" />
		
<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">الافراج عن موقوف</p>

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
<tr><td > <table> <tr> <td width="150pt"> <label><input type="checkbox" id="c3" />  جهة الاختصاص </label>  </td> <td> 
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
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="JURISDICTION2" id="jurisdiction2" disabled="disabled" /></td></tr>
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

</table><br/>

<table>
<tr><td colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الخارجين  :</td> </tr>
<tr><td > <table> <tr> <td width="120pt"> <label><input type="checkbox" id="c5" />  جهة الاختصاص </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "JURISDICTION3" disabled="disabled" id ="s3">

		<%
		Connection conn2 = DatabaseConnection.getConnection();
		String sql2 = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		PreparedStatement pstmt2 = conn2.prepareStatement(sql2);
		ResultSet rs2 = pstmt2.executeQuery();
		while(rs2.next()){
			
			out.println("<option value = "+rs2.getInt(1)+">"+rs2.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="JURISDICTION4" id="jurisdiction4" disabled="disabled" /></td></tr>
</table><br/><table>
<tr><td style="font-size:20pt; font-weight:bold">كفالة :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c6" /> كفالة </label> </td> <td> <input type="file" accept="image/*" name="GUARANTEE" id="guarantee"  disabled="disabled" /></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c7"/> قرار الافراج </label> </td> <td> <input type="file" accept="image/*" name="DECISION_RELEASE" id="decision_release" disabled="disabled" /></td></tr>
</table><br/><br/>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%"/><br/>
<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حـفـظ"  onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>
<br/><br/><br/>		
</div>
<br/><br/><br/>		
</form>

<label style="font-weight:bold;"> ملاحظة: الزمن المستغرق من تاريخ الاستدعاء : يوم عمل رسمي </label>
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
enable2("c5","jurisdiction4","s3");
enable("c6","guarantee");
enable2("c7","decision_release");
</script>
</body>

</html>