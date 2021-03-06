package com.marco.music.service.recommend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marco.music.dao.recommend.RecommendDAO;
import com.marco.music.model.recommend.Recommend;

/**
 * @author Marco
 * @date 2017年8月24日 上午10:16:49
 * 荐读service.
 */
@Service
@Transactional
public class RecommendService {

	@Autowired
	private RecommendDAO recommendDAO;
	
	public void save(Recommend recommend) throws Exception {
		recommendDAO.save(recommend);
	}
	
	public void update(Recommend recommend) throws Exception {
		recommendDAO.update(recommend);
	}
	
	public Recommend get(Integer id) throws Exception {
		return recommendDAO.get(id);
	}
	
	public void delete(Integer id) throws Exception {
		recommendDAO.delete(id);
	}

	public int countRecommendByCondition(Recommend recommend) throws Exception {
		return recommendDAO.countRecommendByCondition(recommend);
	}
	
	public List<Recommend> searchRecommendByCondition(Recommend recommend, Integer startRow, Integer fetchSize) throws Exception {
		return recommendDAO.searchRecommendByCondition(recommend, startRow, fetchSize);
	}
	
	public List<Object[]> findRecommendReplyBySQL(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return recommendDAO.findRecommendReplyBySQL(id, startRow, fetchSize);
	}
	
	public List<Object[]> getTenData() throws Exception {
		return recommendDAO.getTenData();
	}
	
}
