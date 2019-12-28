package com.hu.gov.commands;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.database.DatabaseConnection;

public class OpenDocument extends CommandBase {
		// 8 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;  charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter sout = response.getWriter();
		
		sout.println("<html><head>");
		sout.println("<script src=\"https://unpkg.com/jspdf@latest/dist/jspdf.min.js\"></script></head>");
		sout.println("<body dir='rtl' style='padding:0px ; margin:0px ; '>");
		sout.print("<div style='text-align : center ; '>");
		
		sout.print("<table border='1' style='font-size:18pt ;  margin-left: auto; margin-right: auto; float: none; ' >");
		
		try {
			request.getRequestDispatcher("/template_header.jsp").include(request, response);
		} catch (ServletException e1) {
			e1.printStackTrace();
		}
		
		try {
			int processId = Integer.parseInt(request.getParameter("HU$DOCUMENT_ID"));
			try (Connection conn = DatabaseConnection.getConnection()) {
				String query = getQueryByProcessID(processId);
				
				
				
				try (PreparedStatement pstmt = conn.prepareStatement(query)) {
					pstmt.setInt(1, processId);
					
					try (ResultSet rs = pstmt.executeQuery()) {
						ResultSetMetaData rsmd = rs.getMetaData();
						int columnCount = rsmd.getColumnCount() + 1;
						while (rs.next()) {
							for (int i = 1; i < columnCount; i++) {
								
								if(i > 8 ){
									sout.print("</table>");
									sout.println("<h3>"+rsmd.getColumnName(i) + ": "+"</h3>");
								}else{
									sout.println("<tr>");
									sout.println("<td style='width:400px ; padding-right:15px ; '>"+rsmd.getColumnName(i) + ": "+"</td>");
								}
								
								
								String columnType = rsmd.getColumnTypeName(i).toString();
								if (columnType.equals("BLOB")) {
									Blob image = null;
									image = rs.getBlob(i);
									if (image == null) {
										sout.print("غير محدد");
										continue;
									}
									byte[] imgData;
									imgData = image.getBytes(1, (int) image.length());
									byte[] encoded = Base64.getEncoder().encode(imgData);
									sout.print("<img style=' height:750; width:590 ; ' src='data:image/png;base64,");
									sout.print(new String(encoded));
									sout.print("'/>");
									sout.println("<br>");
									continue;

								} else {
									if(i <= 8)
									sout.println("<td style='width:400px ; padding-right:15px ; '>");
										sout.println((rs.getString(i) == null)?"غير محدد":rs.getString(i));
									if(i <= 8)
									sout.println("</td>");	
								}
							}
						}
					}
				}
			}
	
			try {
				request.getRequestDispatcher("/template_footer.jsp").include(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			}
			sout.println("</div></body></html>");
			sout.flush();
		} catch (NumberFormatException | SQLException e) {
			throw new IOException(e);
		}
	}

	private String getQueryByProcessID(int processID) throws SQLException {
		String sql = "SELECT PROCESS_NUM " +
				"FROM PROCESS_DOC " +
				"WHERE PROCESS_ID = ? ";
		String query = "";
		int processNum = 0;
		try (Connection conn = DatabaseConnection.getConnection()) {
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, processID);
				try (ResultSet rs = pstmt.executeQuery()) {
					rs.next();
					processNum = rs.getInt(1);
				}
			}

			sql = "SELECT SOURCE " +
					"FROM DATA_SOURCE " +
					"WHERE DATASOURCE_ID = ?";
			
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, processNum+3000);
				try (ResultSet rs = pstmt.executeQuery()) {
					rs.next();
					query = rs.getString(1);
				}
			}
		}
		return query;
	}
}
