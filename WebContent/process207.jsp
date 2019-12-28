<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="./bootstrap_libraries/css/processes_style.css"/>
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>
<title>اجراء دراسة الواقع الاجتماعي والاقتصادي</title>
</head>


<body dir="rtl">
<div class="form">
<form method="post" action="GovSystem"   enctype="multipart/form-data" id="form">

<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" />
<input type="hidden" name="HU$PROCESS_NUM" value="207" />
		

<p style="text-align:center; margin-top:-1px; font-size:30pt; font-weight:bold;">اجراء دراسة الواقع الاجتماعي والاقتصادي</p>

<hr style="margin-left:6%; margin-right:6%;margin-top:-3%">


<div style="padding-let:3%;padding-right:3%"><br>
<label style="font-size:18pt;font-weight:bold;"> الرقم الوطني :</label>
<input type="text"  name="PERSON_ID" size="40"  style="height:25px;border-radius:5pt;" required minlength="10" maxlength="10" />
<br><br>
<table>
<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c1" > تقرير الواقع الاقتصادي </label> </td> <td> <input type="file" accept="image/*" name="ECONOMIC" id="economic"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c2" > مخاطبات الدوائر الرسمية</label> </td> <td> <input type="file" accept="image/*" name="COMMUNICATION" id="communication"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c3" >الاجتماعات مع ضباط ارتباط الدوائر   </label> </td> <td> <input type="file" accept="image/*" name="MEETINGS" id="meetings"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c4" > الاحصاءات العامة </label> </td> <td> <input type="file" accept="image/*" name="STATISTICS" id="statistics"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c5" > التقارير السنوية للوزارات والمؤسسات   </label> </td> <td> <input type="file" accept="image/*" name="ANNUAL" id="annual"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c6" > النماذج المعدة من قبل وحدة التنمية   </label> </td> <td> <input type="file" accept="image/*" name="PREPARED" id="prepared"  disabled ></tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c7" > الجامعات  </label> </td> <td> <input type="file" accept="image/*" name="UNIVERSITIES" id="universities"  disabled ></tr>

</table><br>
<br><br>

<table>
<tr><td colspan="2" style="font-size:20pt; font-weight:bold">الشركاء الخارجين :</td> </tr>
<tr><td width="210pt"> <label> <input type="checkbox" id="c8" > وزارة الداخلية </label> </td> <td> <input type="file" accept="image/*" name="MINISTRY" id="ministry" disabled ></td></tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="c9" > الدوائر المعنية </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "DEPARTMENT_DEPARTMENT" disabled id ="s9">
		<%
		Connection conn = DatabaseConnection.getConnection() ; 
		String sql = "SELECT * FROM gov.DEPARTMENT_DEPARTMENTS";
		PreparedStatement pstmt = conn.prepareStatement(sql);
	    ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%></select></td></tr></table> </td> <td> <input type="file" accept="image/*" name="DEPARTMENT" id="department" disabled></tr>



</table><br><br><br>



</table>
<br><br>





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

<label style="font-weight:bold;"> ملاحظة: الزمن المستغرق من تاريخ الاستدعاء : كل سنة </label>

</div>
</div>
</body>

<script>

function enable(x,y){
	document.getElementById(x).onchange = function() {
	    document.getElementById(y).disabled = !this.checked;};}
	    
function enable2(x,y,z){
document.getElementById(x).onchange = function() {
    document.getElementById(y).disabled = !this.checked;
	document.getElementById(z).disabled = !this.checked;};}


enable("c1","economic");
enable("c2","communication");
enable("c3","meetings");
enable("c4","statistics");
enable("c5","annual");
enable("c6","prepared");
enable("c7","universities");
enable("c8","ministry");


enable2("c9","department","s9");



</script>

</html>


</script>
</html>