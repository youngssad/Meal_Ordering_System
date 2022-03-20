package com.example.meal_ordering_system.dao;

import com.example.meal_ordering_system.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface AdminDao {


    Admin queryByName(String name);

    List<Admin> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    List<Admin> queryAll(Admin admin);


    int insert(Admin admin);


    int update(Admin admin);

    int deleteById(Integer id);

}