package com.hu.gov.commands;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hu.gov.business.User;

public class OpenFile extends CommandBase{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String fileName = request.getParameter("DIS").toLowerCase() ; 
		try {
			if(fileName.equalsIgnoreCase("login")){
				request.getSession().removeAttribute("user");	
				request.getRequestDispatcher("/Login.jsp").forward(request, response) ; 
				return ; 
			}
		User user = (User) request.getSession().getAttribute("user") ; 
		String url = "/" ; 
		if(user.isAdmin()){
			url += "Admin/" ; 
		}else{
			url += "User/" ; 
		}
		url+= fileName+".jsp" ; 
		
				request.getRequestDispatcher(url).forward(request,response);
		
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
