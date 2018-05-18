package com.marco.music.service.feedback;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marco.music.dao.feedback.FeedbackDAO;
import com.marco.music.model.feedback.Feedback;

/**
 * @author Marco
 * @date 2017年7月27日 上午10:57:06
 * 留言Service.
 */
@Service
@Transactional
public class FeedbackService {

	@Autowired
	private FeedbackDAO feedbackDAO;
	
	public void save(Feedback feedback) throws Exception {
		feedbackDAO.save(feedback);
	}
	
	public void update(Feedback feedback) throws Exception {
		feedbackDAO.update(feedback);
	}
	
	public Feedback get(Integer id) throws Exception {
		return feedbackDAO.get(id);
	}
	
	public void delete(Integer id) throws Exception {
		feedbackDAO.delete(id);
	}
	
	public int countFeedbackByCondition(Feedback feedback) throws Exception {
		return feedbackDAO.countFeedbackByCondition(feedback);
	}
	
	public List<Object[]> findFeedbackBySQL1(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return feedbackDAO.findFeedbackBySQL1(id, startRow, fetchSize);
	}
	
	public List<Object[]> findFeedbackBySQL2(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return feedbackDAO.findFeedbackBySQL2(id, startRow, fetchSize);
	}
	
}
