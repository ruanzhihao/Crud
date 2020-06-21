package com.java.ssm.dao;


import java.util.List;

import com.java.ssm.entity.User;

public interface UserDao {
public int insertUser(User user);
public User selectCurUser();
public User selectUser(Integer id);
public List<User> selectAllUser();
public int deleteUser(Integer id);
public int updateUser(User user);
}
