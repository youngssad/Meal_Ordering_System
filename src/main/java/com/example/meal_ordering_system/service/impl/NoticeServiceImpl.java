package com.example.meal_ordering_system.service.impl;

import com.example.meal_ordering_system.dao.NoticeDao;
import com.example.meal_ordering_system.entity.Notice;
import com.example.meal_ordering_system.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    @Qualifier("noticeDao")
    private NoticeDao noticeDao;


    @Override
    public Notice queryById(Integer id) {
        return this.noticeDao.queryById(id);
    }

    @Override
    public List<Notice> queryAll() {
        return this.noticeDao.queryAll();
    }

    @Override
    public Notice insert(Notice notice) {
        this.noticeDao.insert(notice);
        return notice;
    }


    @Override
    public Notice update(Notice notice) {
        this.noticeDao.update(notice);
        return this.queryById(notice.getId());
    }


    @Override
    public boolean delete(Integer id) {
        return this.noticeDao.delete(id) > 0;
    }
}