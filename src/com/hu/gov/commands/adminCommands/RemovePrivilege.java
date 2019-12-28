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

public class RemovePrivilege extends CommandBase{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		boolean done = true ; 
			
		Connection conn = null ; 
		String query = "" ; 
		try {
			conn = DatabaseConnection.getConnection() ;
			query = "DELETE FROM USER_DEPARTMENT_PROCESS WHERE USER_ID = ? AND PROCESS_NUM = ?" ; 
			conn.setAutoCommit(false);		
		} catch (SQLException e) {
			
			done = false ; 
			e.printStackTrace();
		} 
		
		
		String [] processes_num = request.getParameterValues("process_num") ; 
		if(processes_num != null){
		for(String processNum : request.getParameterValues("process_num")){
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(query) ;
				pstmt.setInt(2, Integer.parseInt(processNum));
				pstmt.setInt(1, Integer.parseInt(request.getParameter("user_id")));
				pstmt.executeQuery() ; 

				
							
			} catch (SQLException e) {
				done = false ;
				e.printStackTrace();
			} 
			
				
		}}else {
			done = false ;
			 
		}
		
		
		try {
			conn.commit();
			} catch (SQLException e) {
				done = false ;
				e.printStackTrace();
			return ; 
			}
		
		
		
		
		try {
			if(done)
				request.getRequestDispatcher("/Admin/remove_privilege.jsp?res=1").forward(request, response);
			else
				request.getRequestDispatcher("/Admin/remove_privilege.jsp?res=-1").forward(request, response);
			
		} catch (ServletException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
	}
	

}
