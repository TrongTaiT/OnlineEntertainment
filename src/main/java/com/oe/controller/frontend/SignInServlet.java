package com.oe.controller.frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oe.dao.UserDAO;
import com.oe.entity.User;
import com.oe.utility.XCookie;

@WebServlet({"/sign-in", "/admin/sign-in"})
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignInServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// đọc giá trị của cookie
		String email = XCookie.get("email", request);
		String password = XCookie.get("password", request);
		
		request.setAttribute("email", email);
		request.setAttribute("password", password);
		
		request.getRequestDispatcher("/frontend/sign-in.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		String destPage = "/frontend/sign-in.jsp";
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		
		User user = userDAO.findByEmail(email);
		
		if (user == null) {
			request.setAttribute("message", "Không tìm thấy email");
		} else {
			if (!userDAO.checkLogin(email, password)) {
				request.setAttribute("message", "Sai mật khẩu");
			} else {
				request.getSession().setAttribute("user", user);
				
				int hours = (remember == null) ? 0 : (30 * 24); // 0 = xoá
				XCookie.add("email", email, hours, response);
				XCookie.add("password", password, hours, response);
				
				String uri = request.getRequestURI();
				if (uri.contains("admin")) {
					destPage = "/admin";
				} else {
					destPage = "";
				}
			}
		}
		
		request.getRequestDispatcher(destPage).forward(request, response);
	}

}
