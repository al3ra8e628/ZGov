package com.hu.gov.commands;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.database.DatabaseConnection;

import com.hu.gov.business.User;

public class SaveDocument extends CommandBase {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String insertIntoParent = "INSERT INTO PROCESS_DOC(PROCESS_ID,PROCESS_DATE, PERSON_ID, USER_ID, PROCESS_NUM , DEPARTMENT_ID) VALUES (?,SYSDATE,?,?,?,?)";
			int processId = getProcessId(conn);
			int processNum = insertIntoParant(request, conn, insertIntoParent, processId);
		
			String tableName = getTableName(processNum, conn);
			insertIntoChiled(request, response, conn, processId, tableName);

		} catch (SQLException e1) {
			e1.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect("/ZGov/User/home_user.jsp?res=1");
	}

	private void insertIntoChiled(HttpServletRequest request, HttpServletResponse response, Connection conn,
			int processId, String tableName) throws SQLException, IOException, ServletException, FileNotFoundException {
		StringBuilder sql = new StringBuilder("INSERT INTO ").append(tableName).append("(");
		StringBuilder values = new StringBuilder(" VALUES(");
		Map<String, String> columns = getColumns(tableName, conn);
		Map<String, FileInputStream> blobs = new LinkedHashMap<String, FileInputStream>();
		sql.append("PROCESS_ID").append(", ");
		values.append(processId).append(", ");
		for (Map.Entry<String, String> entry : columns.entrySet()) {
			String key = entry.getKey();
			if (key.equalsIgnoreCase("PROCESS_ID")) {
				continue;
			}
			String parametr = request.getParameter(key);
			if (entry.getValue().contains("VARCHAR2")) {
				sql.append(key).append(", ");
				values.append("'").append(parametr).append("'").append(", ");
			} else if (entry.getValue().contains("NUMBER")) {
				sql.append(key).append(", ");
				values.append(parametr).append(", ");
			} else if (entry.getValue().contains("BLOB")) {
				if (request.getPart(key) != null) {
					parametr = request.getPart(key).toString();
				} else {
					parametr = null;
				}
				FileInputStream is = null;
				if (parametr != null) {
					sql.append(key).append(", ");
					values.append("?").append(", ");
					
					File file = new File(processRequest(request, response, key));
					
					is = new FileInputStream(file);
					blobs.put(entry.getKey(), is);
					file.delete();
				} else {
					sql.append(key).append(", ");
					values.append("null").append(", ");
				}
			}
		}
		sql.deleteCharAt(sql.lastIndexOf(","));
		sql.append(")");
		values.deleteCharAt(values.lastIndexOf(","));
		values.append(")");
		sql.append(values);
		values = null;
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		int i = 1;
		for (Entry<String, FileInputStream> entry : blobs.entrySet()) {
			FileInputStream fis = entry.getValue();
			if (fis != null)
				pstmt.setBinaryStream(i++, fis, fis.available());
			else
				pstmt.setString(i++, "DBMS_LOB.");
		}
		pstmt.executeUpdate();
	}

	private int insertIntoParant(HttpServletRequest request, Connection conn, String insertIntoParent, int processId)
			throws SQLException {
		PreparedStatement pstmt1 = conn.prepareStatement(insertIntoParent);
		pstmt1.setInt(1, processId);
		long personId = Long.parseLong(request.getParameter("PERSON_ID"));
		pstmt1.setLong(2, personId);
		User user = (User) request.getSession().getAttribute("user");
		pstmt1.setInt(3, user.getUserId());
		int processNum = Integer.parseInt(request.getParameter("HU$PROCESS_NUM"));
		
		int department_id = Integer.parseInt((""+processNum).charAt(0)+"");
		
		pstmt1.setInt(4, processNum);
		pstmt1.setInt(5 , department_id);
		
		pstmt1.executeUpdate();
		return processNum;
	}

	private String getTableName(int processNum, Connection conn) throws SQLException {
		String sql = "SELECT TABLE_NAME FROM TABLE_NAMES WHERE PROCESS_NUM = " + processNum;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String tableName = rs.getString(1);
		rs.close();
		return tableName;
	}

	private Map<String, String> getColumns(String tableName, Connection conn) throws SQLException {
		String sql = "SELECT COLUMN_NAME, DATA_TYPE\r\n" + "FROM USER_TAB_COLUMNS\r\n" + "WHERE TABLE_NAME = '"
				+ tableName + "'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		Map<String, String> columns = new LinkedHashMap<String, String>();
		while (rs.next()) {
			columns.put(rs.getString(1), rs.getString(2));
		}
		rs.close();
		return columns;
	}

	private int getProcessId(Connection conn) throws SQLException {
		String sql = "SELECT NVL(MAX(PROCESS_ID), 0) + 1 FROM PROCESS_DOC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int nextDocId = 0;
		synchronized (this) {
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			nextDocId = rs.getInt(1);
			rs.close();
		}
		return nextDocId;
	}

	private String processRequest(HttpServletRequest request, HttpServletResponse response, String parametr)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		// Create path components to save the file
		final String path = "E:";
		final Part filePart = request.getPart(parametr);
		final String fileName = getFileName(filePart);

		OutputStream out = null;
		InputStream filecontent = null;

		try {
			String file = path + File.separator + fileName;
			out = new FileOutputStream(new File(file));
			filecontent = filePart.getInputStream();

			int read = 0;
			final byte[] bytes = new byte[1024];

			while ((read = filecontent.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			return file;
		} catch (FileNotFoundException fne) {
			fne.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
			if (filecontent != null) {
				filecontent.close();
			}

		}
		return null;
	}

	private String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");

		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
