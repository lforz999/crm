package com.bus.service;

import com.bus.entity.User;
import com.bus.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
@Transactional
public class UserServiceImp implements UserService{
    @Autowired
    UserMapper um;


    @Override
    public int insert(User user) {
        return um.insertSelective(user);
    }

    @Override
    public User findUserByLogin(User user) {
        Example example = new Example(User.class);
        Example.Criteria c = example.createCriteria();
        c.andEqualTo("user_name",user.getUserName());
        c.andEqualTo("user_password",user.getUserPassword());
        return um.selectOneByExample(example);
    }

    @Override
    public List<User> findAllUser() {
        return um.selectAllUsers();
    }

    @Override
    public User selectByPrimaryKey(int id) {
        return um.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(User user) {
        return um.updateByPrimaryKeySelective(user);
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return um.deleteByPrimaryKey(id);
    }

    @Override
    public List<User> findUsersByCondition(User user) {
        return um.findUsersByCondition(user);
    }

    @Override
    public List<User> findAllUsersByCondition(User user) {
        return um.findAllUsersByCondition(user);
    }
}
