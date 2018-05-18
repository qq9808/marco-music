package com.marco.music.dao.feedback;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.marco.music.common.fatherDAO.FatherDAO;
import com.marco.music.model.feedback.Feedback;

/**
 * @author Marco
 * @date 2017年7月27日 上午10:50:22
 * 留言DAO.
 */
@Repository
public class FeedbackDAO extends FatherDAO {

	@Override
	protected Class<?> getModelClass() {
		return Feedback.class;
	}
	
	public void save(Feedback feedback) {
		super.save(feedback);
	}
	
	public void update(Feedback feedback) {
		super.update(feedback);
	}
	
	public Feedback get(Integer id) {
		return (Feedback)super.get(getModelClass(), id);
	}
	
	public void delete(Integer id) {
		super.deleteById(getModelClass(), id);
	}
	
	public int countFeedbackByCondition(Feedback feedback) {
		return super.count(feedback);
	}
	
	//收到的留言
	public List<Object[]> findFeedbackBySQL1(Integer id, Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id AS feedbackID,a.level,a.content,a.createtime,b.id AS userID,b.nickname,b.txImg,c.userID AS userID2,c.nickname AS nickname2,c.content AS content2 FROM (feedback a, user b) LEFT JOIN (SELECT x.id AS feedbackID,x.content,y.id AS userID,y.nickname FROM feedback x, user y WHERE x.say_userid = y.id) c ON (a.reply_id = c.feedbackID) WHERE a.say_userid = b.id AND a.read_userid = ? order by a.createtime desc ";
		List<Object> values = new ArrayList<Object>();
		values.add(id);		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}
	
	//发送的留言
	public List<Object[]> findFeedbackBySQL2(Integer id, Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id AS feedbackID,a.level,a.content,a.createtime,b.id AS userID,b.nickname,b.txImg,c.userID AS userID2,c.nickname AS nickname2,c.content AS content2 FROM (feedback a, user b) LEFT JOIN (SELECT x.id AS feedbackID,x.content,y.id AS userID,y.nickname FROM feedback x, user y WHERE x.say_userid = y.id) c ON (a.reply_id = c.feedbackID) WHERE a.read_userid = b.id AND a.say_userid = ? order by a.createtime desc ";
		List<Object> values = new ArrayList<Object>();
		values.add(id);		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}

}
