package com.marco.music.dao.news;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.marco.music.common.fatherDAO.FatherDAO;
import com.marco.music.model.news.NewsReply;

/**
 * @author Marco
 * @date 2017年8月20日 下午3:14:01
 * 资讯回复DAO.
 */
@Repository
public class NewsReplyDAO extends FatherDAO {

	@Override
	protected Class<?> getModelClass() {
		return NewsReply.class;
	}
	
	public void save(NewsReply newsReply) {
		super.save(newsReply);
	}
	
	public void update(NewsReply newsReply) {
		super.update(newsReply);
	}
	
	public NewsReply get(Integer id) {
		return (NewsReply)super.get(getModelClass(), id);
	}

	public void delete(Integer id) {
		super.deleteById(getModelClass(), id);
	}
	
	public int countNewsReplyByCondition(NewsReply newsReply) {
		return super.count(newsReply);
	}
	
	public List<Object[]> findNewsReplyByIDForPage(Integer id, Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id,a.level,a.userid,a.nickname,a.content,a.createtime,b.userid AS userid1,b.nickname AS nickname1,b.content AS content1 FROM article_news_reply a LEFT JOIN (SELECT id,userid,nickname,content FROM article_news_reply) b ON (a.news_id = b.id) WHERE a.news_id = ? order by a.createtime asc ";		
		List<Object> values = new ArrayList<Object>();
		values.add(id);		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}
	
	public List<Object[]> findNewsReplyBySQL(Integer id, Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id AS replyID,a.level,a.content,a.createtime,b.id AS userID,b.nickname,b.txImg,c.userID AS userID2,c.nickname AS nickname2,c.content AS content2 FROM (article_news_reply a, user b) LEFT JOIN (SELECT x.id AS replyID,x.content,y.id AS userID,y.nickname FROM article_news_reply x, user y WHERE x.userid = y.id) c ON (a.reply_id = c.replyID) WHERE a.userid = b.id AND a.news_id = ? order by a.createtime asc ";		
		List<Object> values = new ArrayList<Object>();
		values.add(id);		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}

}
