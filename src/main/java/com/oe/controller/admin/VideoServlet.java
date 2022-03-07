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

import com.oe.dao.VideoDAO;
import com.oe.entity.Video;
import com.oe.utility.XBean;
import com.oe.utility.XFile;

@MultipartConfig
@WebServlet({ //
		"/admin/video", //
		"/admin/video/edit", //
		"/admin/video/create", //
		"/admin/video/update", //
		"/admin/video/delete" //
})
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoDAO videoDAO;
	private Video video;
	private String message;
	private XFile xFile;
	private XBean xBean;

	public VideoServlet() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		videoDAO = new VideoDAO();
		video = new Video();
		message = "";
		xFile = new XFile(request);
		xBean = new XBean(request);

		String uri = request.getRequestURI();
		if (uri.contains("edit")) {
			this.editVideo(request, response);
		} else if (uri.contains("create")) {
			this.createVideo(request, response);
		} else if (uri.contains("update")) {
			this.updateVideo(request, response);
		} else if (uri.contains("delete")) {
			this.deleteVideo(request, response);
		}

		List<Video> list = videoDAO.listAll();
		request.setAttribute("videos", list);
		System.out.println(list);

		request.setAttribute("form", video);
		System.out.println("request " + video);

		if (message.length() > 0) {
			request.setAttribute("message", message);
		}
		request.getRequestDispatcher("/admin/video.jsp").forward(request, response);
	}

	private void editVideo(HttpServletRequest request, HttpServletResponse response) {
		Integer videoID = Integer.parseInt(request.getParameter("videoID"));
		video = videoDAO.get(videoID);
	}

	private void createVideo(HttpServletRequest request, HttpServletResponse response) {
		try {
			video = xBean.<Video>getBean(Video.class, "releasedDate");

			System.out.println("xBean " + video);

			Video existVideo = videoDAO.findDuplicateVideo(video.getTitle(), video.getReleasedDate());
			if (existVideo != null) {
				message = "Could not create new video. " //
						+ "The video with title '" + video.getTitle() + "'" //
						+ ", released in " + video.getReleasedDate() //
						+ " is exist"; //
			} else {
				Part part = request.getPart("poster");
				if (part != null && part.getSize() > 0) {
					video.setPoster(xFile.savePoster("poster", video.getTitle()));
				} else {
					video.setPoster("default_poster.png");
				}

				video = videoDAO.create(video);
				message = "Created a new video successfully.";
			}
		} catch (Exception e) {
			message = "Create video failed! " + e;
			e.printStackTrace();
		}
	}

	private void updateVideo(HttpServletRequest request, HttpServletResponse response) {
		try {
			video = xBean.<Video>getBean(Video.class, "releasedDate");

			System.out.println("xBean " + video);

			Video existVideo = videoDAO.findDuplicateVideo(video.getTitle(), video.getReleasedDate());
			
			// check two videos entities whether they are the same entity
			// or two completely different entities
			if (existVideo != null && existVideo.getVideoID() != video.getVideoID()) {
				message = "Could not update the video. " //
						+ "The video with title '" + video.getTitle() + "'" //
						+ ", released in " + video.getReleasedDate() //
						+ " is exist"; //
			} else {
				String currentPoster = request.getParameter("currentPoster");
				Part part = request.getPart("poster");
				if (part != null && part.getSize() > 0) {
					xFile.deletePoster(currentPoster);
					video.setPoster(xFile.savePoster("poster", video.getTitle()));
				} else {
					video.setPoster(currentPoster);
				}
				
				video = videoDAO.update(video);
				message = "Updated one video successfully!";
			}
		} catch (Exception e) {
			message = "Update video failed " + e;
			e.printStackTrace();
		}
	}

	private void deleteVideo(HttpServletRequest request, HttpServletResponse response) {
		Integer videoID = Integer.parseInt(request.getParameter("videoID"));

		xFile.deletePoster(videoDAO.get(videoID).getPoster());

		videoDAO.delete(videoID);
		message = "The video has been deleted successfully.";
	}

}
