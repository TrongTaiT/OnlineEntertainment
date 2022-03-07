package com.oe.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oe.entity.Video;

public class VideoDAO extends JpaDAO<Video> implements GenericDAO<Video> {

	public VideoDAO() {
	}

	@Override
	public Video create(Video entity) {
		return super.create(entity);
	}

	@Override
	public Video update(Video entity) {
		return super.update(entity);
	}

	@Override
	public Video get(Object id) {
		return super.find(Video.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Video.class, id);
	}

	@Override
	public List<Video> listAll() {
		return super.findWithNamedQuery("Video.findAll");
	}

	public List<Video> listRandom4() {
		return super.findWithNamedQuery("Video.random4");
	}

	public List<Video> list4MostViewed() {
		return super.findWithNamedQuery("Video.4mostViewed");
	}

	public List<Video> listByUserID(Object userID) {
		return super.findWithNamedQuery("Video.listByUserID", "userID", userID);
	}

	public Video findDuplicateVideo(String title, Date releasedDate) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("title", title);
		parameters.put("releasedDate", releasedDate);

		List<Video> result = super.findWithNamedQuery("Video.findDuplicateVideo", parameters);

		if (!result.isEmpty()) {
			return result.get(0);
		}

		return null;
	}

}
