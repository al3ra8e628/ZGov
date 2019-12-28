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

public class AddHealthDepartment extends CommandBase{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String h_dept_id = request.getParameter("h_dept_id") ;
		String h_dept_name = request.getParameter("h_dept_name") ;
		
		try {
			
			Connection conn = DatabaseConnection.getConnection() ;
			String query = "insert into HEALTH_DEPARTMENTS values("+h_dept_id +",'"+h_dept_name+"')" ; 
			PreparedStatement pstmt = conn.prepareStatement(query) ; 
			pstmt.execute() ; 
			
			try {
				request.getRequestDispatcher("/Admin/add_health_department.jsp?res=1").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				request.getRequestDispatcher("/Admin/add_health_department.jsp?res=-1").forward(request, response);
			} catch (ServletException ee) {
				// TODO Auto-generated catch block
				ee.printStackTrace();
			}
		} 
		
		
		
		
		
		
	}

}
