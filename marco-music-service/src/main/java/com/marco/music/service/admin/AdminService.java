package com.marco.music.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.marco.music.dao.admin.AdminDAO;
import com.marco.music.model.admin.Admin;

/**
 * @author Marco
 * @date 2017年6月1日 上午8:37:03
 * 管理员Service.
 */
@Service
@Transactional
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	public void save(Admin admin) throws Exception {
		adminDAO.save(admin);
	}
	
	public void update(Admin admin) throws Exception {
		adminDAO.update(admin);
	}
	
	public Admin get(Integer id) throws Exception {
		return adminDAO.get(id);
	}
	
	public void delete(Integer id) throws Exception {
		adminDAO.delete(id);
	}
	
	public List<Admin> findAdminByAccount(String account) throws Exception {
		return adminDAO.findAdminByAccount(account);
	}
	
}
