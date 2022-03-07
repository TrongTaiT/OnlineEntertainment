package com.oe.controller.frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oe.dao.UserDAO;
import com.oe.entity.User;
import com.oe.utility.XFile;

@MultipartConfig
@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditProfileServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/frontend/edit-profile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		String message = "";
		User user = (User) request.getSession().getAttribute("user");
		XFile xFile = new XFile(request);
		
		// update the data of user in session
		String email = request.getParameter("email");
		user.setEmail(email);
		String fullname = request.getParameter("fullname");
		user.setFullname(fullname);
		
		User existUser = userDAO.findByEmail(user.getEmail());
		// check two users entities whether they are the same entity
		// or two completely different entities
		if (existUser != null && existUser.getUserID() != user.getUserID()) {
			message = "Email '" + user.getEmail() + "' đã được đăng ký.";
		} else {
			String currentImage = request.getParameter("currentImage");
			Part part = request.getPart("image");
			if (part != null && part.getSize() > 0) {
				xFile.deleteAvatar(currentImage);
				user.setImage(xFile.saveAvatar("image", user.getEmail()));
			} else {
				user.setImage(currentImage);
			}
			
			user = userDAO.update(user);
			request.getSession().setAttribute("user", user);
			message = "Lưu thay đổi thành công!";
		}
		
		if (message.length() > 0) {
			request.setAttribute("message", message);
		}
		this.doGet(request, response);
	}

}
