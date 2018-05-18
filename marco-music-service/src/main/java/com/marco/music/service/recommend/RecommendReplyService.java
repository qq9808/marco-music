package com.marco.music.service.recommend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marco.music.dao.recommend.RecommendReplyDAO;
import com.marco.music.model.recommend.RecommendReply;

/**
 * @author Marco
 * @date 2017年8月24日 上午10:39:55
 * 荐读回复Service.
 */
@Service
@Transactional
public class RecommendReplyService {

	@Autowired
	private RecommendReplyDAO recommendReplyDAO;
	
	public void save(RecommendReply recommendReply) throws Exception {
		recommendReplyDAO.save(recommendReply);
	}
	
	public void update(RecommendReply recommendReply) throws Exception {
		recommendReplyDAO.update(recommendReply);
	}
		
	public RecommendReply get(Integer id) throws Exception {
		return recommendReplyDAO.get(id);
	}
	
	public void delete(Integer id) throws Exception {
		recommendReplyDAO.delete(id);
	}
	
	public int countRecommendReplyByCondition(RecommendReply recommendReply) throws Exception {
		return recommendReplyDAO.countRecommendReplyByCondition(recommendReply);
	}
	
	public List<Object[]> findRecommendReplyByIDForPage(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return recommendReplyDAO.findRecommendReplyByIDForPage(id, startRow, fetchSize);
	}
	
	public List<Object[]> findRecommendReplyBySQL(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return recommendReplyDAO.findRecommendReplyBySQL(id, startRow, fetchSize);
	}
	
}
