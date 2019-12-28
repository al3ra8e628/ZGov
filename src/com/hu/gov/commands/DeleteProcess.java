package com.hu.gov.commands;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.database.DatabaseConnection;


public class DeleteProcess extends CommandBase {//done @_@ 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Connection conn;
		try {
			conn = DatabaseConnection.getConnection();
			String doc_id    = request.getParameter("doc_id");
			String tableName = getTableName(conn , doc_id); 
		
			deleteFromTable(conn , tableName , doc_id) ; 
			deleteFromDocTable(conn , doc_id) ; 

		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	private boolean deleteFromDocTable(Connection conn, String doc_id) {
		String query = "DELETE FROM PROCESS_DOC WHERE PROCESS_ID ="+doc_id ; 
		try {
			return conn.createStatement().execute(query) ;
		} catch (SQLException e) {
			e.printStackTrace();
			return false ; 
		}
	}

	
	private boolean deleteFromTable(Connection conn, String tableName , String doc_id) {
		String query = "DELETE FROM "+tableName+" WHERE PROCESS_ID ="+doc_id ; 
		try {
			return conn.createStatement().execute(query) ;
		} catch (SQLException e) {
			e.printStackTrace();
			return false ; 
		}
	}

	private String getTableName(Connection conn , String doc_id) {
		String query = "SELECT"
					 + " TABLE_NAME "
					 + " FROM table_names "
					 + " where "
					 + " process_num = (select process_num from process_doc where process_id = "+doc_id+")" ;  	

		try {
			ResultSet rs = conn.createStatement().executeQuery(query) ;
			rs.next() ; 
			return rs.getString("TABLE_NAME") ; 
		} catch (SQLException e) {
			e.printStackTrace();
			return null ; 
		} 

	}
}
