package com.oe.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oe.dao.ReportDAO;
import com.oe.entity.Report;

@WebServlet("/admin/report")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReportServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ReportDAO reportDAO = new ReportDAO();
		
		// Tab 
		List<Report> favorite1 = reportDAO.listByLike();
		request.setAttribute("favorite1", favorite1);
		request.getRequestDispatcher("/admin/report.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		super.service(req, resp);
//	}

}
