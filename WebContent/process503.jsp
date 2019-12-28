<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet" type="text/css"
	href="./bootstrap_libraries/css/processes_style.css">
	<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
<script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>
<title>بيان عملية رفع رقابة الشرطة</title>
</head>
<body>   
<body dir="rtl">

<div class="form" style="background-color: #E2E2E2;">
		<form method="post" action="GovSystem" enctype="multipart/form-data" id="form">

			<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" /> <input
				type="hidden" name="HU$PROCESS_NUM" value="503" />

			<p
				style="text-align: center; margin-top: -1px; font-size: 30pt; font-weight: bold;">رفع رقابة الشرطة
				</p>

			<hr style="margin-left: 6%; margin-right: 6%; margin-top: -3%">
			<div style="padding-let: 3%; padding-right: 3%">
				<br>
				<label style="font-size: 18pt; font-weight: bold;"> الرقم
					الوطني :</label> <input type="text" name="PERSON_ID" size="40"
					style="height: 25px; border-radius: 5pt;" required minlength="10" maxlength="10" /> <br>
				<br>
				
				<br>
				<br>
				<br>
				<table>
				<tr><td style="font-size:20pt; font-weight:bold">تقديم طلب :</td> </tr>
				<tr><td width="210pt"> <label> <input type="checkbox" id="pc1" >استدعاء  </label> </td> 
				<td> <input type="file" accept="image/*" name="CALL_UP" id="call_up"  disabled ></tr>
				<tr><td width="210pt"> <label> <input type="checkbox" id="pc2"> وثيقة اثبات شخصية  </label> </td> 
				<td> <input type="file" accept="image/*" name="DOCUMENT" id="document" disabled ></tr>
				
				</table>
<br><br>
				<table>
<tr><td  colspan="2" style="font-size:20pt; font-weight:bold"> شركاء داخلين  :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="pc3" > جهة الاختصاص </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "POLICE_DEPARTMENT" disabled id ="ps1">

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
		
		<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="pc4" >الوحدات الادارية </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "ADMINISTRATIVE_UNITS" disabled id ="ps2">

		<%
		 conn = DatabaseConnection.getConnection();
		 sql = "SELECT * FROM gov.ADMINISTRATIVE_UNITS";
		 pstmt = conn.prepareStatement(sql);
		 rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="ADMINISTRATIVE" id="administrative" disabled ></tr>

		</table><br><br>
		
		<table>
<tr><td colspan="2" style="font-size:20pt; font-weight:bold">شركاء خارجين :</td> </tr>
<tr><td > <table> <tr> <td width="100pt"> <label><input type="checkbox" id="pc5" > جهة الاختصاص </label>  </td> <td> 
<select style="max-width:75px; min-width:75px" name = "POLICE_DEPARTMENT2" disabled id ="ps3">

		<%
		 conn = DatabaseConnection.getConnection();
		 sql = "SELECT * FROM gov.POLICE_DEPARTMENTS";
		 pstmt = conn.prepareStatement(sql);
		 rs = pstmt.executeQuery();
		while(rs.next()){
			
			out.println("<option value = "+rs.getInt(1)+">"+rs.getString(2)+"</option>" );
		}
	
		%>
		</select> </td></tr></table> </td> <td> <input type="file" accept="image/*" name="POLICE2" id="police2" disabled ></tr>
		
</table>

<table>

<tr><td width="210pt"> <label> </table><input type="checkbox" id="pc6" >قرار رفع الرقابة </label> 
				<td> <input type="file" accept="image/*" name="DECISION" id="decision"  disabled ></td></tr>

</table>

<br><br><br><br><br>





</table>
				
				
				
				
				
				<br>
				<br>
				<br>
			
				<br>
				<br>
				<br>
				
				<hr style="margin-left: 6%; margin-right: 6%; margin-top: -3%">
				<br>
				<div style="margin-right: 28%">
					<input class="form-appointment" type="button" value="حـفـظ"  onclick="addProcess()" /> <input
						class="form-appointment" type="reset" value="تفريغ" /> <a
						href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS"> <input
						class="form-appointment" type="button" value="انـهـاء" />
					</a> <br />
					<br />
					<br />
				</div>
				<br>
				<br>
				<br>
		</form>

		<label style="font-weight: bold;"> الزمن المستغرق : يوم عمل رسمي </label>
	</div>
	</div>

</body>

<script type="text/javascript">
	function myFunction() {
		alert("تـم الحـفـظ بـنـجـاح");
	}

	function enable(x, y) {
		document.getElementById(x).onchange = function() {
			document.getElementById(y).disabled = !this.checked;
		};
	}

	function enable2(x, y, z) {
		document.getElementById(x).onchange = function() {
			document.getElementById(y).disabled = !this.checked;
			document.getElementById(z).disabled = !this.checked;
		};
	}
	
	enable2("pc1", "call_up");
	enable2("pc2", "document");
	enable2("pc3", "police", "ps1");
	enable2("pc4", "administrative", "ps2");
	enable2("pc5", "police2", "ps3");
	enable2("pc6", "decision");

</script>

</html>


</script>
</html>






</body>
</html>