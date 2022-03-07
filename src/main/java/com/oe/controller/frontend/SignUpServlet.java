package com.oe.controller.frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.oe.dao.UserDAO;
import com.oe.entity.User;

@WebServlet("/sign-up")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignUpServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/frontend/sign-up.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		User user = new User();
		String message = "";
		boolean flag = false;
		
		try {
			BeanUtils.populate(user, request.getParameterMap());
			
			User existUser = userDAO.findByEmail(user.getEmail());
			
			if (existUser != null) {
				message = "Email đã được đăng ký";
			} else {
				user = userDAO.create(user);
				if (user.getUserID() > 0) {
//					message = "Đăng ký thành công";
					flag = true;
				} else {
					message = "Đăng ký thất bại";
				}
				request.setAttribute("user", user);
			}
		} catch (Exception e) {
			message = "Đăng ký thất bại";
			e.printStackTrace();
		}
		
		if (message.length() > 0) {
			request.setAttribute("message", message);
		}
		
		if (flag == false) {
			request.getRequestDispatcher("/frontend/sign-up.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("").forward(request, response);
		}
	}

}
