package com.example.meal_ordering_system.service.impl;

import com.example.meal_ordering_system.dao.AdminDao;
import com.example.meal_ordering_system.entity.Admin;
import com.example.meal_ordering_system.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDao adminDao;


    @Override
    public Admin queryByName(String name) {
        return this.adminDao.queryByName(name);
    }


    @Override
    public List<Admin> queryAllByLimit(int offset, int limit) {
        return this.adminDao.queryAllByLimit(offset, limit);
    }

    @Override
    public Admin insert(Admin admin) {
        this.adminDao.insert(admin);
        return admin;
    }
    @Override
     public int update(Admin admin){
        this.adminDao.update(admin);
        return 0;
    };

    public boolean login(String name, String pwd) {
        Admin admin = adminDao.queryByName(name);
        if (admin != null) {
            if (admin.getName().equals(name) && admin.getPwd().equals(pwd))
                return true;
        }
        return false;
    }


    @Override
    public boolean deleteById(Integer id) {
        return this.adminDao.deleteById(id) > 0;
    }
}