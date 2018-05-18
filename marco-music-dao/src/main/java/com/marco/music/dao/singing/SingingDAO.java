package com.marco.music.dao.singing;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.marco.music.common.fatherDAO.FatherDAO;
import com.marco.music.model.singing.Singing;

/**
 * @author Marco
 * @date 2017年6月3日 上午1:02:26
 * 原创&翻唱DAO.
 */
@Repository
public class SingingDAO extends FatherDAO {

	@Override
	protected Class<?> getModelClass() {
		return Singing.class;
	}
	
	public void save(Singing singing) {
		super.save(singing);
	}

	public void update(Singing singing) {
		super.update(singing);
	}
	
	public Singing get(Integer id) {
		return (Singing)super.get(getModelClass(), id);
	}
	
	public void delete(Integer id) {
		super.deleteById(getModelClass(), id);
	}

	public int countSingingByCondition(Singing singing) {
		return super.count(singing);
	}
	
	public List<Singing> searchSingingByCondition(Singing singing, Integer startRow, Integer fetchSize) {
		List<Order> orders = new ArrayList<Order>();
		orders.add(Order.desc("createTime"));
		return super.serach(singing, orders, startRow, fetchSize);
	}

	public List<Object[]> searchSingingBySQL(Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id AS singingID,a.title,a.content,a.createtime,b.id,b.nickname,b.txImg,COUNT(c.id) AS replyNum FROM (article_singing a, user b) LEFT JOIN article_singing_reply c ON (c.singing_id = a.id) WHERE a.userid = b.id GROUP BY singingID ORDER BY a.createtime DESC ";
		List<Object> values = new ArrayList<Object>();
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}
	
	public Object[] getSinging(Integer id) {
		String sql = " SELECT a.id AS singingID,a.title,a.content,a.createtime,b.id,b.nickname,b.txImg,a.video_id,a.video_url,a.video_name,a.type FROM article_singing a LEFT JOIN user b ON (a.userid = b.id) WHERE a.id = ? ";
		List<Object> values = new ArrayList<Object>();	
		values.add(id);
		List<Object[]> list = super.findListBySql(sql, values);			
		if(list != null) {
			return list.get(0);
		}
		return null;
	}
	
	public List<Singing> findSingingByUserID(Integer id) {
		String hql = " from Singing where userID = ? ";
		List<Object> values = new ArrayList<Object>();		
		values.add(id);
		return super.findByHQL(hql, values); 
	}
	
	public List<Object[]> getTenData() {
		
		String sql = " SELECT a.id AS singingID,a.title,a.createtime,b.nickname,COUNT(c.id) AS replyNum FROM (article_singing a, user b) LEFT JOIN article_singing_reply c ON (c.singing_id = a.id) WHERE a.userid = b.id GROUP BY singingID ORDER BY a.createtime DESC ";
		List<Object> values = new ArrayList<Object>();
		List<Object[]> list = super.findListBySqlForPage(sql, values, 0, 10);
		return list;
	}
	
}
