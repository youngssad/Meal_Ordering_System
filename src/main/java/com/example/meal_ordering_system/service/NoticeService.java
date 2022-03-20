package com.example.meal_ordering_system.service;

import com.example.meal_ordering_system.entity.Notice;

import java.util.List;


public interface NoticeService {


    Notice queryById(Integer id);

    List<Notice> queryAll();


    Notice insert(Notice notice);


    Notice update(Notice notice);


    boolean delete(Integer id);

}