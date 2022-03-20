package com.example.meal_ordering_system.service;

import com.example.meal_ordering_system.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersService {


    boolean login(@Param("name") String name, @Param("pwd") String pwd);

    Users queryById(Integer id);

    int insert(Users user);

    Users update(Users users);


    boolean deleteById(Integer id);

    int queryByname(String name);

}