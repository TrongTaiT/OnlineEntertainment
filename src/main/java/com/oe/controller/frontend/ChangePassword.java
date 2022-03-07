package com.oe.controller.frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oe.dao.UserDAO;
import com.oe.entity.User;

@WebServlet("/change-password")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangePassword() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/frontend/change-password.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message = "";
		UserDAO userDAO = new UserDAO();
		User sessionUser = (User) request.getSession().getAttribute("user");

		User user = userDAO.get(sessionUser.getUserID());

		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmNewPassword = request.getParameter("confirmNewPassword");

		if (!user.getPassword().equals(currentPassword)) {
			message = "Mật khẩu hiện tại không đúng!";
		} else if (!newPassword.equals(confirmNewPassword)) {
			message = "Xác nhận mật khẩu mới không chính xác!";
		} else {
			user.setPassword(newPassword);
			userDAO.update(user);
			message = "Đổi mật khẩu thành công!";
		}

		if (message.length() > 0) {
			request.setAttribute("message", message);
		}
		this.doGet(request, response);
	}

}
