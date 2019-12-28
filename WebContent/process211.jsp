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
<title>بناء قاعدة معلومات بالفقر والبطالة بالتعاون مع التنمية الاجتماعية  </title>
</head>


<body dir="rtl">
<div class="form">
<form method="post" action="GovSystem"  enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="211" />
		

<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">بناء قاعدة معلومات بالفقر والبطالة بالتعاون مع التنمية الاجتماعية   </p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:18pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required minlength="10" maxlength="10" />
<br><br>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > مخاطبات الدوائر الرسمية  </label> </td> <td> <input type="file" accept="image/*" name="CIRCULATION_CIRCUITS" id="circulation_circuits"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2" >المعلومات المقدمة من الدوائر  </label> </td> <td> <input type="file" accept="image/*" name="CIRCUIT_INFORMATION" id="circuit_information"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c3" > النماذج المعدة من قبل وحدة اتنمية  </label> </td> <td> <input type="file" accept="image/*" name="DEVELOPMENT_MODELSBLOB" id="development_models"  disabled ></tr>
</table><br>
<br><br>


<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold"> شركاء داخلين  :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c4" > مواطنين </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "PEPOLE_DEPARTMENT" disabled id ="s1">

		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.PEPOLE_DEPARTMENTS";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="PEPOLE" id="pepole" disabled ></tr>
		
		<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" > المؤوسات </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "INSTITUTIONS_DEPARTMENT" disabled id ="s2">

		<%
		 conn = DatabaseConnection.getConnection();
		 sql = "SELECT * FROM gov.INSTITUTIONS_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
		 rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="INSTITUTIONS" id="institutions" disabled ></tr>

		
		
		<table>
<tr><td colspan="2" style="font-size:20pt; font-weight:bold">شركاء خارجين :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c6" >أقسام المحافظة </label> </td> <td> <input type="file" accept="image/*" name="GOVERNORATE_SECTION" id="governorate_section" disabled ></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c7" > الدوائر الرسمية في المحافظة</label> </td> <td> <input type="file" accept="image/*" name="PROVINCIAL_CONSTITUENCIES" id="directirate" disabled ></td></tr>
</table><br><br><br><br><br>





</table><br><br><br>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%"><br>

<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حـفـظ"  onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>
<br/><br/><br/>		
</div><br><br><br>		
</form>

<label style="font-weight:bold;">  الزمن المستغرق غير محدد </label>
</div>
</div>
</body>

<script type="text/javascript" >


function enable(x,y){
	document.getElementById(x).onchange = function() {
	    document.getElementById(y).disabled = !this.checked;};}
	    
function enable2(x,y,z){
document.getElementById(x).onchange = function() {
    document.getElementById(y).disabled = !this.checked;
	document.getElementById(z).disabled = !this.checked;};}
enable("c1","circulation_circuits");
enable2("c2","circuit_information");
enable2("c3","development_models");
enable2("c4","pepole","s1");
enable2("c5","institutions","s2");
enable2("c6","governorate_section");
enable2("c7","directirate");

</script>

</html>


</script>
</html>