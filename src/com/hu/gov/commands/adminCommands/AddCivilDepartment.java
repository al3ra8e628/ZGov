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


public class AddCivilDepartment extends CommandBase{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String c_dept_id = request.getParameter("c_dept_id") ;
		String c_dept_name = request.getParameter("c_dept_name") ;
		
		try {
			
			Connection conn = DatabaseConnection.getConnection() ;
			String query = "insert into CIVIL_DEPARTMENTS values("+c_dept_id +",'"+c_dept_name+"')" ; 
			PreparedStatement pstmt = conn.prepareStatement(query) ; 
			pstmt.execute() ; 
			
			try {
				request.getRequestDispatcher("/Admin/add_civil_department.jsp?res=1").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch blocks
			e.printStackTrace();
			try {
				request.getRequestDispatcher("/Admin/add_civil_department.jsp?res=-1").forward(request, response);
			} catch (ServletException w) {
				// TODO Auto-generated catch block
				w.printStackTrace();
			}
		
		} 
		
		
		
		
		
		

	}

}
