package com.oe.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 * The persistent class for the Video database table.
 * 
 */
@Entity
@NamedQueries({ //
		@NamedQuery(name = "Video.findAll", //
				query = "SELECT v FROM Video v"), //
		@NamedQuery(name = "Video.findDuplicateVideo", //
				query = "SELECT v FROM Video v WHERE v.title=:title " //
						+ "AND v.releasedDate=:releasedDate"), //
		@NamedQuery(name = "Video.listByUserID", //
				query = "SELECT f.video FROM Favorite f " //
						+ "WHERE f.user.userID = :userID"), //
})

@NamedNativeQueries({ //
		@NamedNativeQuery(name = "Video.random4", //
				query = "SELECT TOP 4 * FROM Video ORDER BY newid()", //
				resultClass = Video.class), //
		@NamedNativeQuery(name = "Video.4mostViewed", //
				query = "SELECT TOP 4 * FROM Video ORDER BY views DESC", //
				resultClass = Video.class),//
})
public class Video implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int videoID;

	private boolean active;

	private String description;

	private String poster;

	private Date releasedDate;

	private String title;
	
	private String linkVideo;

	private int views;

	// bi-directional many-to-one association to Favorite
	@OneToMany(mappedBy = "video")
	private List<Favorite> favorites;

	// bi-directional many-to-one association to Share
	@OneToMany(mappedBy = "video")
	private List<Share> shares;

	public Video() {
	}

	@Override
	public String toString() {
		return "Video [videoID=" + videoID + ", title=" + title + ", releasedDate=" + releasedDate + ", poster="
				+ poster + ", active=" + active + ", views=" + views + "]";
	}

	public int getVideoID() {
		return this.videoID;
	}

	public void setVideoID(int videoID) {
		this.videoID = videoID;
	}

	public boolean getActive() {
		return this.active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPoster() {
		return this.poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public Date getReleasedDate() {
		return this.releasedDate;
	}

	public void setReleasedDate(Date releasedDate) {
		this.releasedDate = releasedDate;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLinkVideo() {
		return linkVideo;
	}

	public void setLinkVideo(String linkVideo) {
		this.linkVideo = linkVideo;
	}

	public int getViews() {
		return this.views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public List<Favorite> getFavorites() {
		return this.favorites;
	}

	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}

	public Favorite addFavorite(Favorite favorite) {
		getFavorites().add(favorite);
		favorite.setVideo(this);

		return favorite;
	}

	public Favorite removeFavorite(Favorite favorite) {
		getFavorites().remove(favorite);
		favorite.setVideo(null);

		return favorite;
	}

	public List<Share> getShares() {
		return this.shares;
	}

	public void setShares(List<Share> shares) {
		this.shares = shares;
	}

	public Share addShare(Share share) {
		getShares().add(share);
		share.setVideo(this);

		return share;
	}

	public Share removeShare(Share share) {
		getShares().remove(share);
		share.setVideo(null);

		return share;
	}

}