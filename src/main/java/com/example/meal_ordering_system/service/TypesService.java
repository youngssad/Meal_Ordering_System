package com.example.meal_ordering_system.service;

import com.example.meal_ordering_system.entity.Types;

import java.lang.reflect.Type;
import java.util.List;


public interface TypesService {


    List<Types> queryAll();


    int update(Types type);

    int delete(int id);


    Types queryById(int id);


    int insert(Types type);

}