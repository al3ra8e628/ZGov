package com.hu.gov.commands.adminCommands;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.database.DatabaseConnection;

import com.hu.gov.business.Department;
import com.hu.gov.commands.CommandBase;

public class AddDepartment extends CommandBase{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Department department = new Department();
		
		department.setDepartmentId(Integer.parseInt(request.getParameter("department_id")));
		department.setDepartmentName(request.getParameter("department_name"));
		department.setDepartmentAddress(request.getParameter("department_address"));
		
		if(addDepartment(department)){
			
			
			try {
				request.getRequestDispatcher("/Admin/add_department_admin.jsp?res=1").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else{
			try {
				request.getRequestDispatcher("/Admin/add_department_admin.jsp?res=-1").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	
	public boolean addDepartment(Department department){
		
		
		try {
			Connection conn = DatabaseConnection.getConnection() ;
		    String query = "INSERT INTO department VALUES (?,?,?)" ; 
			PreparedStatement pst = conn.prepareStatement(query) ; 
			
			pst.setInt(1,department.getDepartmentId());
			pst.setString(2,department.getDepartmentName());
			pst.setString(3,department.getDepartmentAddress());
			
			pst.executeQuery();
			
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return false;
		}
		
		
		
		
	}
	
	

}
