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
<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>



<title>فعاليات هيئات المجتمع المدني  </title>
</head>
<body dir="rtl">
<div class="form">
<form method="post" action="GovSystem"    enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="129" />
		

<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">فعاليات هيئات المجتمع المدني </p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:18pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required minlength="10" maxlength="10" />
<br><br>
<table>

<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > استدعاء </label> </td> <td> <input type="file" accept="image/*" name="CALL_UP" id="call_up"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2" > كتاب سنوي</label> </td> <td> <input type="file" accept="image/*" name="YEARBOOK" id="yearbook"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c3" > كشف اللجنة</label> </td> <td> <input type="file" accept="image/*" name="COMMITTEE_REVELEAD" id="committee_revealed"  disabled ></tr>



</table><br>
<br><br>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold"> الشركاء  :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c4" >  الشرطة </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "POLICE_DEPARTMENT" disabled id ="s4">

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
		
<tr><td width="210pt"> <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c5" > المخابرات  </label> </td> <td> 
<select style="max-width:75px; min-width:75px" style="max-width:200px;" name = "INTELLIGENCE_DEPARTMENT" disabled id ="s5">
		<%
		sql = "SELECT * FROM gov.INTELLIGANCE_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
	     rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select> </td></tr></table> </td> <td>
		 <input type="file" accept="image/*" name="INTELLIGENCE" id="intelltgence" disabled="disabled" /></tr>

<td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c6" >  الأوقاف </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "ENDOWMENTS_DEPARTMENT" disabled id ="s6">

		<%
		 conn = DatabaseConnection.getConnection();
		 sql = "SELECT * FROM gov.ENDOWMENT_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
		 rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="ENDOWMENTS" id="endowment" disabled ></tr>
</table><br><br><br>

<br>

<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حـفـظ"  onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>
<br/><br/><br/>		
</div><br><br><br>		
</form>

<label style="font-weight:bold;">  الزمن المستغرق 30 يوم عمل</label>
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
enable("c2","yearbook");
enable("c3","committee_revealed");

enable2("c4","police","s4");
enable2("c42","unit","s12");
enable2("c5","intelltgence","s5");
enable2("c6","endowment","s6");

</script>

</html>


</script>
</html>