package com.example.meal_ordering_system.service.impl;

import com.example.meal_ordering_system.dao.UsersDao;
import com.example.meal_ordering_system.entity.Users;
import com.example.meal_ordering_system.service.UsersService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("usersService")
@Scope("prototype")
public class UsersServiceImpl implements UsersService {
    @Autowired
    @Qualifier("usersDao")
    private UsersDao usersDao;

    public boolean login(@Param("name") String name, @Param("pwd") String pwd){
        Users user= usersDao.queryOne(name,pwd);
        if(user==null)
            return false;
        else
            return true;
    }


    @Override
    public Users queryById(Integer id) {
        return this.usersDao.queryById(id);
    }



    @Override
    public int insert(Users user) {
        return this.usersDao.insert(user);
    }


    @Override
    public Users update(Users users) {
        this.usersDao.update(users);
        return this.queryById(users.getId());
    }


    @Override
    public boolean deleteById(Integer id) {
        return this.usersDao.deleteById(id) > 0;
    }

    @Override
    public  int queryByname(String name) {
        return this.usersDao.queryByname(name);
    }
}