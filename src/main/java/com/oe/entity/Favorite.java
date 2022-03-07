package com.oe.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 * The persistent class for the Favorite database table.
 * 
 */
@Entity
@NamedQueries({ //
		@NamedQuery(name = "Favorite.findAll", query = "SELECT f FROM Favorite f"), //
		@NamedQuery(name = "Favorite.findDuplicate", query = "SELECT f FROM Favorite f "//
				+ "WHERE f.user.userID = :userID AND f.video.videoID = :videoID"), //
})

public class Favorite implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int favoriteID;

	private Date likedDate;

	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "userID")
	private User user;

	// bi-directional many-to-one association to Video
	@ManyToOne
	@JoinColumn(name = "videoID")
	private Video video;

	public Favorite() {
	}

	public int getFavoriteID() {
		return this.favoriteID;
	}

	public void setFavoriteID(int favoriteID) {
		this.favoriteID = favoriteID;
	}

	public Date getLikedDate() {
		return this.likedDate;
	}

	public void setLikedDate(Date likedDate) {
		this.likedDate = likedDate;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return this.video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

}