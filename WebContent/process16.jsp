<?xml version="1.0" encoding="windows-1256" ?>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.database.DatabaseConnection"%>

<%@page import="org.database.DatabaseConnection"%>

<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>

<title>قرارات الحجز</title>
</head>



<body dir="rtl">
<div class="form">

<form method="post" action="GovSystem"  enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="116" />


<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">قرارات الحجز</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:20pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required minlength="10" maxlength="10" />
<br><br>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" >الكتااب الرسمي</label> </td> <td> <input type="file" accept="image/*" name="OFFICIAL_BOOK" id="official_book"  disabled ></tr>

</table>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الداخليين (اللجان) :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c4" >مديرية الشؤون الداخلية والاموال العامة</label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "MINISTRY_OF_INTERNAL_AFFAIRS" disabled id ="s1">

		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.PERSON_PROFILE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		sql = "SELECT * FROM gov.MINISTRY_OF_INTERNAL_AFFAIRS";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="INTERNAL_AFFIARS" id="internal_affiars" disabled ></tr>
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" > دائرة الجمارك الاردنية </label> </td> <td> 
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "CUSTOMS_DEPARTMENT" disabled id ="s2">
		<%
		sql = "SELECT * FROM gov.CUSTOMS_DEPARTMENT";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select> </td></tr></table> </td><td> <input type="file" accept="image/*" name="CUSTOMS" id="customs" disabled ></tr><br><br><br>

</table>
<br/><br/><br/>
<table>

<tr><td colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الخارجين (الموافقات) :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c9" >دائرة الاراضي والمساحة </label> </td> <td> <input type="file" accept="image/*" name="LANDS" id="lands" disabled ></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c10" >ادارة ترخيص السواقين والمركبات </label> </td> <td> <input type="file" accept="image/*" name="DRIVERS" id="drivers" disabled ></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c11" > الجهات الأمنية الأخرىز  </label> </td> <td> <input type="file" accept="image/*" name="OTHER" id="other" disabled ></td></tr>
</table><br><br><br><br><br>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%"><br>
<div style="margin-right:28%"><input class="form-appointment" type="button" value="حـفـظ" onclick="addProcess()">


<input class="form-appointment" type="reset" value="تفريغ" >
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS"">
<input class="form-appointment" type="button" value="انـهـاء" /></a>
</div><br><br><br>		
</form>

<label style="font-weight:bold;"> ملاحظة: الزمن المستغرق من تاريخ الاستدعاء : 30 يوم </label>
</div>
</div>
</body>

<script type="text/javascript" >

function myFunction() {
	alert("تـم الحـفـظ بـنـجـاح");
	setTimeout(function(){
		  window.location.reload();
		});
	location.reload();
}

function enable(x,y){
	document.getElementById(x).onchange = function() {
	    document.getElementById(y).disabled = !this.checked;};}
	    
function enable2(x,y,z){
document.getElementById(x).onchange = function() {
    document.getElementById(y).disabled = !this.checked;
	document.getElementById(z).disabled = !this.checked;};}

enable("c1","official_book");
enable2("c4","internal_affiars","s1");
enable2("c5","customs","s2");
enable("c9","lands");
enable("c10","drivers");
enable("c11","other");



</script>

</html>


</script>
</html>