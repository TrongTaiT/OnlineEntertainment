package com.oe.controller.frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oe.dao.FavoriteDAO;
import com.oe.dao.VideoDAO;
import com.oe.entity.Favorite;
import com.oe.entity.User;
import com.oe.entity.Video;
import com.oe.utility.XDate;

@WebServlet("/unlike")
public class UnlikeVideoServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UnlikeVideoServlet2() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message = "";
		Integer videoID = Integer.parseInt(request.getParameter("videoID"));
		User sessionUser = (User) request.getSession().getAttribute("user");
		Video video = new VideoDAO().get(videoID);

		FavoriteDAO favoriteDAO = new FavoriteDAO();
		Favorite favorite = favoriteDAO.findDuplicate(sessionUser.getUserID(), videoID);
		favoriteDAO.delete(favorite.getFavoriteID());

		request.getRequestDispatcher("/my-favorite").forward(request, response);
	}

}
