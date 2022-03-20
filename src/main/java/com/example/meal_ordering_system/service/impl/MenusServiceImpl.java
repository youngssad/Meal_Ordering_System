package com.example.meal_ordering_system.service.impl;

import com.example.meal_ordering_system.dao.MenusDao;
import com.example.meal_ordering_system.entity.Menus;
import com.example.meal_ordering_system.service.MenusService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("menusService")
public class MenusServiceImpl implements MenusService {
    @Resource
    @Qualifier
    private MenusDao menusDao;


    @Override
    public Menus queryById(Object id) {
        return this.menusDao.queryById(id);
    }



    public List<Menus> queryAll( ){
        return  this.menusDao.queryAll();
    };


    @Override
    public List<Menus> queryAllByLimit(int offset, int limit) {
        return this.menusDao.queryAllByLimit(offset, limit);
    }


    @Override
    public Menus insert(Menus menus) {
        this.menusDao.insert(menus);
        return menus;
    }

    @Override
    public Menus update(Menus menus) {
        this.menusDao.update(menus);
        return this.queryById(menus.getId());
    }

    @Override
    public boolean deleteById(Object id) {
        return this.menusDao.deleteById(id) > 0;
    }
}