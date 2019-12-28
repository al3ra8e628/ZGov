package com.hu.gov.commands.adminCommands;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.database.DatabaseConnection;

import com.hu.gov.business.User;
import com.hu.gov.commands.CommandBase;


public class GetUserById extends CommandBase{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User user = getUserById(request.getParameter("USER_ID").trim()) ; 
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		if(user != null){
	    	 
	         String res = "{'person_id':'"+user.getPersonId()+"'}" ; 
	    	        res = res.replace("'","\"") ; 
	    	        response.getWriter().print(res);
	         
			}else{
	        	 	response.getWriter().print("-1");
	       
	         }
		
	}
	
	private User getUserById(String userId){
		User user = null ; 
		try {
			Connection conn = DatabaseConnection.getConnection() ;
			String sql = "  select p.person_id "
						+ " from person_profile p "
						+ " join user_settings u on (u.person_id = p.person_id)"
						+ " where u.user_id ="+userId
						+ ""; 
			PreparedStatement pstmt = conn.prepareStatement(sql) ; 
			ResultSet rs = pstmt.executeQuery() ; 
			if(rs.next()){
			user = new User() ; 
			user.setPersonId(rs.getLong(1));
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return user ; 
	}
	

}
