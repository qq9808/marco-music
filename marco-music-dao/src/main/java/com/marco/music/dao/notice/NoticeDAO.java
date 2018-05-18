package com.marco.music.dao.notice;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.marco.music.common.fatherDAO.FatherDAO;
import com.marco.music.model.notice.Notice;

/**
 * @author Marco
 * @date 2017年7月30日 下午2:05:59
 * 新的动态DAO.
 */
@Repository
public class NoticeDAO extends FatherDAO {

	@Override
	protected Class<?> getModelClass() {
		return Notice.class;
	}
	
	public void save(Notice notice) {
		super.save(notice);
	}
	
	public void update(Notice notice) {
		super.update(notice);
	}
	
	public Notice get(Integer id) {
		return (Notice)super.get(getModelClass(), id);
	}
	
	public void delete(Integer id) {
		super.deleteById(getModelClass(), id);
	}
	
	public List<Notice> findNoticeByUserid(Integer userid) {
		String hql = " from Notice where know = 0 and userID = ? ";
		List<Object> values = new ArrayList<Object>();		
		values.add(userid);
		return super.findByHQL(hql, values); 
	}
	
	public List<Object[]> findNoticeBySQL(Integer userid) {		
		String sql = " SELECT a.id,a.type,a.event_id,a.event_name,b.nickname FROM (notice a, user b) WHERE a.person_id = b.id AND a.know = 0 AND a.userid = ? order by a.createtime desc ";
		List<Object> values = new ArrayList<Object>();
		values.add(userid);
		List<Object[]> list = super.findListBySql(sql, values);		
		return list;		
	}
	
	public List<Object[]> findKnowBySQL(Integer userid) {		
		String sql = " SELECT a.id,a.type,a.event_id,a.event_name,b.nickname FROM (notice a, user b) WHERE a.person_id = b.id AND a.know = 1 AND a.userid = ? order by a.createtime desc ";
		List<Object> values = new ArrayList<Object>();
		values.add(userid);
		List<Object[]> list = super.findListBySql(sql, values);		
		return list;		
	}
	
	public void ignore(Integer userID) {
		String sql = " UPDATE notice SET know = 1 WHERE userid = ? ";
		List<Object> values = new ArrayList<Object>();
		values.add(userID);
		super.updateBySql(sql, values);
	}
	
}
