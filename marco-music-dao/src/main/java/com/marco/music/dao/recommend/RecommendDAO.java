package com.marco.music.dao.recommend;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.marco.music.common.fatherDAO.FatherDAO;
import com.marco.music.model.recommend.Recommend;

/**
 * @author Marco
 * @date 2017年8月24日 上午9:58:56
 * 荐读DAO.
 */
@Repository
public class RecommendDAO extends FatherDAO {

	@Override
	protected Class<?> getModelClass() {
		return Recommend.class;
	}
	
	public void save(Recommend recommend) {
		super.save(recommend);
	}
	
	public void update(Recommend recommend) {
		super.update(recommend);
	}
	
	public Recommend get(Integer id) {
		return (Recommend)super.get(getModelClass(), id);
	}
	
	public void delete(Integer id) {
		super.deleteById(getModelClass(), id);
	}
	
	public int countRecommendByCondition(Recommend recommend) {
		return super.count(recommend);
	}
	
	public List<Recommend> searchRecommendByCondition(Recommend recommend, Integer startRow, Integer fetchSize) {
		List<Order> orders = new ArrayList<Order>();
		orders.add(Order.desc("createTime"));
		return super.serach(recommend, orders, startRow, fetchSize);
	}
	
	public List<Object[]> findRecommendReplyBySQL(Integer id, Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id AS replyID,a.level,a.content,a.createtime,b.id AS userID,b.nickname,b.txImg,c.userID AS userID2,c.nickname AS nickname2,c.content AS content2 FROM (article_recommend_reply a, user b) LEFT JOIN (SELECT x.id AS replyID,x.content,y.id AS userID,y.nickname FROM article_recommend_reply x, user y WHERE x.userid = y.id) c ON (a.reply_id = c.replyID) WHERE a.userid = b.id AND a.recommend_id = ? order by a.createtime asc ";		
		List<Object> values = new ArrayList<Object>();
		values.add(id);		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}
	
	public List<Object[]> getTenData() {
		
		String sql = " SELECT a.id AS recommendID,a.title,a.createtime,COUNT(b.id) AS replyNum FROM article_recommend a LEFT JOIN article_recommend_reply b ON (b.recommend_id = a.id) GROUP BY recommendID ORDER BY a.createtime DESC ";
		List<Object> values = new ArrayList<Object>();
		List<Object[]> list = super.findListBySqlForPage(sql, values, 0, 10);
		return list;
	}
}
