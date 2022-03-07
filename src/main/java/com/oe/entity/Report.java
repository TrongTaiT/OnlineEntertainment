package com.oe.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@NamedStoredProcedureQueries({ //
		@NamedStoredProcedureQuery(name = "Report.favoriteByYear", //
				procedureName = "spFavoriteByYear", //
				parameters = { //
						@StoredProcedureParameter(name = "Year", type = Integer.class) }, // , mode = ParameterMode.IN
				resultClasses = { Report.class }) })
@NamedQueries({ //
		@NamedQuery(name = "Report.listByLike", query = "SELECT new Report(o.video.title, count(o), "//
				+ "max(o.likedDate), min(o.likedDate)) " //
				+ "FROM Favorite o " //
				+ "GROUP BY o.video.title "//
				+ "ORDER BY count(o) DESC"), //
		@NamedQuery(name = "Report.getByVideoID", query = "SELECT new Report(o.video.title, count(o), "//
				+ "max(o.likedDate), min(o.likedDate)) " //
				+ "FROM Favorite o " //
				+ "WHERE o.video.id = :videoID " //
				+ "GROUP BY o.video.title "//
				+ "ORDER BY count(o) DESC"), //
})

@Entity
public class Report {

	@Id
	private Serializable group;

	private Long likes;

	@Temporal(TemporalType.DATE)
	private Date newest;

	@Temporal(TemporalType.DATE)
	private Date oldest;

	public Report() {
		super();
	}

	public Report(Serializable group, Long likes, Date newest, Date oldest) {
		super();
		this.group = group;
		this.likes = likes;
		this.newest = newest;
		this.oldest = oldest;
	}

	@Override
	public String toString() {
		return "Report [group=" + group + ", likes=" + likes + ", newest=" + newest + ", oldest=" + oldest + "]";
	}

	public Serializable getGroup() {
		return group;
	}

	public void setGroup(Serializable group) {
		this.group = group;
	}

	public Long getLikes() {
		return likes;
	}

	public void setLikes(Long likes) {
		this.likes = likes;
	}

	public Date getNewest() {
		return newest;
	}

	public void setNewest(Date newest) {
		this.newest = newest;
	}

	public Date getOldest() {
		return oldest;
	}

	public void setOldest(Date oldest) {
		this.oldest = oldest;
	}

}
