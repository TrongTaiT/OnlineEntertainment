package com.oe.controller.frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oe.dao.UserDAO;
import com.oe.entity.User;
import com.oe.utility.MailSender;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ForgotPasswordServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/frontend/forgot-password.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message = "";
		String email = request.getParameter("email");
		UserDAO userDAO = new UserDAO();
		User user = userDAO.findByEmail(email);
		// to = email, Subject, body,
		if (user == null) {
			message = "Không tìm thấy tài khoản này";
		} else {
			String subject = "Your password on OnlineEntertainment";
			String body = "We received a request to inform you about your password." + "\n\n" //
					+ "Here is your password: " + user.getPassword() + "\n\n" //
					+ "Thank you for your supports! Enjoy our comedies at http://localhost:8080/oe/";
			message = MailSender.sendEmail(email, subject, body, request);
		}
		
		if (message.length() > 0) {
			request.setAttribute("message", message);
		}

		request.getRequestDispatcher("/frontend/forgot-password.jsp").forward(request, response);
	}


}
