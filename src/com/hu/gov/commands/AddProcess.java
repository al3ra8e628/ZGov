package com.hu.gov.commands;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hu.gov.control.HttpProxy;

public class AddProcess extends CommandBase{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
	///	response.sendRedirect(""+request.getParameter("file_name")+".jsp");
		try {
		
			
			request.getRequestDispatcher(request.getParameter("file_name")+".jsp").forward(request, response);
		
		
		
		
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
