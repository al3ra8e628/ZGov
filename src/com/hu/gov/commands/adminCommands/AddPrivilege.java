package com.hu.gov.commands.adminCommands;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.database.DatabaseConnection;

import com.hu.gov.commands.CommandBase;

public class AddPrivilege extends CommandBase{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
	
		boolean done = true ; 
		Connection conn = null ; 
		String query = "" ; 
		try {
			conn = DatabaseConnection.getConnection() ;
			query = "INSERT INTO USER_DEPARTMENT_PROCESS (PROCESS_NUM,DEPARTMENT_ID,user_id) VALUES (?,?,?)" ; 
			conn.setAutoCommit(false);		
		} catch (SQLException e) {
			done = false ; 
			e.printStackTrace();
		} 
		
		
		
		
		for(String processNum : request.getParameterValues("process_num")){
			String departmentId = processNum.substring(0, processNum.length()-2) ; 
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(query) ;
				pstmt.setInt(1, Integer.parseInt(processNum));
				pstmt.setInt(2, Integer.parseInt(departmentId));
				pstmt.setInt(3, Integer.parseInt(request.getParameter("user_id")));
				
				pstmt.executeQuery() ; 
				
			} catch (SQLException e) {
				done = false ; 
					e.printStackTrace();
			} 
			
				
		}
		
		
		try {
			conn.commit();
		} catch (SQLException e) {
			done = false ; 
			e.printStackTrace();
		}
		
		
		try{
			if(done)
				request.getRequestDispatcher("/Admin/add_privilege.jsp?res=1").include(request, response);
			else
				request.getRequestDispatcher("/Admin/add_privilege.jsp?res=-1").include(request, response);
		} catch (ServletException ee) {
			// TODO Auto-generated catch block
			ee.printStackTrace();
		}		
		
		
	}


}
