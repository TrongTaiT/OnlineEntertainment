package com.oe.dao;

import java.util.List;

import com.oe.entity.Share;

public class ShareDAO extends JpaDAO<Share> implements GenericDAO<Share> {

	@Override
	public Share create(Share entity) {
		return super.create(entity);
	}

	@Override
	public Share update(Share entity) {
		return super.update(entity);
	}

	@Override
	public Share get(Object id) {
		return super.find(Share.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Share.class, id);
	}

	@Override
	public List<Share> listAll() {
		return super.findWithNamedQuery("Share.findAll");
	}

}
