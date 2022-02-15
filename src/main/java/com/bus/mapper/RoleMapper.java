package com.bus.mapper;

import com.bus.entity.Role;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface RoleMapper extends Mapper<Role> {
    String selectRoleById(Integer id);

    List<String> selectRoleByName(String name);

    List<Role> findRoleByCondition(Role r);
}