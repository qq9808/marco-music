package com.marco.music.dao.singing;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.marco.music.common.fatherDAO.FatherDAO;
import com.marco.music.model.singing.SingingReply;

/**
 * @author Marco
 * @date 2017年6月3日 上午1:27:02
 * 原创&翻唱回复DAO.
 */
@Repository
public class SingingReplyDAO extends FatherDAO {

	@Override
	protected Class<?> getModelClass() {
		return SingingReply.class;
	}
	
	public void save(SingingReply singingReply) {
		super.save(singingReply);
	}
	
	public void update(SingingReply singingReply) {
		super.update(singingReply);
	}
	
	public SingingReply get(Integer id) {
		return (SingingReply)super.get(getModelClass(), id);
	}
	
	public void delete(Integer id) {
		super.deleteById(getModelClass(), id);
	}

	public int countSingingReplyByCondition(SingingReply singingReply) {
		return super.count(singingReply);
	}
	
	public List<Object[]> findSingingReplyByIDForPage(Integer id, Integer startRow, Integer fetchSize) {
				
		String sql = " SELECT a.id,a.level,a.userid,a.nickname,a.content,a.createtime,b.userid AS userid1,b.nickname AS nickname1,b.content AS content1 FROM article_singing_reply a LEFT JOIN (SELECT id,userid,nickname,content FROM article_singing_reply) b ON (a.reply_id = b.id) WHERE a.singing_id = ? order by a.createtime asc ";
		
		List<Object> values = new ArrayList<Object>();
		values.add(id);
		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}
	
	public List<Object[]> findSingingReplyBySQL(Integer id, Integer startRow, Integer fetchSize) {
		
		String sql = " SELECT a.id AS replyID,a.level,a.content,a.createtime,b.id AS userID,b.nickname,b.txImg,c.userID AS userID2,c.nickname AS nickname2,c.content AS content2 FROM (article_singing_reply a, user b) LEFT JOIN (SELECT x.id AS replyID,x.content,y.id AS userID,y.nickname FROM article_singing_reply x, user y WHERE x.userid = y.id) c ON (a.reply_id = c.replyID) WHERE a.userid = b.id AND a.singing_id = ? order by a.createtime asc ";		
		List<Object> values = new ArrayList<Object>();
		values.add(id);		
		List<Object[]> list = super.findListBySqlForPage(sql, values, startRow, fetchSize);
		return list;
	}
}
