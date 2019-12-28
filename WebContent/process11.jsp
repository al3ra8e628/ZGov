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


<title>ترخيص مراكز الالعاب الكهربائية والالكترونية</title>
</head>

<body dir="rtl">
<div class="form">

<form method="post" action="GovSystem"  enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="111" />


<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">ترخيص مراكز الالعاب الكهربائية والالكترونية</p>

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



		<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c11" >  المجلس الاعلى للشباب </label>  </td> <td>
<select style="max-width:75px; min-width:75px" name = "COUNCIL_DEPARTMENT" disabled id ="s5">

		<%

		sql = "SELECT * FROM gov.COUNCIL_DEPARTMENTS";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="COUNCIL" id="council" disabled ></tr>






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
<div style="margin-right:28%">
<input class="form-appointment" type="reset" value="تفريغ" >
<input class="form-appointment" type="button" value="حـفـظ" onclick="addProcess()">
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
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
enable("c1","call_up");
enable("c2","map_site");
enable("c3","license");
enable("c8","bond");
enable("c9","ministry");
enable("c10","city_hall2");
enable2("c4","police","s1");
enable2("c42","unit","s12");

enable2("c5","city_hall","s2");
enable2("c6","civil","s3");
enable2("c7","health","s4");
enable2("c11","council","s5");

</script>

</html>


</script>
</html>