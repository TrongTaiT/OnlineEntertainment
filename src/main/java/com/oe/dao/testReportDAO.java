package com.oe.dao;

import java.util.List;

import com.oe.entity.Report;

public class testReportDAO {

	public static void main(String[] args) {
		ReportDAO dao = new ReportDAO();
		
		List<Report> list = dao.listByLike();
		
		System.out.println(list);
	}
	
}
