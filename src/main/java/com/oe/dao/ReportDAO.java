package com.oe.dao;

import java.util.List;

import com.oe.entity.Report;

public class ReportDAO extends JpaDAO<Report> {

	public List<Report> listByLike() {
		return super.findWithNamedQuery("Report.listByLike");
	}

	public Report getByVideoID(Object videoID) {
		List<Report> list = super.findWithNamedQuery("Report.getByVideoID", "videoID", videoID);
		if (!list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

}
