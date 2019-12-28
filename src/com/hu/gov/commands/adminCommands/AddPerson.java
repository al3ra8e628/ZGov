package com.hu.gov.commands.adminCommands;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.database.DatabaseConnection;

import com.hu.gov.business.Person;
import com.hu.gov.business.User;
import com.hu.gov.commands.CommandBase;

public class AddPerson extends CommandBase {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Person person = new Person() ; 
	
        
        person.setPersonId(Long.parseLong(request.getParameter("person_id")));
		person.setFirstName(request.getParameter("first_name"));
		person.setMidName(request.getParameter("mid_name")); 
		person.setLastName(request.getParameter("last_name")); 
		person.setAddress(request.getParameter("address"));
		person.setBirthDate(request.getParameter("birth_date"));
		person.setPhoneNumber(request.getParameter("phone_number")); 
	
		User user =(User) request.getSession().getAttribute("user") ; 
		String dis = (user.isAdmin())?"Admin":"User" ; 
		try {
			
		if(addPerson(person)){
			
			
			request.getRequestDispatcher("/"+dis+"/add_person.jsp?res=1").forward(request, response);
				
			
			
		}else{
			
			request.getRequestDispatcher("/"+dis+"/add_person.jsp?res=-1").forward(request, response);
			
			
		}
		
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	public boolean addPerson(Person person){
	      
		
		try {
			
			Connection conn = DatabaseConnection.getConnection() ;
			String query = "INSERT INTO person_profile values (?,?,?,?,?,?,?) " ; 
			PreparedStatement ps = conn.prepareStatement(query) ;
			
			ps.setLong(1, person.getPersonId());
		    ps.setString(2, person.getFirstName());
			ps.setString(3, person.getMidName());
			ps.setString(4, person.getLastName());
			ps.setDate(5, (person.getBirthDate().isEmpty())?null:Date.valueOf(person.getBirthDate()));
			ps.setString(6, person.getAddress());
			ps.setString(7, person.getPhoneNumber());
		    ps.executeQuery() ; 
			
		    return true ; 
		} catch (SQLException e) {
    		e.printStackTrace();
			return false ;   
		} 
	
	
	
	}
	
	
	
	

}
