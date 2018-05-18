package com.marco.music.dao.forum;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.marco.music.common.fatherDAO.FatherDAO;
import com.marco.music.model.forum.ForumReply;

/**
 * @author Marco
 * @date 2017年5月26日 上午8:09:23
 * 论坛回复DAO.
 */
@Repository
public class ForumReplyDAO extends FatherDAO {

	@Override
	protected Class<?> getModelClass() {
		return ForumReply.class;
	}
	
	public void save(ForumReply forumReply) {
		super.save(forumReply);
	}
	
	public void update(ForumReply forumReply) {
		super.update(forumReply);
	}
	
	public ForumReply get(Integer id) {
		return (ForumReply)super.get(getModelClass(), id);
	}

	public void delete(Integer id) {
		super.deleteById(getModelClass(), id);
	}
	
	public int countForumReplyByCondition(ForumReply forumReply) {
		return super.count(forumReply);
	}
	
	public List<Object[]> findForumReplyByIDForPage(Integer id, Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id,a.level,a.userid,a.nickname,a.content,a.createtime,b.userid AS userid1,b.nickname AS nickname1,b.content AS content1 FROM article_forum_reply a LEFT JOIN (SELECT id,userid,nickname,content FROM article_forum_reply) b ON (a.reply_id = b.id) WHERE a.forum_id = ? order by a.createtime asc ";		
		List<Object> values = new ArrayList<Object>();
		values.add(id);		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}
	
	public List<Object[]> findForumReplyBySQL(Integer id, Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id AS replyID,a.level,a.content,a.createtime,b.id AS userID,b.nickname,b.txImg,c.userID AS userID2,c.nickname AS nickname2,c.content AS content2 FROM (article_forum_reply a, user b) LEFT JOIN (SELECT x.id AS replyID,x.content,y.id AS userID,y.nickname FROM article_forum_reply x, user y WHERE x.userid = y.id) c ON (a.reply_id = c.replyID) WHERE a.userid = b.id AND a.forum_id = ? order by a.createtime asc ";		
		List<Object> values = new ArrayList<Object>();
		values.add(id);		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}
	
	public List<Object[]> getTenData() {
		
		String sql = " SELECT a.id AS forumID,a.title,a.createtime,b.nickname,COUNT(c.id) AS replyNum FROM (article_forum a, user b) LEFT JOIN article_forum_reply c ON (c.forum_id = a.id) WHERE a.userid = b.id GROUP BY forumID ORDER BY a.createtime DESC ";
		List<Object> values = new ArrayList<Object>();
		List<Object[]> list = super.findListBySqlForPage(sql, values, 0, 10);
		return list;
	}
	
}
