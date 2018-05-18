package com.marco.music.service.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marco.music.dao.forum.ForumReplyDAO;
import com.marco.music.model.forum.ForumReply;

/**
 * @author Marco
 * @date 2017年5月26日 上午8:14:32
 * 论坛帖子回复Service.
 */
@Service
@Transactional
public class ForumReplyService {

	@Autowired
	private ForumReplyDAO forumReplyDAO; 
	
	public void save(ForumReply forumReply) throws Exception {
		forumReplyDAO.save(forumReply);
	}
	
	public void update(ForumReply forumReply) throws Exception {
		forumReplyDAO.update(forumReply);
	}
	
	public ForumReply get(Integer id) throws Exception {
		return forumReplyDAO.get(id);
	}
	
	public void delete(Integer id) throws Exception {
		forumReplyDAO.delete(id);
	}
	
	public int countForumReplyByCondition(ForumReply forumReply) throws Exception {
		return forumReplyDAO.countForumReplyByCondition(forumReply);
	}
	
	public List<Object[]> findForumReplyByIDForPage(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return forumReplyDAO.findForumReplyByIDForPage(id, startRow, fetchSize);
	}
	
	public List<Object[]> findForumReplyBySQL(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return forumReplyDAO.findForumReplyBySQL(id, startRow, fetchSize);
	}
	
	public List<Object[]> getTenData() throws Exception {
		return forumReplyDAO.getTenData();
	}
	
}
