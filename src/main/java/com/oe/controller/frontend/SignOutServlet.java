package com.oe.controller.frontend;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sign-out")
public class SignOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignOutServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("user", null);
		request.getRequestDispatcher("/").forward(request, response);
	}

}
