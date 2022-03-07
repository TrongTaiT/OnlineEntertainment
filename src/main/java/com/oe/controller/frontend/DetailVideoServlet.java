package com.oe.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oe.dao.ReportDAO;
import com.oe.dao.VideoDAO;
import com.oe.entity.Report;
import com.oe.entity.Video;

@WebServlet("/detail")
public class DetailVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DetailVideoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VideoDAO videoDAO = new VideoDAO();
		List<Video> random4Videos = videoDAO.listRandom4();
		Integer videoID = Integer.parseInt(request.getParameter("videoID"));

		ReportDAO reportDAO = new ReportDAO();
		Report report = reportDAO.getByVideoID(videoID);

		Video video = videoDAO.get(videoID);

		request.setAttribute("video", video);

		if (report != null) {
			request.setAttribute("favoriteCount", report.getLikes());
		} else {
			request.setAttribute("favoriteCount", "0");
		}
		request.setAttribute("random4Videos", random4Videos);
		request.getRequestDispatcher("/frontend/detail.jsp").forward(request, response);
	}

}
