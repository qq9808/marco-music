package com.marco.music.dao.recommend;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.marco.music.common.fatherDAO.FatherDAO;
import com.marco.music.model.recommend.RecommendReply;

/**
 * @author Marco
 * @date 2017年8月24日 上午10:27:32
 * 荐读回复DAO.
 */
@Repository
public class RecommendReplyDAO extends FatherDAO {

	@Override
	protected Class<?> getModelClass() {
		return RecommendReply.class;
	}
	
	public void save(RecommendReply recommendReply) {
		super.save(recommendReply);
	}
	
	public void update(RecommendReply recommendReply) {
		super.update(recommendReply);
	}
	
	public RecommendReply get(Integer id) {
		return (RecommendReply)super.get(getModelClass(), id);
	}
	
	public void delete(Integer id) {
		super.deleteById(getModelClass(), id);
	}
	
	public int countRecommendReplyByCondition(RecommendReply recommendReply) {
		return super.count(recommendReply);
	}
	
	public List<Object[]> findRecommendReplyByIDForPage(Integer id, Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id,a.level,a.userid,a.nickname,a.content,a.createtime,b.userid AS userid1,b.nickname AS nickname1,b.content AS content1 FROM article_recommend_reply a LEFT JOIN (SELECT id,userid,nickname,content FROM article_recommend_reply) b ON (a.recommend_id = b.id) WHERE a.recommend_id = ? order by a.createtime asc ";		
		List<Object> values = new ArrayList<Object>();
		values.add(id);		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}
	
	public List<Object[]> findRecommendReplyBySQL(Integer id, Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id AS replyID,a.level,a.content,a.createtime,b.id AS userID,b.nickname,b.txImg,c.userID AS userID2,c.nickname AS nickname2,c.content AS content2 FROM (article_recommend_reply a, user b) LEFT JOIN (SELECT x.id AS replyID,x.content,y.id AS userID,y.nickname FROM article_recommend_reply x, user y WHERE x.userid = y.id) c ON (a.reply_id = c.replyID) WHERE a.userid = b.id AND a.recommend_id = ? order by a.createtime asc ";		
		List<Object> values = new ArrayList<Object>();
		values.add(id);		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}

}
