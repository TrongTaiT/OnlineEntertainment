package com.oe.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oe.dao.VideoDAO;
import com.oe.entity.User;
import com.oe.entity.Video;

@WebServlet("/my-favorite")
public class MyFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyFavoriteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User sessionUser = (User) request.getSession().getAttribute("user");
		VideoDAO videoDAO = new VideoDAO();
		List<Video> favoriteVideos = videoDAO.listByUserID(sessionUser.getUserID());
		
		request.setAttribute("favoriteVideos", favoriteVideos);
		request.getRequestDispatcher("/frontend/my-favorite.jsp").forward(request, response);
	}

}
