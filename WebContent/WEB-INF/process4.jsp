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
<style type="text/css">
.form-appointment {
	background-color: rgb(118, 207, 118);
	border: 1px solid rgb(134, 189, 134);
	border-radius: 4px;
	color: rgb(255, 255, 255);
	cursor: pointer;
	font-family: inherit;
	font-size: 1.4em;
	padding: 10px 18px;
}
.soflow {
   -webkit-appearance: button;
   -webkit-border-radius: 2px;
   -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
   -webkit-padding-end: 20px;
   -webkit-padding-start: 2px;
   background-position: 97% center;
   background-repeat: no-repeat;
   border: 1px solid #AAA;
   color: #555;
   font-size: inherit;
   margin: 20px;
   overflow: hidden;
   padding: 5px 10px;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 300px;
   font-weight:bold;
}

.form-appointment:hover {
	background-color: white;
	color: rgb(118, 207, 118);
}
</style>
<title>ترخيص مراكز الإنترنت</title>
</head>


<body dir="rtl" style="background-color:#E8E8E8;min-width:1300px;">
<div  style="box-shadow:0px 0px 10px rgb(118, 207, 118);margin-left:25%;margin-right:25%;margin-bottom:5%;border:solid thin green; border-radius:10pt;padding:3%;background-color:rgb(239, 252, 239);">

<form method="post" action="uploadFile"  enctype="multipart/form-data">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="104" />
		
<a href="" style="float:left"><input type="button" value="رجــوع" class="form-appointment"></a>
<a href="" style="float:right"><input type="button" value="التــالي" class="form-appointment"></a>

<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">ترخيص مراكز الإنترنت</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">



<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:20pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text" name="PERSON_ID" size="40" required style="border-radius:3pt;box-shadow:0px 0px 5px rgb(118, 207, 118)">
<br><br>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > استدعاء </label> </td> <td> <input type="file" accept="image/*" name="CALL_UP" id="call_up"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2"> مخطط موقع تنظيمي </label> </td> <td> <input type="file" accept="image/*" name="MAP_SITE" id="map_site" disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c3" > رخصة انشاءات </label> </td> <td><input type="file" accept="image/*" name="LICENSE" id="license" disabled ></tr>
</table><br>
<br><br>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الداخليين (اللجان) :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c4" >  الشرطة </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "POLICE_DEPARTMENT" disabled id ="s1">

		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.PERSON_PROFILE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="POLICE" id="police" disabled ></tr>
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" >  البلدية </label> </td> <td> 
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "MUNICIPAL_DEPARTMENT" disabled id ="s2">
		<%
		sql = "SELECT * FROM gov.municipal_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="CITY_HALL" id="city_hall" disabled ></tr>
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c6" >  الدفاع المدني </label> </td> <td> 
<select style="max-width:75px; min-width:75px" name = "CIVIL_DEPARTMENT" disabled id ="s3">
		<%
sql = "SELECT * FROM gov.civil_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="CIVIL" id="civil" disabled></tr>
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c7" >  الصحة </label> </td> <td> 
<select style="max-width:75px; min-width:75px" name = "HEALTH_DEPARTMENT" disabled id ="s4">
		<%
		sql = "SELECT * FROM gov.health_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="HEALTH" id="health" disabled></tr>
			<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c77" > البريد و الاتصالات </label> </td> <td> 
<select style="max-width:75px; min-width:75px" name = "MAIL_DEPARTMENT" disabled id ="s444">
		<%
		sql = "SELECT * FROM gov.MAIL_departments";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="MAIL" id="mail" disabled></tr>
</table><br><br><br>

<table>
<tr><td colspan="2" style="font-size:20pt; font-weight:bold"> سند الكفالة العدلية :</td> </tr>
<tr><td width="210pt"><label><input type="checkbox" name="c1" id="c8">  سند الكفالة </label></td> <td> <input type="file"  accept="image/*" name="BOND" id="bond" disabled></tr>
</table><br><br><br>

<table>
<tr><td colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الخارجين (الموافقات) :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c9" > وزارة الداخلية </label> </td> <td> <input type="file" accept="image/*" name="MINISTRY" id="ministry" disabled ></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c10" > البلدية </label> </td> <td> <input type="file" accept="image/*" name="CITY_HALL2" id="city_hall2" disabled ></td></tr>
</table><br><br><br><br><br>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%"><br>
<div style="margin-right:35%"><input class="form-appointment" type="submit" value="حـفـظ" >


<input class="form-appointment" type="reset" value="تفريغ" >
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS"">
<input class="form-appointment" type="button" value="انـهـاء" /></a>
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
enable("c2","map_site");
enable("c3","license");
enable("c8","bond");
enable("c9","ministry");
enable("c10","city_hall2");
enable2("c4","police","s1");
enable2("c5","city_hall","s2");
enable2("c6","civil","s3");
enable2("c7","health","s4");
enable2("c77","mail","s444");

</script>

</html>


</script>
</html>