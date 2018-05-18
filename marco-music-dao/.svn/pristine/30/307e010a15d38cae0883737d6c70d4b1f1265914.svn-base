package com.marco.music.dao.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.marco.music.common.fatherDAO.FatherDAO;
import com.marco.music.model.user.User;

/**
 * @author Marco
 * @date 2017年5月21日 下午10:24:05
 * 用户DAO.
 */
@Repository
public class UserDAO extends FatherDAO {

	@Override
	protected Class<?> getModelClass() {
		return User.class;
	}

	public void save(User user) {
		super.save(user);
	}
	
	public void update(User user) {
		super.update(user);
	}
	
	public User get(Integer id) {
		return (User)super.get(getModelClass(), id);
	}

	public void delete(Integer id) {
		super.deleteById(getModelClass(), id);
	}
	
	public List<User> findUserByAccount(String account) {
		String hql = " from User where account = ? ";
		List<Object> values = new ArrayList<Object>();		
		values.add(account);
		return super.findByHQL(hql, values); 
	}
	
	public List<User> findUserByEmail(String email) {
		String hql = " from User where email = ? ";
		List<Object> values = new ArrayList<Object>();		
		values.add(email);
		return super.findByHQL(hql, values); 
	}
	
}
