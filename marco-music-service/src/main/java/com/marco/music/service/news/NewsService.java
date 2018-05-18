package com.marco.music.service.news;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marco.music.dao.news.NewsDAO;
import com.marco.music.model.news.News;

/**
 * @author Marco
 * @date 2017年6月1日 上午10:27:01
 * 资讯Service.
 */
@Service
@Transactional
public class NewsService {

	@Autowired
	private NewsDAO newsDAO;
	
	public void save(News news) throws Exception {
		newsDAO.save(news);
	}
	
	public void update(News news) throws Exception {
		newsDAO.update(news);
	}

	public News get(Integer id) throws Exception {
		return newsDAO.get(id);
	}
	
	public void delete(Integer id) throws Exception {
		newsDAO.delete(id);
	}
	
	public int countNewsByCondition(News news) throws Exception {
		return newsDAO.countNewsByCondition(news);
	}
	
	public List<News> searchNewsByCondition(News news, Integer startRow, Integer fetchSize) throws Exception {
		return newsDAO.searchNewsByCondition(news, startRow, fetchSize);
	}
	
	public List<Object[]> findNewsReplyBySQL(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return newsDAO.findNewsReplyBySQL(id, startRow, fetchSize);
	}
	
	public List<Object[]> getTenData() throws Exception {
		return newsDAO.getTenData();
	}
	
}
