<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try (Connection conn = DatabaseConnection.getConnection()) {
			String sql = "SELECT ? FROM ? WHERE PROCESS_ID = ?";
			try (PreparedStatement pstmt = conn.prepareStatement("")) {
				try (ResultSet rs = pstmt.executeQuery()) {
					try (OutputStream sout = response.getOutputStream()) {
						Blob image = null;
						byte[] imgData = null;
						image = rs.getBlob(1);
						imgData = image.getBytes(1, (int) image.length());
						response.setContentType("image/png");
						sout.write(imgData);
						sout.flush();
					}
				}
			}
		}
	%>
</body>
</html>