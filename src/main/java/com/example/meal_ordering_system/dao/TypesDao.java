package com.example.meal_ordering_system.dao;

import com.example.meal_ordering_system.entity.Types;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface TypesDao {

    List<Types> queryAll();

    int update(Types type);


    int delete(int id);

    Types queryById(int id);

    int insert(Types types);
}