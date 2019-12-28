package com.hu.gov.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hu.gov.business.BusinessException;
import com.hu.gov.business.User;
import com.hu.gov.commands.CommandBase;
import com.hu.gov.commands.CommandFactory;

/**
 * Servlet implementation class HttpProxy
 */
@MultipartConfig
@WebServlet("/GovSystem")
public class HttpProxy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private boolean initialized;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HttpProxy() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
		
		try {

			HttpSession session = request.getSession();
			if (!initialized) {
				initialize();
			}

			String command = request.getParameter("HU$CMD");

			if (!(command == null)) {
				User user = (User) session.getAttribute("user");
				if (user == null) {
					if (!command.equals("LOG_IN")) {
						throw new BusinessException("Please login");
					}
				}
			}
			request.getSession().setAttribute("VIEW_NAME", "all_process");
			if (command == null) {
				throw new BusinessException("Please login");
			}
			CommandBase cmd = (CommandBase) CommandFactory.getCommands().get(command).newInstance();
			cmd.execute(request, response);

		} catch (BusinessException e) {
			CommandBase cmd;
			try {
				cmd = (CommandBase) CommandFactory.getCommands().get("OPEN_LOGIN").newInstance();
				cmd.execute(request, response);
			} catch (InstantiationException | IllegalAccessException e1) {
				e1.printStackTrace();
			}
		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
	}

	public void initialize() {
		CommandFactory.init();
		initialized = true;
	}
}
