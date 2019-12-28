<?xml version="1.0" encoding="windows-1256" ?>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>

<title>متابعة مشاريع المبادرات الملكية السامية</title>
</head>


<body dir="rtl">
<div class="form">
<form method="post" action="GovSystem"   enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="205" />
		

<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">متابعة مشاريع المبادرات الملكية السامي</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:18pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required minlength="10" maxlength="10" />
<br><br>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" >نسخة العطاء </label> </td> <td> <input type="file" accept="image/*" name="COPY" id="report_pic"  disabled ></tr>
</table><br>
<br><br>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء (الداخلين والخارجين) :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c2" > الدوائر المعنية </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "DEPARTMENT_DEPARTMENT" disabled id ="s2">
		<%
		Connection conn = DatabaseConnection.getConnection() ; 
		String sql = "SELECT * FROM gov.DEPARTMENT_DEPARTMENTS";
		PreparedStatement pstmt = conn.prepareStatement(sql);
	    ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="DEPARTMENT" id="department" disabled></tr>


<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c3" > الديوان الملكي العامر</label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "ROYAL_DEPARTMENT" disabled id ="s3">
		<%
		 conn = DatabaseConnection.getConnection() ; 
		 sql = "SELECT * FROM gov.ROYAL_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="ROYAL" id="committeet" disabled></tr>


<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c4" > استشاري المشروع </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "ADVISORY_DEPARTMENT" disabled id ="s4">
		<%
		 conn = DatabaseConnection.getConnection() ; 
		 sql = "SELECT * FROM gov.ADVISORYT_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="ADVISORY" id="advisory" disabled></tr>


<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" > المقاول  </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "CONTRACTORT_DEPARTMENT" disabled id ="s5">
		<%
		 conn = DatabaseConnection.getConnection() ; 
		 sql = "SELECT * FROM gov.CONTRACTOR_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="CONTRACTOR" id="contructort" disabled></tr>


<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c6" > الدوائر الحكومية   </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "GOVERNMENT_DEPARTMENT" disabled id ="s6">
		<%
		 conn = DatabaseConnection.getConnection() ; 
		 sql = "SELECT * FROM gov.GOVERNMENT_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="GOVERNMENT" id="government" disabled></tr>


</table><br><br><br>

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
enable("c1","report_pic");


enable2("c2","department","s2");
enable2("c3","committeet","s3");
enable2("c4","advisory","s4");
enable2("c5","contructort","s5");
enable2("c6","government","s6");
     
</script>

</html>


</script>
</html>