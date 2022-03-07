package com.oe.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oe.dao.VideoDAO;
import com.oe.entity.Video;

@WebServlet("")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VideoDAO videoDAO = new VideoDAO();
		List<Video> random4Videos = videoDAO.listRandom4();
		
		List<Video> mostViewedVideos = videoDAO.list4MostViewed();
		
		request.setAttribute("random4Videos", random4Videos);
		request.setAttribute("mostViewedVideos", mostViewedVideos);
		
		String homepage = "frontend/index.jsp";
		request.getRequestDispatcher(homepage).forward(request, response);
	}
}
