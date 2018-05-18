package com.marco.music.service.news;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marco.music.dao.news.NewsReplyDAO;
import com.marco.music.model.news.NewsReply;

/**
 * @author Marco
 * @date 2017年8月20日 下午3:20:24
 * 资讯帖子回复Service.
 */
@Service
@Transactional
public class NewsReplyService {

	@Autowired
	private NewsReplyDAO newsReplyDAO;
	
	public void save(NewsReply newsReply) throws Exception {
		newsReplyDAO.save(newsReply);
	}
	
	public void update(NewsReply newsReply) throws Exception {
		newsReplyDAO.update(newsReply);
	}
	
	public NewsReply get(Integer id) throws Exception {
		return newsReplyDAO.get(id);
	}
	
	public void delete(Integer id) throws Exception {
		newsReplyDAO.delete(id);
	}
	
	public int countNewsReplyByCondition(NewsReply newsReply) throws Exception {
		return newsReplyDAO.countNewsReplyByCondition(newsReply);
	}
	
	public List<Object[]> findNewsReplyByIDForPage(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return newsReplyDAO.findNewsReplyByIDForPage(id, startRow, fetchSize);
	}
	
	public List<Object[]> findNewsReplyBySQL(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return newsReplyDAO.findNewsReplyBySQL(id, startRow, fetchSize);
	}
	
}
