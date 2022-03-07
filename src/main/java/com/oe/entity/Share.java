package com.oe.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The persistent class for the Share database table.
 * 
 */
@Entity
@NamedQuery(name = "Share.findAll", query = "SELECT s FROM Share s")
public class Share implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int shareID;

	private String emails;

	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "userID")
	private User user;

	// bi-directional many-to-one association to Video
	@ManyToOne
	@JoinColumn(name = "videoID")
	private Video video;

	public Share() {
	}

	public int getShareID() {
		return this.shareID;
	}

	public void setShareID(int shareID) {
		this.shareID = shareID;
	}

	public String getEmails() {
		return this.emails;
	}

	public void setEmails(String emails) {
		this.emails = emails;
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