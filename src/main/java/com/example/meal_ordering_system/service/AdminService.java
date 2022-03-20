package com.example.meal_ordering_system.service;

import com.example.meal_ordering_system.entity.Admin;
import com.example.meal_ordering_system.entity.Types;

import java.util.List;

public interface AdminService {


     Admin queryByName(String name) ;

     boolean login(String name,String pwd);

    List<Admin> queryAllByLimit(int offset, int limit);

    Admin insert(Admin admin);

    int update(Admin admin);


    boolean deleteById(Integer id);

}