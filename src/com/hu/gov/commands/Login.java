package com.hu.gov.commands;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.database.DatabaseConnection;

import com.hu.gov.business.BusinessException;
import com.hu.gov.business.User;

public class Login extends CommandBase {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username").toLowerCase();
		String password = request.getParameter("password");
		
		try{
			try {
				User user = login(username, password) ;
				if(user != null){
					// log in code @_@
					request.getSession().setAttribute("user", user);
					
					if(user.isAdmin()){
						request.getRequestDispatcher("/Admin/home_admin.jsp").forward(request, response);
					}else{
						request.getRequestDispatcher("/User/home_user.jsp").forward(request, response);
					}

				}else{
					//invalid userName @_@
					request.getRequestDispatcher("/Login.jsp?res=-1").forward(request, response);
					
				}
			} catch (BusinessException e) {
				//invalid password @_@
					request.getRequestDispatcher("/Login.jsp?res=-2&username="+username).forward(request, response);
					e.printStackTrace();
			}
		}catch (ServletException se) {
			se.printStackTrace();
		}

	}

	private User login(String username, String password) throws BusinessException {
		Connection conn = null;
		String sql = "SELECT PASSWORD, USER_ID , IS_ADMIN , FIRST_NAME FROM USER_SETTINGS NATURAL JOIN PERSON_PROFILE WHERE USERNAME = '"
				+ username + "'";
		User user = null;
		try {
			conn = DatabaseConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();			
			if(rs.next()){
				if(rs.getString(1).equals(password)){
					user = new User();
					user.setUserId(rs.getInt("USER_ID"));
					user.setAdmin(rs.getInt("IS_ADMIN") == 1);
					user.setFirstName(rs.getString(4));
				}else{
					throw new BusinessException("invalid password") ; 
				}
			}
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return user;
	}
}
