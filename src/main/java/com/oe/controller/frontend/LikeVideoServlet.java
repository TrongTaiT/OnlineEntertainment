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

@WebServlet("/like")
public class LikeVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LikeVideoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message = "";
		Integer videoID = Integer.parseInt(request.getParameter("videoID"));
		User sessionUser = (User) request.getSession().getAttribute("user");
		Video video = new VideoDAO().get(videoID);

		Favorite favorite = new Favorite();
		favorite.setLikedDate(XDate.now());
		favorite.setUser(sessionUser);
		favorite.setVideo(video);

		FavoriteDAO favoriteDAO = new FavoriteDAO();
		Favorite existFavorite = favoriteDAO.findDuplicate(sessionUser.getUserID(), videoID);
		if (existFavorite != null) {
			message = "Video này đã ở trong mục yêu thích của bạn!";
		} else {
			favorite = favoriteDAO.create(favorite);
			if (favorite.getFavoriteID() > 0) {
				message = "Đã thêm vào mục yêu thích của bạn!";
			} else {
				message = "Thêm vào mục yêu thích thất bại!";
			}
		}

		if (message.length() > 0) {
			request.setAttribute("message", message);
		}
		
		request.getRequestDispatcher("/my-favorite").forward(request, response);
	}

}
