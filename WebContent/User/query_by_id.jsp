<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hu.gov.business.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	User user =(User)request.getSession().getAttribute("user") ; 
%>

<html>
<head>




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>الاستعلام حسب الرقم الوطني</title>


<link rel="stylesheet"	href="/ZGov/bootstrap_libraries/css/admin_pages_style.css" />
<script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"></script>

<SCRIPT type="text/javascript">
$(document).ready(function(){
    $("#form").fadeIn(500);
    window.scroll(0, 0) ; 
});

	function checkPersonId() {
		var pId = document.getElementById("personId").value ; 
		
		if(pId.length == 0){
			alert("ادخل الرقم الوطني") ;
			return ; 
		}

		var regex = new RegExp("[^0-9]");
		if(regex.test(pId)){ 
			alert("لا يجب ان يحتوي الرقم الوطني على احرف او رموز") ;
			return ; 
		}

		if(pId.length != 10){
			alert("يجب ان يتكون الرقم الوطني من عشرة ارقام") ;
			return ; 
		}

		document.getElementById("myForm").submit();
	}
	
	function deleteAction(documentId , personId) {

		if (confirm('هذا الخيار سيقوم بحذف كافة المعلومات المتعلقة بهذه المعاملة , هل انت متأكد ؟')) {
			$.post("/ZGov/GovSystem?HU$CMD=DELETE_DOCUMENT&doc_id="+documentId,function(request){
				window.location.replace("<%=request.getContextPath()%>/User/query_by_id.jsp?personId="+personId);
			});
		
		} else {
			alert("لم يتم حذف العملية") ; 
		} 
	}

	</SCRIPT>

<style type="text/css">

table th:last-child {
/*
	border-right: none;
*/	
}

table td:last-child{
/*
	border-right: none;
*/
	padding: 0 ; 
}
table {
	text-align: center;
	flaot: none;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 30px;
	border-spacing: 0px;
	border: 2px #3174AE solid ; 
	border-radius: 4px;
}

caption {
	margin-bottom: -10px;
}

th, td {
	text-align: center;
	padding: 7px;
/*
	border-right: 1px solid #286091;
*/    
}





input[type="submit"], input[type="button"] {
	width: 75px;
	height: 28px;
	font-weight: bold;
	background-image: linear-gradient(to bottom, #337ab7 0%, #265a88 100%);
	background-repeat: repeat-x;
    border-color: #245580;
    border: 1px solid #ccc;
    border-radius: 7px;
    color:#fff ;
    margin-right : 10px ;  
	
}

input[type="submit"]:hover , input[type="button"]:hover {
	background-image: linear-gradient(to bottom, #265A88 0%, #265A88 100%);
}


div table {
	border: 3px solid #3174AE;
	border-radius: 4pt;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:nth-child(odd) {
	background-color: #fff;
}
tr:hover {
	background-image: linear-gradient(to bottom, #2e506d 0%, #265a88 100%);
	color: white;
}



.open-icon{
	height: 28px ; 
	width: 28px ;  
	padding: 5px;
    box-sizing: border-box;
}

.open-icon:hover{
padding: 0 ; 
}

th {
	background-image: linear-gradient(to bottom, #337ab7 0%, #265a88 100%);
	color: white;
	padding: 8px;
}

.error{
margin-top : 10% ;
margin-bottom : 10% ;  
vertical-align:middle ; 
margin-right:4px; 
font-size:18pt; 
color: #F47B7B; 
}


</style>



</head>
<body dir="rtl">
	<%@include file="/template_header.jsp"%>

	<div class="center" id="title">
	
			<div style="margin-left: 32% ; margin-bottom : 1% ;  margin-right: 32% ; ">
			<h4 class="text-info form-caption"> البحث حسب الرقم الوطني </h4>
			<hr class="line" style="" />
			</div>
	
			<FORM action="<%=request.getContextPath()%>/User/query_by_id.jsp" method="POST" id="myForm">
			<label>الرقم الوطني</label>
			<input type="text" name="personId" id="personId" maxlength="10" value="<%=(request.getParameter("personId") != null)? request.getParameter("personId") : ""%>"/>
			<input type="button" id="searchBtn" onclick="checkPersonId()"  value="بحث"/>
			</FORM>
		
		<%
			if(request.getParameter("personId") != null ){
				String personId = request.getParameter("personId") ;  
		%>

		<div>
		<table DIR='LTR'>
			<tr><th>حذف العملية</th><th>عرض</th><th>اسم العملية</th><th>رقم العملية</th><th>القسم</th><th>الاسم</th><th>تاريخ العملية</th><th>الرقم</th></tr>
							
		<%
		String query = " SELECT"
	    			  +" first_name||' '||mid_name||' '||last_name AS \"person_name\","
					  +" process.process_num,"
					  +" process.process_name,"
					  +" department.department_name,"
					  +" TO_CHAR(process_doc.process_date, 'YYYY-MM-DD') AS \"doc_date\","
					  +" process_doc.process_id"
					  +" FROM"
					  +" process_doc"
					  +" LEFT JOIN department ON department.department_id = process_doc.department_id"
					  +" LEFT JOIN process ON process_doc.process_num = process.process_num"
					  +" LEFT JOIN person_profile ON process_doc.person_id = person_profile.person_id"
					  +" WHERE process_doc.person_id ="+personId ; 
		
		ResultSet rs = DatabaseConnection.getConnection().prepareStatement(query).executeQuery() ;
		int rowNumber = 0 ;
		
		while(rs.next()){
			rowNumber++; 
		%>
			<tr>
				<td>
				<a href="#">
				<img alt="open" src="../photos/delete_doc_icon.png" class="open-icon" onclick="deleteAction(<%=rs.getInt("process_id")%>,<%=personId%>)"/>
				</a>
			</td>			
				
				<td>
				<a href="http://localhost:8085/ZGov/GovSystem?HU$CMD=OPEN_DOCUMENT&HU$DOCUMENT_ID=<%=rs.getInt("process_id")%>">
				<img alt="open" src="../photos/open.png" class="open-icon"/>
				</a>
				</td>
				<td><%=rs.getString("process_name")%></td>
				<td><%=rs.getString("process_num")%></td>
				<td><%=rs.getString("department_name")%></td>
				<td><%=rs.getString("person_name")%></td>			
				<td><%=rs.getString("doc_date")%></td>			
				<td><%=rowNumber%></td>			
			</tr>	
		<%	
		}
		%>				
			
		</table>
		</div>
		
		<%
			}else{
		%>	
			 
		<div>
			
			<h3 class="error">يجب تحديد الرقم الوطني</h3>
		
		</div>
		
		<%
			}
		%>
	
	</div>
	
	<%@include file="/template_footer.jsp"%>
</body>
</html>                
  