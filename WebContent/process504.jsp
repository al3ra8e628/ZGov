<%@page import="org.database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>

<title>تخفيض رقابة الشرطة</title>
</head>

<body dir="rtl">
<div class="form" style="background-color: #E2E2E2;">

<form method="post" action="GovSystem"  enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="504" />


<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">تخفيض رقابة الشرطة</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:20pt;font-weight:bold;"> الرقم الوطني :</label>
	 <input type="text" name="PERSON_ID" size="40"
						style="height: 25px; border-radius: 5pt;" required minlength="10" maxlength="10" />
		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.PERSON_PROFILE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		%><br><br>
<table>

<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > استدعاء </label> </td> <td> <input type="file" accept="image/*" name="CALL_UP" id="call_up"  disabled ></tr>
</table>
<br><br>
<table>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2" > اثبات الشخصية </label> </td> <td> <input type="file" accept="image/*" name="IDENTIFY" id="identify"  disabled ></tr>
</table><br>
<br><br>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الداخليين (اللجان) :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c3" >جهة الاختصاص </label>  </td> <td>
<select style="max-width:75px; min-width:75px" name = "POLICE_DEPARTMENT" disabled id ="s1">

		<%

		sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="POLICE" id="police" disabled ></tr>

<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c4" > الوحدات الادارية </label> </td> <td>
<select style="max-width:75px; min-width:75px" name = "ADV_UNITS" disabled id ="s2">
		<%
		sql = "SELECT * FROM gov.ADMINISTRATIVE_UNITS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="ADV" id="adv" disabled></tr>
		
		
		
		
		
		
		




		</table><br><br><br>
<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الخارجيين : </td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c32" >جهة الاختصاص </label>  </td> <td>
<select style="max-width:75px; min-width:75px" name = "POLICE_DEPARTMENT2" disabled id ="s12">

		<%

		sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%>
	
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="POLICE2" id="police2" disabled ></td>
	
		</tr>
		
		<tr>
				
				<td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" > قرار تخفيض الرقابة </label>  </td></tr></table>
				 </td> <td> <input type="file" accept="image/*" name="REDUCE_DES" id="redce_des" disabled ></td>
		
		</tr>
		
		
		</table>
<br><br>
<hr style="margin-left:6%; margin-right:6%;margin-top:-3%"><br>
<div style="margin-right:28%">
<input class="form-appointment" type="reset" value="تفريغ" >
<input class="form-appointment" type="button" value="حـفـظ"   onclick="addProcess()">
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء" /></a>
</div><br><br><br>		
</form>

<label style="font-weight:bold;"> ملاحظة: الزمن المستغرق من تاريخ الاستدعاء : يوم عمل رسمي </label>
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
enable("c1","call_up");
enable("c2","identify");
enable2("c3","police","s1");
enable2("c4","adv","s2");
enable2("c32","police2","s12");
enable("c5","redce_des");




</script>

</html>


</script>
</html>