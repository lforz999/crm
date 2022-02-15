package com.bus.mapper;

import com.bus.entity.User;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface UserMapper extends Mapper<User> {
    String selectPasswordByName(String name);

    int selectIdByName(String name);

    List<User> selectAllUsers();

    List<User> findUsersByCondition(User user);

    List<User> findAllUsersByCondition(User user);
}
