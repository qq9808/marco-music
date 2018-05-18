package com.marco.music.service.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marco.music.dao.forum.ForumDAO;
import com.marco.music.model.forum.Forum;

/**
 * @author Marco
 * @date 2017年5月25日 上午8:57:43
 * 论坛Service.
 */
@Service
@Transactional
public class ForumService {

	@Autowired
	private ForumDAO forumDAO;
	
	public void save(Forum forum) throws Exception {
		forumDAO.save(forum);
	}
	
	public void update(Forum forum) throws Exception {
		forumDAO.update(forum);
	}
	
	public Forum get(Integer id) throws Exception {
		return forumDAO.get(id);
	}
	
	public Object[] getForum(Integer id) throws Exception {
		return forumDAO.getForum(id);
	}
	
	public void delete(Integer id) throws Exception {
		forumDAO.delete(id);
	}
	
	public int countForumByCondition(Forum forum) throws Exception {
		return forumDAO.countForumByCondition(forum);
	}
	
	public List<Forum> searchForumByCondition(Forum forum, Integer startRow, Integer fetchSize) throws Exception {
		return forumDAO.searchForumByCondition(forum, startRow, fetchSize);
	}
	
	public List<Object[]> searchForumBySQL(Integer startRow, Integer fetchSize) throws Exception {
		return forumDAO.searchForumBySQL(startRow, fetchSize);
	}
	
	public List<Forum> findForumByUserID(Integer id) throws Exception {
		return forumDAO.findForumByUserID(id);
	}
		
}
