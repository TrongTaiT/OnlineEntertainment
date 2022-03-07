package com.oe.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.oe.dao.UserDAO;
import com.oe.entity.User;
import com.oe.utility.XFile;

@MultipartConfig
@WebServlet({ //
		"/admin/user", //
		"/admin/user/edit", //
		"/admin/user/create", //
		"/admin/user/update", //
		"/admin/user/delete", //
})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private User user;
	private String message;
	private XFile xFile;

	public UserServlet() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		userDAO = new UserDAO();
		user = new User();
		message = "";
		xFile = new XFile(request);

		String uri = request.getRequestURI();
		if (uri.contains("edit")) {
			this.editUser(request, response);
		} else if (uri.contains("create")) {
			this.createUser(request, response);
		} else if (uri.contains("update")) {
			this.updateUser(request, response);
		} else if (uri.contains("delete")) {
			this.deleteUser(request, response);
		}

		List<User> list = userDAO.listAll();
		request.setAttribute("users", list);
		request.setAttribute("user", user);
//		System.out.println("request " + user);
		if (message.length() > 0) {
			request.setAttribute("message", message);
		}
		request.getRequestDispatcher("/admin/user.jsp").forward(request, response);
	}

	private void editUser(HttpServletRequest request, HttpServletResponse response) {
		Integer userID = Integer.parseInt(request.getParameter("userID"));
		user = userDAO.get(userID);
	}

	private void createUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			BeanUtils.populate(user, request.getParameterMap());
//			System.out.println("beanutil " + user);

			User existUser = userDAO.findByEmail(user.getEmail());
			if (existUser != null) {
				message = "Could not create new user because the email '" + user.getEmail() + "' already exists.";
			} else {
				Part part = request.getPart("image");
				if (part != null && part.getSize() > 0) {
					user.setImage(xFile.saveAvatar("image", user.getEmail()));
				} else {
					user.setImage("default_avatar.png");
				}

				user = userDAO.create(user);

				message = "Created a new user successfully.";
			}
		} catch (Exception e) {
			message = "Create user failed " + e;
			e.printStackTrace();
		}
	}

	private void updateUser(HttpServletRequest request, HttpServletResponse response) {
		// check if user change image or not
		try {
			BeanUtils.populate(user, request.getParameterMap());
			System.out.println("beanutil " + user);

			User existUser = userDAO.findByEmail(user.getEmail());

			// check two users entities whether they are the same entity
			// or two completely different entities
			if (existUser != null && existUser.getUserID() != user.getUserID()) {
				message = "Could not update the user. "//
						+ "The user with email " + user.getEmail() + " is already exists";
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

				message = "Updated one user successfully!";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "Update user failed " + e;
		}
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
		Integer userID = Integer.parseInt(request.getParameter("userID"));

		if (userID == 1) {
			message = "Could not delete the root admin";
		} else {
			xFile.deleteAvatar(userDAO.get(userID).getImage());

			userDAO.delete(userID);
			message = "The user has been deleted successfully.";
		}
	}

}
