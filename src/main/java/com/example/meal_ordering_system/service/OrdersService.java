package com.example.meal_ordering_system.service;

import com.example.meal_ordering_system.entity.Orders;

import java.util.List;


public interface OrdersService {

    List<Orders> pageList(int a,int b);

    int pageCount();

    int updatedeliveryById(Integer id);

    int deleteById(Integer id);

    List<Orders> pageListByID(int id);

    List<Orders> pageListByDate(String times1,String times2);

    List<Orders> pageListByMenue(String name);


    List<Orders> pageListByDelivery(Integer delivery);

    int insert(Orders orders);
}