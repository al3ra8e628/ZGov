<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.database.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>

<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>

<title>بيان تنظيم عملية قضية زراعية</title>
</head>


<body dir="rtl">
<div class="form">
<form method="post" action="GovSystem" enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT"/>
<input type="hidden" name="HU$PROCESS_NUM" value="120"/>

<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">بيان تنظيم عملية قضية زراعية</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:20pt;font-weight:bold;"> الرقم الوطني :</label>

	 <input type="text" name="PERSON_ID" size="40"
						style="height: 25px; border-radius: 5pt;" required  minlength="10" maxlength="10"/><br><br>


<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > استدعاء </label> </td> <td> <input type="file" accept="image/*" name="CALL_UP" id="call_up"  disabled ></tr>

</table><br>
<br><br>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الداخليين (اللجان) :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c2" >  مديرية الزراعة </label>  </td> <td> 


<select style="max-width:75px; min-width:75px" name="DIRECTORATE_OF_AGRICULTURE" disabled="disabled" id="s1">
		<%
		Connection conn = DatabaseConnection.getConnection();

		String sql = "SELECT * FROM gov.AGRICULTURE_DEPARTMENTS";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select>
		
		
		
		 </td></tr></table> </td> <td> <input type="file" accept="image/*" name="AGRICULTURE" id="directorate_of_agriculture" disabled ></tr>
</table>


<br>
<br>

<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الداخليين (اللجان) :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c3" >  الشرطة  </label>  </td> <td> 
<select style="max-width:75px; min-width:75px;" disabled name="POLICE_DEPARTMENT"  id="s2">
		<%
		conn = DatabaseConnection.getConnection();

		 sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
		 rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
		%>
		</select>
		 </td>
		 </tr></table> </td> <td> <input type="file" accept="image/*" name="POLICE" id="police" disabled ></tr>
</table><br/><br/><br/>
<br/>
<br/>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%"><br>

<div style="margin-right:28%">
<input class="form-appointment" type="button" value="حـفـظ" onclick="addProcess()"/>
<input class="form-appointment" type="reset" value="تفريغ"/>		
<a href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS">
<input class="form-appointment" type="button" value="انـهـاء"/>
</a>
<br/><br/><br/>		
</div>
<br><br><br>		
</form>

<label style="font-weight:bold;"> ملاحظة: الزمن المستغرق من تاريخ الاستدعاء : 30 يوم </label>
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
	
enable("c1" ,"call_up");
enable2("c2","s1" , "directorate_of_agriculture");
enable2("c3","police","s2");




</script>

</html>


</script>
</html>