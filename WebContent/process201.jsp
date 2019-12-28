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

<title>متابعة المشاريع الرأس مالية /اللجنة    </title>
</head>


<body dir="rtl">
<div class="form">
<form method="post" action="GovSystem"    enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="201" />
		

<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">متابعة المشاريع الرأس مالية /اللجنة     </p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:18pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required minlength="10" maxlength="10" />
<br><br>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > نسخة العطاء</label> </td> <td> <input type="file" accept="image/*" name="TENDER" id="tender"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2" >لجنة متابعة المشاريع   </label> </td> <td> <input type="file" accept="image/*" name="COMMITTEE" id="committee"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c3" > تقرير الكشف  </label> </td> <td> <input type="file" accept="image/*" name="DISCLOSURE" id="disclosure"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c7" > تقرير تقدم سير العمل  </label> </td> <td> <input type="file" accept="image/*" name="WORKFLOW" id="workflow"  disabled ></tr>


</table><br>
<br><br>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold"> شركاء خارجيين  :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c4" > مديرية الاشغال </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "DIRECTORATE_DEPARTMENT" disabled id ="s1">

		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.DIRECTORATE_DEPARTMENTS";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="DIRECTORATE" id="directorate" disabled ></tr>
		
		<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" > مديرية الابنية الحكومية </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "BUILDINGS_DEPARTMENT" disabled id ="s2">

		<%
		 conn = DatabaseConnection.getConnection();
		 sql = "SELECT * FROM gov.BUILDINGS_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
		 rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="BUILDINGS" id="buildings" disabled ></tr><br><br><br>
		
	
		 <table> <tr>  <td width="100pt" > <label><input type="checkbox" id="c6" >الجهات ذات العلاقة  </label>  </td> <td> 
	<select style="max-width:75px; min-width:75px" name = "RELATED_DEPARTMENT" disabled id ="s3">	

		<%
		 conn = DatabaseConnection.getConnection();
		 sql = "SELECT * FROM gov.RELATED_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
		 rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> <input type="file" accept="image/*" name="RELATED" id="related" disabled /> </td></tr>
	
		
		
</table> 

<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حفظ" onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="إنهاء"/>
</a>
<br/><br/><br/>		
</div>

<label style="font-weight:bold;">  الزمن المستغرق اسبوعين </label>
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
enable("c1","tender");
enable("c2","committee");
enable("c3","disclosure");
enable2("c4","directorate","s1");
enable2("c5","buildings","s2");
enable2("c6","related","s3");
enable("c7","workflow");


</script>

</html>


</script>
</html>