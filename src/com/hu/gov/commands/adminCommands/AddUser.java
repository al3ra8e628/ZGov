package com.hu.gov.commands.adminCommands;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.database.DatabaseConnection;

import com.hu.gov.business.User;
import com.hu.gov.commands.CommandBase;

public class AddUser extends CommandBase{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		
		
	
		User user = new User() ; 
		user.setUserId(Integer.parseInt(request.getParameter("user_id")));
		user.setPersonId(Long.parseLong(request.getParameter("person_id")));
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setAdmin((request.getParameter("isAdmin") != null));
		
		if(addUser(user)){
			try {
				request.getRequestDispatcher("/Admin/add_user_admin.jsp?res=1").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}else{
			try {
				request.getRequestDispatcher("/Admin/add_user_admin.jsp?res=-1").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
	}
	
	
	public boolean addUser(User user){
	       
		try {
			Connection conn = DatabaseConnection.getConnection() ;
		    String query = "INSERT INTO user_settings VALUES (?,?,?,?,?)" ; 
		    PreparedStatement pst = conn.prepareStatement(query) ; 
		    pst.setInt(1, user.getUserId());
		    pst.setString(2, user.getUsername());
		    pst.setString(3, user.getPassword());
		    pst.setLong(4, user.getPersonId());
		    pst.setString(5, ""+((user.isAdmin())?1:0)); 
		    pst.executeQuery() ; 
		    
		    return true ; 
		    
		} catch (SQLException e) {
			e.printStackTrace();
		  
			return false ; 
		} 
	}
	

}
