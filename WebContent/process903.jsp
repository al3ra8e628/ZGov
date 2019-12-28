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

<title>منح مغادرة للموظفين في مركز المحافظة أو الوحدات الإدارية التابعة لمركز المحافظة</title>
</head>


<body dir="rtl">




	<div class="form" style="background-color: #FFCDB2;">
		<form method="post" action="GovSystem" enctype="multipart/form-data" id="form">

			<input type="hidden" name="HU$CMD" value="SAVE_DOCUMENT" /> <input
				type="hidden" name="HU$PROCESS_NUM" value="903" />

			<p style="text-align: center; margin-top: -1px; font-size: 30pt; font-weight: bold;">منح مغادرة للموظفين في مركز المحافظة أو الوحدات الإدارية التابعة لمركز المحافظة<p>

			<hr style="margin-left: 6%; margin-right: 6%; margin-top: -3%">


			<div style="padding-let: 3%; padding-right: 3%">
				<br> <label style="font-size: 18pt; font-weight: bold;">
					الرقم الوطني :</label> <input type="text" name="PERSON_ID" size="40"
					style="height: 25px; border-radius: 5pt;" required minlength="10" maxlength="10" /> <br>
				<br>
				<table>
					<tr>
						<td style="font-size: 20pt; font-weight: bold">تقديم طلب :</td>
					</tr>
					<tr>
										<td width="210pt"><label> <input type="checkbox"
												id="c1">نموذج مغادرة </label></td>
										<td><input type="file" accept="image/*" name="VACATION"
											id="vac" disabled>
									</tr>
				</table>
				<br> <br>
				<br>
<table>
					<tr>
						<td colspan="2" style="font-size: 20pt; font-weight: bold">الموافقة : <SPAN style="font-size:15pt"> <label><input checked type="radio"  value="موافق"
								id="r1"  name="APROVAL"   > موافق </label> <label><input type="radio" value="غير  موافق "  
								id="r2" name="APROVAL"> غير موافق </label> </SPAN></td>
					</tr>
					 
				</table>
				<table>
					 
		 
				<br>
				<br>
				<br>
				<br>
				<br>

				<hr style="margin-left: 6%; margin-right: 6%; margin-top: -3%">
				<br>
				<div style="margin-right: 28%">
					<input class="form-appointment" type="button" value="حـفـظ" onclick="addProcess()"/> <input
						class="form-appointment" type="reset" value="تفريغ" /> <a
						href="/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PROCESS"> <input
						class="form-appointment" type="button" value="انـهـاء" />
					</a> <br/>
					<br />
					<br />
				</div>
				<br>
				<br>
				<br>
		</form>

		
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
	enable("c1", "vac");
	enable("c2", "vac2");
	

</script>

</html>


</script>
</html>