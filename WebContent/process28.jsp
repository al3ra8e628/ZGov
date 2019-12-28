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


<title> الموافقة على تعيين لجنة اعمار مسجد </title>
</head>

<body dir="rtl">
<div class="form">
<form method="post" action="GovSystem"   enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="128" />
		

<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;"> الموافقة على تعيين لجنة اعمار مسجد
</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:18pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required  minlength="10" maxlength="10"/>
<br><br>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > استدعاء </label> </td> <td> <input type="file" accept="image/*" name="CALL_UP" id="call_up"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2">الموافقة على تعيين لجنة اعمار مسجد</label>
  </td> <td> <input type="file" accept="image/*" name="MOSQUE_SITE" id="Mosque_site" disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c3" > كشف تفصيلي </label> </td> <td><input type="file" accept="image/*" name="DETAILE" id="Detaile" disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c4" > نظام المساجد ودور القران</label> </td> <td><input type="file" accept="image/*" name="SYSTEM" id="system" disabled ></tr>

</table><br>
<br><br>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الداخليين (اللجان) :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" >  الشرطة </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "POLICE_DEPARTMENT" disabled id ="s5">

		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
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
		
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c6" > المخابرات </label> </td> <td> 
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "INTELLIGENCE_DEPARTMENT" disabled id ="s6">
		<%
		sql = "SELECT * FROM gov.INTELLIGANCE_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
		
		
		
	
		%></select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="INTELLIGENCE" id="intelligence" disabled ></tr>
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c7" >  الاوقاف </label> </td> <td> 
<select style="max-width:75px; min-width:75px" name = "ENDOWMENTS_DEPARTMENT" disabled id ="s7">
		<%
		sql = "SELECT * FROM gov.ENDOWMENT_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="ENDOWMENTS" id="endowment" disabled></tr>
</table><br><br><br>

<table>
<tr><td colspan="2" style="font-size:20pt; font-weight:bold"> عضولجنة:</td> </tr>
<tr><td width="210pt"><label><input type="checkbox"  id="c8">  عضو لجنة </label></td> <td> <input type="file"  accept="image/*" name="BOND" id="bond" disabled></tr>
</table><br><br><br>

<table>
<tr><td colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الخارجين (الموافقات) :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c9" > وزارة الداخلية </label> </td> <td> <input type="file" accept="image/*" name="MINISTRY" id="ministry" disabled ></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c10" > البلدية </label> </td> <td> <input type="file" accept="image/*" name="CITY_HALL" id="city_hall" disabled ></td></tr>
</table><br><br><br>


<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حـفـظ"  onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>
<br/><br/><br/>		
</div><br>		
</form>

<label style="font-weight:bold;"> ملاحظة الزمن المستغرق 30 يوم من تاريخ الاستدعاء </label>
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



enable("c1","call_up");
enable("c2","Mosque_site");
enable("c3","Detaile");
enable("c4","system");


enable2("c5","police","s5");
enable2("c42","unit","s12");
enable2("c6","intelligence","s6");
enable2("c7","endowment","s7");


enable("c8","bond");

enable("c9","ministry");
enable("c10","city_hall");


</script>

</html>


</script>
</html>