package com.marco.music.dao.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.marco.music.common.fatherDAO.FatherDAO;
import com.marco.music.model.admin.Admin;

/**
 * @author Marco
 * @date 2017年6月1日 上午8:30:22
 * 管理员DAO.
 */
@Repository
public class AdminDAO extends FatherDAO {

	@Override
	protected Class<?> getModelClass() {
		return Admin.class;
	}

	public void save(Admin admin) {
		super.save(admin);
	}
	
	public void update(Admin admin) {
		super.update(admin);
	}
	
	public Admin get(Integer id) {
		return (Admin)super.get(getModelClass(), id);
	}
	
	public void delete(Integer id) {
		super.deleteById(getModelClass(), id);
	}
	
	public List<Admin> findAdminByAccount(String account) {
		String hql = " from Admin where account = ? ";
		List<Object> values = new ArrayList<Object>();		
		values.add(account);
		return super.findByHQL(hql, values); 
	}
	
}
