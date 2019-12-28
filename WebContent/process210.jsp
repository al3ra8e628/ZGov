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
<meta harset="windows-1256" />
<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>
<title>دائرة التخطيط و التنمية</title>
</head>


<body dir="rtl">
<div class="form">

<form method="post" action="GovSystem"  enctype="multipart/form-data"  id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="210" />
		


<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">دائرة التنمية و التخطيط</p>




<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>

<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:18pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required minlength="10" maxlength="10" />
<br><br>

<table>
<tbody><tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1">مخاطبات الدوائر الرسمية</label> </td> <td> <input type="file" accept="image/*" name="COMI" id="comi" disabled=""></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2">المعلومات المقدمة من الدوائر</label> </td> <td> <input type="file" accept="image/*" name="INFORMATION" id="information" disabled=""></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c3">الاجتماعات مع ضباط ارتباط الدوائر</label> </td> <td><input type="file" accept="image/*" name="MEET" id="meet" disabled=""></td></tr>
</tbody></table>

<table>
<tbody><tr><td colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الداخليين:</td> </tr>
<tr><td> <table> <tbody><tr> <td width="100pt"> <label><input type="checkbox" id="c4">اقسام المحافظة</label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name="SECTION_DEPARTMENT" id="s1" disabled="">

			<%
		Connection conn = DatabaseConnection.getConnection();

		String sql = "SELECT * FROM gov.SECTION_DEPARTMENTS";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
			%>
		</select> </td></tr></tbody></table> </td> <td> <input type="file" accept="image/*" name="SECTION" id="section" disabled=""></td></tr>



</tbody></table>


<table>
<tbody><tr><td colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الخارجيين:</td> </tr>
<tr><td> <table> <tbody><tr> <td width="100pt"> <label><input type="checkbox" id="c5">الدوائر الرسمية في المحافظة</label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name="DO_DEPARTMENT" id="s2" disabled="">

			<%
		 conn = DatabaseConnection.getConnection();

		 sql = "SELECT * FROM gov.DO_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
		 rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
			%>
		</select> </td></tr></tbody></table> </td> <td> <input type="file" accept="image/*" name="DO" id="do" disabled=""></td></tr>



</tbody></table>

<br/>
<br/>
<br/>
<hr style="margin-left:6%; margin-right:6%;margin-top:-3%"><br>
<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حـفـظ"  onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>
<br/><br/><br/>		
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
enable("c1","comi");
enable("c2","information");
enable("c3","meet");
enable2("c5","do","s2");
enable2("c4","section","s1");

</script>

</html>


</script>
</html>