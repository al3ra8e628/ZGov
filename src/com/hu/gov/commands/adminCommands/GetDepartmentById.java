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
import com.hu.gov.business.Department;
import com.hu.gov.commands.CommandBase;



public class GetDepartmentById  extends CommandBase{


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        
		int id = Integer.parseInt(String.valueOf(request.getParameter("department_id")))  ; 

	         response.setContentType("text/html; charset=UTF-8") ; 
			 response.setCharacterEncoding("UTF-8");
			 
	         Department department = getDepartmentById(id); 
	         PrintWriter out = response.getWriter() ; 
	         
	         if(department != null){
	    	 
	         String res = "{'department_name':'"+department.getDepartmentName()+"' , "
	         		     + "'max_num_of_process':'"+department.getMaxNumOfProcess()+"'}" ; 
	    	     
	    	        res = res.replace("'","\"") ; 
	        	
	    	        out.print(res);
	         
	         }else{
	    	 
	        	 response.getWriter().print("-1");
	       
	         }
	       
	       
		}
	
	
	public Department getDepartmentById(int  id){
           Department department = null ;   
		   
           try {
			String query = "select department_name , NVL(max(process_num) , 0) as max_num_of_process" + 
					 " from DEPARTMENT left join PROCESS using(department_id)"
					+ " where department_id ="+id 
					+ " group by department_name";    
			Connection conn = DatabaseConnection.getConnection() ;
		    PreparedStatement prst = conn.prepareStatement(query) ; 
		    ResultSet rs =  prst.executeQuery() ; 
		    
		    if(rs.next()){
		    	department  = new Department() ; 
		   	    department.setDepartmentName(rs.getString("department_name"));
		   	    department.setMaxNumOfProcess(rs.getInt("max_num_of_process"));
		    }
		    
		    
		    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   } 
			
           return department ; 
	
	}
	
	}
