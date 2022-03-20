package com.example.meal_ordering_system.dao;

import com.example.meal_ordering_system.entity.Menus;
import com.example.meal_ordering_system.entity.Page;
import org.apache.ibatis.annotations.Param;



import java.util.List;


public interface MenusDao {

    Menus queryById(Object id);

    List<Menus> selectAll(Page page);

     long selectCount();


    List<Menus> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    List<Menus> queryAll( );


    int insert(Menus menus);




    int update(Menus menus);


    int deleteById(Object id);

}