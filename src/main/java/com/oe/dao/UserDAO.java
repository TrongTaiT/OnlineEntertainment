package com.oe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oe.entity.User;
import com.oe.utility.HashUtil;

public class UserDAO extends JpaDAO<User> implements GenericDAO<User> {

	public UserDAO() {
	}

	@Override
	public User create(User entity) {
		if (entity.getImage() == null) {
			entity.setImage("default_avatar.png");
		}
		entity.setPassword(HashUtil.doHashing(entity.getPassword()));
		return super.create(entity);
	}

	@Override
	public User update(User entity) {
//		User currentStateUser = this.get(entity.getUserID());
//		
//		String currentHashedPassword = currentStateUser.getPassword();
//		
//		String updatingPassword = entity.getPassword();
//		
//		if (!currentHashedPassword.equals(updatingPassword)) {
//			entity.setPassword(HashUtil.doHashing(updatingPassword));
//		} else {
//			entity.setPassword(currentHashedPassword);
//		}
		entity.setPassword(HashUtil.doHashing(entity.getPassword()));
		return super.update(entity);
	}

	@Override
	public User get(Object id) {
		return super.find(User.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(User.class, id);
	}

	@Override
	public List<User> listAll() {
		return super.findWithNamedQuery("User.findAll");
	}
	
	public User findByEmail(String email) {
		List<User> list = super.findWithNamedQuery("User.findByEmail", "email", email);
		if (list.isEmpty()) {
			return null;
		}
		return list.get(0);
	}
	
	public boolean checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("email", email);
		parameters.put("password", HashUtil.doHashing(password));
		
		List<User> list = super.findWithNamedQuery("User.checkLogin", parameters);
		
		if (list.size() == 1) {
			return true;
		}
		
		return false;
	}
}
