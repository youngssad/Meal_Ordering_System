package com.example.meal_ordering_system.controller;

import com.example.meal_ordering_system.entity.Admin;
import com.example.meal_ordering_system.entity.Menus;
import com.example.meal_ordering_system.entity.Types;
import com.example.meal_ordering_system.service.AdminService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    @Qualifier("adminService")
    private AdminService adminService;

    @RequestMapping("update")
    public String update(Admin admin) {
        adminService.update(admin);
        return "/admin/menus";
    }


    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String toLogin(){
        return  "/admin/index";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(Admin admin, HttpServletRequest request,HttpSession session){
        boolean loginType = adminService.login(admin.getName(),admin.getPwd());
        if(loginType){
            request.setAttribute("admin",admin);
            session.setAttribute("admin_session",admin);
            return "/admin/main";
        }else{
            request.setAttribute("message","Username or password wrong");
            return "/admin/index";
        }
    }

    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("admin_session");
        return "/admin/index";
    }



}