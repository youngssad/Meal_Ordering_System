package com.example.meal_ordering_system.dao;

import com.example.meal_ordering_system.entity.Orders;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ordersDao")
public interface OrdersDao {


    List<Orders> pageList(int a,int b);

    int pageCount();

    List<Orders> pageListByID(int id);

    List<Orders> pageListByDate(String times1,String times2);

    List<Orders> pageListByMenue(String name);

    int updatedeliveryById(Integer id);

    int deleteById(Integer id);

    List<Orders> pageListByDelivery(Integer delivery);


    int insert(Orders orders);
}