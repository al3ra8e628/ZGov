<?xml version="1.0" encoding="utf-8" ?>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>


<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>

<title>تعيين مختار او عضو هيئةاختيارية بدل مستقيل</title>
</head>


<body dir="rtl">
<div class="form">
<form method="post" action="GovSystem"   enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="127" />
		


<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">تعيين مختار او عضو هيئةاختيارية بدل مستقيل</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:20pt;font-weight:bold;"> الرقم الوطني :</label>
	 <input type="text" name="PERSON_ID" size="40"
						style="height: 25px; border-radius: 5pt;" required minlength="10" maxlength="10" />
<br><br>
<table>
<tr><td colspan="2" style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c9" >استدعاء</label> </td> <td> <input type="file" accept="image/*" name="NCALL" id="ncall" disabled ></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c10" >نموذج خاص بالتواقيع</label> </td> <td> <input type="file" accept="image/*" name="SIGN" id="sign" disabled ></td></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c11" >استدعاء استقالة المختار </label> </td> <td> <input type="file" accept="image/*" name="RCALL" id="rcall" disabled ></td></tr>
</table><br><br>





<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold"> الشركاء:</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c4" >المخابرات</label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "INTELLIGANCE_DEPARTMENTS" disabled id ="s1">

		<%
		Connection conn = DatabaseConnection.getConnection();
		String sql = "SELECT * FROM gov.PERSON_PROFILE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		sql = "SELECT * FROM gov.INTELLIGANCE_DEPARTMENTS";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="INTELIGANCE" id="inteligance" disabled ></tr>
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" > الشرطة </label> </td> <td> 
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "POLICE_DEPARTMENTS" disabled id ="s2">
		<%
		sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
		%></select> </td></tr></table> </td><td> <input type="file" accept="image/*" name="POLICE" id="police" disabled ></tr>
		
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
		<br><br><br></table></table></table></table></table>

<BR><BR><BR><BR><BR>

<div style="margin-right:28%"><input class="form-appointment" type="button" value="حـفـظ"   onclick="addProcess()">
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


enable2("c4","inteligance","s1");
enable2("c5","police","s2");
enable2("c42","unit","s12");
enable("c9","ncall");
enable("c10","sign");
enable("c11","rcall");

</script>

</html>


</script>
</html>