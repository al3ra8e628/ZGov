package com.hu.gov.commands.adminCommands;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.database.DatabaseConnection;

import com.hu.gov.business.Employee;
import com.hu.gov.commands.CommandBase;



public class GetPersonById  extends CommandBase{

 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        
		Long id = Long.parseLong(String.valueOf(request.getParameter("person_id")))  ; 

	         response.setContentType("text/html; charset=UTF-8") ; 
			 response.setCharacterEncoding("UTF-8");
			 
	         Employee employee = getEmployeeById(id); 
	         PrintWriter out = response.getWriter() ; 
	         
	         if(employee != null){
	    	 
	         String res = "{'first_name':'"+employee.getFirstName()+"'"
	        		     +",'last_name':'"+employee.getLastName()+"'"
	    	 	     	+ ",'employee_id':'"+employee.getEmployee_id()+"'}" ; 
	    	     
	    	        res = res.replace("'","\"") ; 
	        	
	    	        out.print(res);
	         
	         }else{
	    	 
	        	 response.getWriter().print("-1");
	       
	         }
	       
	       
		}
	
	
	public Employee getEmployeeById(Long  id){
           Employee employee = null ;   
		   
           try {
			String query = "select first_name , last_name , employee_id "
						 + "from person_profile "
					     + "left join EMPLOYEE_PROFILE using (person_id)"
					     + " where person_id ="+id ;    
			Connection conn = DatabaseConnection.getConnection() ;
		    PreparedStatement prst = conn.prepareStatement(query) ; 
		    ResultSet rs =  prst.executeQuery() ; 
		    
		    if(rs.next()){
		    	employee  = new Employee() ; 
		   	    employee.setFirstName(rs.getString("first_name"));
		   	    employee.setLastName(rs.getString("last_name"));
		   	    employee.setEmployee_id(rs.getInt("employee_id"));
			}
		    
		    
		    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			return employee ; 
	}
	
	}
