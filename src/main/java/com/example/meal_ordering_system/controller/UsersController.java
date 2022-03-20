package com.example.meal_ordering_system.controller;

import com.example.meal_ordering_system.entity.Users;
import com.example.meal_ordering_system.service.UsersService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Random;
import java.util.UUID;


@Controller("usersController")
@RequestMapping("users")
@Scope("prototype")
public class UsersController {

    @Autowired
    @Qualifier("usersService")
    private UsersService usersService;

    @RequestMapping ("queryById")
    public Users queryById(Integer id) {
        return this.usersService.queryById(id);
    }


    @RequestMapping("login")
    public String login(Users user, HttpServletRequest request){
        boolean loginType=usersService.login(user.getName(), user.getPwd());
        HttpSession session=request.getSession();
        if(loginType){
            session.setAttribute("user_session",usersService.queryById(usersService.queryByname(user.getName())));
            return "redirect:/menus/qiantai/allMenus";
        }else{
            session.setAttribute("message","用户名密码错误");
            return "qiantai/userLoginFail";
        }
    }
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("user_session");
        return "redirect:/menus/qiantai/allMenus";
    }

    @RequestMapping("insert")
    public String insert(@Param("name") String name,@Param("pwd") String pwd,@Param("realname") String realname,@Param("sex") String sex,@Param("age") Integer age,@Param("card") String card,@Param("address") String address,@Param("Phone") String phone,@Param("email")String email,@Param("code")String code,@Param("type")Integer type){
        Users user=new Users(name,pwd,realname,sex,age,card,address,phone,email,code,type);
        usersService.insert(user);
        return "redirect:../public/qiantai/login.jsp";
    }


    @RequestMapping("update")
    public String update(HttpSession session,@Param("id")Integer id,@Param("name") String name,@Param("pwd") String pwd,@Param("realname") String realname,@Param("sex") String sex,@Param("age") Integer age,@Param("card") String card,@Param("address") String address,@Param("Phone") String phone,@Param("email")String email,@Param("code")String code,@Param("type")Integer type){
        Users user=new Users(id,name,pwd,realname,sex,age,card,address,phone,email,code,type);
        usersService.update(user);
        session.removeAttribute("user_session");
        return "redirect:/users/login";
    }
}