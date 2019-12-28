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

<title>ترخيص مراكز الإنترنت</title>
</head>


<body dir="rtl">
<div class="form">


<form method="post" action="GovSystem"  enctype="multipart/form-data" id="form" >

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="124" />
		


<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">ترخيص مدرسة خاصة ومركز ثقافي وروضة اطفال</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">



<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:20pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required minlength="10" maxlength="10"/>
<br><br>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > استدعاء </label> </td> <td> <input type="file" accept="image/*" name="CALL_UP" id="call_up"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2"> مخطط موقع تنظيمي </label> </td> <td> <input type="file" accept="image/*" name="MAP_SITE" id="map_site" disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c3" > رخصة انشاءات </label> </td> <td><input type="file" accept="image/*" name="LICENSE" id="license" disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c333" > كتاب رسمي </label> </td> <td><input type="file" accept="image/*" name="OFFICIAL_BOOK" id="official_book" disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c99" > طلب باسم المحافظ </label> </td> <td><input type="file" accept="image/*" name="GOVERNER" id="governer" disabled ></tr>
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
		
		<tr>
					<td>
						<table>
							<tr>
								<td width="100pt"><label><input type="checkbox"
										id="c42"> الوحدات الادارية </label></td>
								<td><select style="max-width: 75px; min-width: 75px"
									name="ADMINISTRATIVE_UNIT" disabled id="s12">

										<%
																			 conn = DatabaseConnection.getConnection();
																			 sql = "SELECT * FROM gov.ADMINISTRATIVE_UNITS";
																			 pstmt = conn.prepareStatement(sql);
																			rs = pstmt.executeQuery();
																			while (rs.next()) {

																				out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
																			}
																		%>
								</select></td>
							</tr>
						</table>
					</td>
					<td><input type="file" accept="image/*" name="UNIT"
						id="unit" disabled>
				</tr>
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" >  المخابرات </label> </td> <td> 
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "INTEILIGANCE_DEPARTMENT" disabled id ="s2">
		<%
		sql = "SELECT * FROM gov.INTELLIGANCE_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="INTEILIGANCE" id="inteiligance" disabled ></tr>
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
			<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c777" > مديرية التربية والتعليم</label> </td> <td> 
<select style="max-width:75px; min-width:75px" name = "EDUCATION_DEPARTMENT" disabled id ="s8888">
		<%
		sql = "SELECT * FROM gov.EDUCATION_department";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="EDUCATION" id="education" disabled></tr>
</table><br><br><br>




<hr style="margin-left:6%; margin-right:6%;margin-top:-3%"><br>
<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حـفـظ"  onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>

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
enable("c1","call_up");
enable("c2","map_site");

enable2("c99","governer");
enable2("c3","license");
enable2("c4","police","s1");
enable2("c42","unit","s12");

enable2("c5","inteiligance","s2");
enable2("c333","official_book");
enable2("c6","civil","s3");

enable2("c7","health","s4");
enable2("c777","education","s8888");

</script>

</html>


</script>
</html>