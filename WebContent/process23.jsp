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
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>


<title>المطالبات المالية الواردة من الجهات الرسمية الخاضعة اموالها لقانون تحصيل الاموال الاميرية</title>
</head>
<body dir="rtl">
<div class="form">
<form method="post" action="GovSystem" enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="123" />	

<p style="text-align:center; margin-top:-1px; font-size:20pt; font-weight:bold;">المطالبات المالية الواردة من الجهات الرسمية الخاضعة اموالها لقانون تحصيل الاموال الاميرية</p>
<hr style="margin-left:6%; margin-right:6%;margin-top:-3%" />
<br/>
<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:18pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required minlength="10" maxlength="10" />
<br><br>
<br/><br/>
<table>
<tr><td  colspan="2" style="font-size:15pt; font-weight:bold">الشركاء الداخليين :</td> </tr>
<tr><td > <table> <tr> <td>
 <label><input type="checkbox" id="c1"/>  الجهات الرسمية ذات العلاقة </label>  </td> <td> 
<input type="text" size="50"name="ROB" id="rob" disabled="disabled" style="width: 250px ; margin-right: 10px ;  "/>
</td></tr></table> </td></tr>
</table><br/>
<br/><br/>

<table>
<tr><td colspan="2" style="font-size:15pt; font-weight:bold">الشركاء الخارجين :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c2" />  مديرية الشرطة </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "POLICE_DEPARTMENT" disabled="disabled" id ="police">

		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		
</select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="POLICE" id="policef" disabled="disabled"/></td></tr>
</table><br/>
<br/><br/>
<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حـفـظ"  onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>
<br/><br/><br/>		
</div>
	
</form>

<label style="font-weight:bold;"> ملاحظة: الزمن المستغرق من تاريخ الاستدعاء : 30 يوم </label>
</div>
<script type="text/javascript" >

function myFunction() {
	alert("تـم الحـفـظ بـنـجـاح");
}    

function enable(x,y){
	document.getElementById(x).onchange = function() {
	    document.getElementById(x).disabled = !this.checked;
		document.getElementById(y).disabled = !this.checked;};}
function enable2(x,y,z){
document.getElementById(x).onchange = function() {
    document.getElementById(y).disabled = !this.checked;
	document.getElementById(z).disabled = !this.checked;};}
enable("c1","rob");
enable2("c2","police","policef");
</script>
</body>

</html>