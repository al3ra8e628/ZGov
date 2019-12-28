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



<title>نقل ملكية مركز توزيع الغاز</title>
</head>


<body dir="rtl">
<div class="form" style="background: #EF9A9A">

<form method="post" action="GovSystem"  enctype="multipart/form-data">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="313" />


<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">نقل ملكية مركز توزيع الغاز </p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:20pt;font-weight:bold;"> الرقم الوطني :</label>
	 <input type="text" name="PERSON_ID" size="40"
						style="height: 25px; border-radius: 5pt;" required minlength="10" maxlength="10"/>
		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.PERSON_PROFILE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		%><br><br>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > كتاب رسمي ( شركة مصفاة البرتول)</label> </td> <td> <input type="file" accept="image/*" name="CALL_UP" id="call_up"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c3" > مخطط تنظيمي حديث  </label> </td> <td><input type="file" accept="image/*" name="LICENSE" id="license" disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c4" > رخصة انشاءات </label> </td> <td> <input type="file" accept="image/*" name="CONSTRUCTION" id="construction"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c5" > مخطط اراضي حديث </label> </td> <td> <input type="file" accept="image/*" name="MODERN_LAND" id="modern_land"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c6" > استدعاء من صاحب العلاقة </label> </td> <td> <input type="file" accept="image/*" name="OWNER_RELATIONSHIP" id="owner_relationship"  disabled ></tr>

</table><br>
<br><br>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الداخليين (اللجان) :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c7" >  الشرطة </label>  </td> <td>
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
		
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c8" >  المخابرات </label> </td> <td>
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "MUNICIPAL_DEPARTMENT" disabled id ="s2">
		<%
		sql = "SELECT * FROM gov.INTELLIGANCE_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%></select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="CITY_HALL" id="city_hall" disabled ></tr>




		


</table><br><br><br><br><br>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%"><br>
<div style="margin-right:28%">
<input class="form-appointment" type="submit" value="حـفـظ" >

<input class="form-appointment" type="reset" value="تفريغ" >

<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء" /></a>
</div><br><br><br>

		<label style="font-weight: bold;"> 
ملاحظة: الزمن المستغرق من
	تاريخ الاستدعاء :يوم عمل رسمي
</label>
			
</form>

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
enable("c3","license");
enable("c4","construction");
enable("c5","modern_land");
enable("c6","owner_relationship");
enable2("c7","police","s1");
enable2("c42","unit","s12");
enable2("c8","city_hall","s2");

</script>

</html>


