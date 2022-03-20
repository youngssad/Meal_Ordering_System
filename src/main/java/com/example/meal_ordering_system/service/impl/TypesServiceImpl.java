package com.example.meal_ordering_system.service.impl;

import com.example.meal_ordering_system.dao.TypesDao;
import com.example.meal_ordering_system.entity.Types;
import com.example.meal_ordering_system.service.TypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import java.util.List;


@Service("typesService")
public class TypesServiceImpl implements TypesService {

    @Autowired
    @Qualifier("typesDao")
    private TypesDao typesDao;

    @Override
    public List<Types> queryAll() {
        return this.typesDao.queryAll();
    }


    @Override
    public int update(Types type) {
        typesDao.update(type);
        return 0;
    }


    @Override
    public int delete(int id) {
        return typesDao.delete(id);
    }


    @Override
    public Types queryById(int id) {
        return typesDao.queryById(id);
    }


    @Override
    public int insert(Types type) {
        return typesDao.insert(type);
    }

}