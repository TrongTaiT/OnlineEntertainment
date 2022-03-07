package com.oe.controller.frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oe.dao.ShareDAO;
import com.oe.dao.VideoDAO;
import com.oe.entity.Share;
import com.oe.entity.User;
import com.oe.entity.Video;
import com.oe.utility.MailSender;

@WebServlet("/share")
public class ShareVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShareVideoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String videoID = request.getParameter("videoID");

		request.setAttribute("videoID", videoID);
		request.getRequestDispatcher("/frontend/share.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message = "";
		String toEmail = request.getParameter("email");
		User sessionUser = (User) request.getSession().getAttribute("user");

		String videoID = request.getParameter("videoID");
		Video video = new VideoDAO().get(Integer.parseInt(videoID));

		String subject = "You friend " + sessionUser.getFullname().substring(sessionUser.getFullname().lastIndexOf(" ")) //
				+ " shared with you a SUPER DUPPER FUNNY Video";
		String body = "Your friend send you this comedy" + "\n\n" //
				+ video.getTitle() + "\n" //
				+ "http://localhost:8080/oe/detail?videoID=" + video.getVideoID() + " \n\n" //
				+ video.getDescription() + "\n\n" //
				+ "Thank you for your supports! Enjoy our comedies at http://localhost:8080/oe/";
		message = MailSender.sendEmail(toEmail, subject, body, request);

		if (message.length() > 0) {
			request.setAttribute("message", message);
		}

		ShareDAO shareDAO = new ShareDAO();
		Share share = new Share();
		share.setUser(sessionUser);
		share.setVideo(video);
		share.setEmails(toEmail);
		shareDAO.create(share);

		this.doGet(request, response);
	}

}
