package com.marco.music.service.singing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marco.music.dao.singing.SingingReplyDAO;
import com.marco.music.model.singing.SingingReply;

/**
 * @author Marco
 * @date 2017年6月3日 上午1:38:45
 * 原创&翻唱回复Service.
 */
@Service
@Transactional
public class SingingReplyService {

	@Autowired
	private SingingReplyDAO singingReplyDAO;
	
	public void save(SingingReply singingReply) throws Exception {
		singingReplyDAO.save(singingReply);
	}
	
	public void update(SingingReply singingReply) throws Exception {
		singingReplyDAO.update(singingReply);
	}
	
	public SingingReply get(Integer id) throws Exception {
		return singingReplyDAO.get(id);
	}
	
	public void delete(Integer id) throws Exception {
		singingReplyDAO.delete(id);
	}
	
	public int countSingingReplyByCondition(SingingReply singingReply) throws Exception {
		return singingReplyDAO.countSingingReplyByCondition(singingReply);
	}
	
	public List<Object[]> findSingingReplyByIDForPage(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return singingReplyDAO.findSingingReplyByIDForPage(id, startRow, fetchSize);
	}
	
	public List<Object[]> findSingingReplyBySQL(Integer id, Integer startRow, Integer fetchSize) throws Exception {
		return singingReplyDAO.findSingingReplyBySQL(id, startRow, fetchSize);
	}
}
