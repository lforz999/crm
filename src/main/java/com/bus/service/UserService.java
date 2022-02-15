package com.bus.service;

import com.bus.entity.User;

import java.util.List;

public interface UserService {

    int insert(User user);

    User findUserByLogin(User user);

    List<User> findAllUser();

    User selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(User user);

    int deleteByPrimaryKey(int id);

    List<User> findUsersByCondition(User user);

    List<User> findAllUsersByCondition(User user);
}
