package com.java.ssm.service;

import java.util.List;

import com.java.ssm.entity.User;

public interface UserDaoService {
public int insertUserService(User user);
public User selectCurUserService();
public User selectUserService(Integer id);
public List<User> selectAllUserService();
public int deleteUser(Integer id);
public int updateUser(User user);
}
