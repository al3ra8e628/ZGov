package com.hu.gov.commands;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OpenLogin extends CommandBase{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		try {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
	}

}
