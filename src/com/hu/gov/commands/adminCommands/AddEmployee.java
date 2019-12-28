package com.hu.gov.commands.adminCommands;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.database.DatabaseConnection;

import com.hu.gov.business.Employee;
import com.hu.gov.commands.CommandBase;

public class AddEmployee extends CommandBase{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		Employee employee = new Employee() ; 
		employee.setEmployee_id(Integer.parseInt(request.getParameter("employee_id")));
		employee.setPersonId(Long.parseLong(request.getParameter("person_id")));
		employee.setDepartment_id(Integer.parseInt(request.getParameter("department_id")));
		employee.setJobTitle(request.getParameter("job_title"));
		
		if(addEmployee(employee)){
			
		try {
				request.getRequestDispatcher("/Admin/add_employee_admin.jsp?res=1").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
	
		}else{
			
			try {
				request.getRequestDispatcher("/Admin/add_employee_admin.jsp?res=-1").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}

	}

	public boolean addEmployee(Employee employee){
		
		try {
			Connection conn = DatabaseConnection.getConnection() ;
		    String query = "INSERT INTO employee_profile VALUES (?,?,?,?)" ; 
			PreparedStatement pst = conn.prepareStatement(query)  ; 
			pst.setInt(1,employee.getEmployee_id());
			pst.setLong(2, employee.getPersonId());
			pst.setInt(3, employee.getDepartment_id());
			pst.setString(4, employee.getJobTitle());
		    pst.executeQuery() ; 
			
			return true ; 
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   return false ; 
		} 
		
	}	
	
}
