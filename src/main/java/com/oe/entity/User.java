package com.oe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

/**
 * The persistent class for the Users database table.
 * 
 */
@Entity
@Table(name = "Users")
@NamedQueries({ //
		@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"), //
		@NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email=:email"), //
		@NamedQuery(name = "User.checkLogin", query = "SELECT u FROM User u WHERE u.email=:email AND u.password=:password" ), //
})

public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userID;

	private String email;

	private String fullname;

	private String image;

	private String password;

	private boolean admin = false;

	// bi-directional many-to-one association to Favorite
	@OneToMany(mappedBy = "user")
	private List<Favorite> favorites;

	// bi-directional many-to-one association to Share
	@OneToMany(mappedBy = "user")
	private List<Share> shares;

	@Override
	public String toString() {
		return "User [userID=" + userID + ", admin=" + admin + ", email=" + email + ", fullname=" + fullname
				+ ", image=" + image + ", password=" + password + "]";
	}

	public User() {
	}

	public int getUserID() {
		return this.userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public boolean getAdmin() {
		return this.admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Favorite> getFavorites() {
		return this.favorites;
	}

	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}

	public Favorite addFavorite(Favorite favorite) {
		getFavorites().add(favorite);
		favorite.setUser(this);

		return favorite;
	}

	public Favorite removeFavorite(Favorite favorite) {
		getFavorites().remove(favorite);
		favorite.setUser(null);

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
		share.setUser(this);

		return share;
	}

	public Share removeShare(Share share) {
		getShares().remove(share);
		share.setUser(null);

		return share;
	}

}