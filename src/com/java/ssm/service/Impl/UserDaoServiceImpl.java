package com.java.ssm.service.Impl;

import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.ssm.dao.UserDao;
import com.java.ssm.entity.User;
import com.java.ssm.service.UserDaoService;
@Service
public class UserDaoServiceImpl implements UserDaoService {
	@Autowired
    private UserDao userDao;

	@Override
	public int insertUserService(User user) {
		// TODO Auto-generated method stub
		return userDao.insertUser(user);
	}

	@Override
	public User selectUserService(Integer id) {
		// TODO Auto-generated method stub
		return userDao.selectUser(id);
	}

	@Override
	public User selectCurUserService() {
		// TODO Auto-generated method stub
		return userDao.selectCurUser();
	}

	@Override
	public List<User> selectAllUserService() {
		// TODO Auto-generated method stub
		return userDao.selectAllUser();
	}

	@Override
	public int deleteUser(Integer id) {
		// TODO Auto-generated method stub
		return userDao.deleteUser(id);
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

}
