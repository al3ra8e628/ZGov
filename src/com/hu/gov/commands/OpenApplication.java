package com.hu.gov.commands;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import com.hu.gov.commands.CommandBase;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.database.DatabaseConnection;

public class OpenApplication extends CommandBase {
	
	String dataSourceId ; 
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		dataSourceId = request.getParameter("dataSourceId"); //3101
		
		String processNumber;
		if(Integer.parseInt(dataSourceId) < 2018)
		processNumber= dataSourceId.substring(0, dataSourceId.length() - 1);
		else
		processNumber=dataSourceId.substring(1 ,dataSourceId.length());

		Connection conn = null;
		PrintWriter out = response.getWriter();
		out.print(HEAD_START_TAG);
		out.print(LINK_STYLE_TAG);
		out.print(LINK_JS_TAG);
		out.print(LINK_JQUERY_TAG);

		out.print(HEAD_END_TAG);
		out.print(BODY_START_TAG);

		try {
			request.getRequestDispatcher("/template_header.jsp").include(request, response);
		} catch (ServletException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			conn = DatabaseConnection.getConnection();

			out.println(FORM_START_TAG);
			out.print(HIDDEN_INPUT_START_TAG);
			out.print("name='HU$CMD' value='ADD_PROCESS'/");
			out.print(CLOSE_ANGULER_PRACET);

			out.print(HIDDEN_INPUT_START_TAG);
			out.print("name='file_name' value='" + getProcessFileName(processNumber, conn) + "'/");
			out.print(CLOSE_ANGULER_PRACET);

			out.println(NEW_DOCUMENT_BTN);
			out.println(FORM_END_TAG);

			String sql = getSource(dataSourceId, conn);
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

				try (ResultSet rs = pstmt.executeQuery()) {
					ResultSetMetaData rsmd = rs.getMetaData();
					int colCount = rsmd.getColumnCount();
					out.println(TABLE_START_TAG);
					int processIdCol = 0;
					for (int i = 1; i <= colCount; i++) {
						String colName = rsmd.getColumnName(i);
						if (!colName.equals("PROCESS_ID")) {
							out.println(TABLE_HEAD_START_TAG);
							out.println(colName);
							out.println(TABLE_HEAD_END_TAG);
						} else {
							processIdCol = i;
						}
					}
					
					
					out.println(TABLE_HEAD_START_TAG);
					out.println("عرض");
					out.println(TABLE_HEAD_END_TAG);

					out.println(TABLE_HEAD_START_TAG);
					out.println("حذف");
					out.println(TABLE_HEAD_END_TAG);

					while (rs.next()) {
						out.println(TABLE_ROW_START_TAG);
						for (int i = 1; i <= colCount; i++) {
							if (i != processIdCol) {
								out.print(TABLE_DATA_START_TAG);
								out.print(String.valueOf(rs.getString(i)));
								out.print(TABLE_DATA_END_TAG);
							}
						}
						
						out.print(TABLE_DATA_START_TAG);
						out.print(A_START_TAG);
						out.print("http://localhost:8085/ZGov/GovSystem?");
						out.print("HU$CMD=OPEN_DOCUMENT&HU$DOCUMENT_ID=");
						out.print(rs.getInt("PROCESS_ID"));
						out.print("\"");
						out.print(CLOSE_ANGULER_PRACET);
						out.print(OPEN_ICON_TAG);
						out.print(A_END_TAG);
						out.print(TABLE_DATA_END_TAG);
					
						
						out.print(TABLE_DATA_START_TAG);
						out.print("<img alt='open' onclick='deleteAction("+rs.getInt("PROCESS_ID")+" ," +dataSourceId+")' src='./photos/delete_doc_icon.png' class='open-icon'/>");
						out.print(TABLE_DATA_END_TAG);
					
						
						
						out.println(TABLE_ROW_END_TAG);
					
					}
					out.println(TABLE_END_TAG);
					out.println(BODY_END_TAG);
					try {
						request.getRequestDispatcher("/template_footer.jsp").include(request, response);
					} catch (ServletException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	private String getSource(String dataSourceId, Connection conn) throws SQLException {
		String sql = "SELECT SOURCE FROM VIEW_SETTINGS LEFT JOIN DATA_SOURCE ON (VIEW_SETTINGS.PROCESS_NUM = DATA_SOURCE.PROCESS_NUM) WHERE DATASOURCE_ID ="
				+ dataSourceId;
		String source = "";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		source = rs.getString(1);

		return source;
	}

	private String getProcessFileName(String processNum, Connection conn) {
		String sql = "SELECT FILE_NAME FROM PROCESS WHERE PROCESS_NUM =" + processNum;
		String file_name = "";

		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			file_name = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return file_name;
	}

}
