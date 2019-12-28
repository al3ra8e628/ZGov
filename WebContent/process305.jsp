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


<title>المخاطبات الواردة الينا من مديرية الدفاع المدني بخصوص ضرورة توفير متطلبات الدفاع المدني في منشأت الصناعية او المحلات التجارية او المباني </title>
</head>


<body dir="rtl">
<div class="form" style="background: #EF9A9A">
<form method="post" action="GovSystem"    enctype="multipart/form-data">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="305" />
		

<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;"><h3>المخاطبات الواردة الينا من مديرية الدفاع المدني بخصوص ضرورة توفير متطلبات الدفاع المدني في منشأت الصناعية او المحلات التجارية او المباني</h3> </p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:18pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required minlength="10" maxlength="10" />
<br><br>


<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > كتاب رسمي </label> </td> <td> 
<input type="file" accept="image/*" name="CALL_UP" id="call_up"  disabled ></tr>

</table>


<br>
<br><br>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الداخليين (اللجان) :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c2" >  الشرطة </label>  </td> <td>
<select style="max-width:75px; min-width:75px" name = "POLICE_DEPARTMENT" disabled id ="s1">

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
		
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c3" >  الدفاع المدني </label> </td> <td>

<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "CIVIL_DEPARTMENT" disabled id ="s2">
		<%
		sql = "SELECT * FROM gov.CIVIL_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){

			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}

		%></select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="CIVIL" id="civil" disabled ></tr></table>

<br><br><br>

<div style="margin-right:28%">
<input class="form-appointment" type="submit" value="حـفـظ"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>	
</div><br><br><br>		
</form>

<label style="font-weight:bold;"> ملاحظة: الزمن المستغرق من تاريخ الاستدعاء : 7 ايام عمل رسمي  </label>
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
enable("c1","call_up");


enable2("c2","s1","police");
enable2("c42","s12","unit");


enable2("c3","s2","civil");



</script>

</html>

