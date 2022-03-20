package com.example.meal_ordering_system.service;

import com.example.meal_ordering_system.entity.Menus;

import java.util.List;


public interface MenusService {


    Menus queryById(Object id);


    List<Menus> queryAll();


    List<Menus> queryAllByLimit(int offset, int limit);


    Menus insert(Menus menus);


    Menus update(Menus menus);


    boolean deleteById(Object id);

}