package com.example.meal_ordering_system.dao;

import com.example.meal_ordering_system.entity.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("usersDao")
public interface UsersDao {


    Users queryOne(@Param("name") String name, @Param("pwd") String pwd);


    Users queryById(Integer id);


    int insert(Users user);

    int update(Users users);

    int deleteById(Integer id);

   int queryByname(String name);

}