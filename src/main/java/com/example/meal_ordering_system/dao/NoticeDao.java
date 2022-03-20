package com.example.meal_ordering_system.dao;

import com.example.meal_ordering_system.entity.Notice;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;


@Repository("noticeDao")
public interface NoticeDao {


    Notice queryById(Integer id);


    List<Notice> queryAll();


    int insert(Notice notice);


    int insertBatch(@Param("entities") List<Notice> entities);


    int insertOrUpdateBatch(@Param("entities") List<Notice> entities);

    int update(Notice notice);


    int delete(Integer id);

}