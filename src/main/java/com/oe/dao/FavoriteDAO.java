package com.oe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oe.entity.Favorite;

public class FavoriteDAO extends JpaDAO<Favorite> implements GenericDAO<Favorite> {

	@Override
	public Favorite create(Favorite entity) {
		return super.create(entity);
	}

	@Override
	public Favorite update(Favorite entity) {
		return super.update(entity);
	}

	@Override
	public Favorite get(Object id) {
		return super.find(Favorite.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Favorite.class, id);
	}

	@Override
	public List<Favorite> listAll() {
		return super.findWithNamedQuery("Favorite.findAll");
	}
	
	public Favorite findDuplicate(Object userID, Object videoID) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("userID", userID);
		parameters.put("videoID", videoID);

		List<Favorite> result = super.findWithNamedQuery("Favorite.findDuplicate", parameters);

		if (!result.isEmpty()) {
			return result.get(0);
		}

		return null;
	}

}
