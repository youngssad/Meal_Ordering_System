package com.example.meal_ordering_system.controller;

import com.example.meal_ordering_system.entity.Notice;
import com.example.meal_ordering_system.service.NoticeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("notice")
public class NoticeController {

    @Autowired
    @Qualifier("noticeService")
    private NoticeService noticeService;


    @RequestMapping("queryAll")
    public String queryAll(Model model){
        List<Notice> notices=noticeService.queryAll();
        model.addAttribute("notices",notices);
        return "admin/notice";
    }


    @RequestMapping("queryAlltoQiantai")
    public String queryAlltoQiantai(Model model){
        List<Notice> notices=noticeService.queryAll();
        model.addAttribute("notices",notices);
        return "qiantai/index";
    }


    @RequestMapping("delete")
    public String delete(Model model, @Param("id") Integer id){
        this.noticeService.delete(id);
        return queryAll(model);
    }


    @RequestMapping("queryById")
    public String queryById(Model model,@Param("id") Integer id){
        Notice notice=noticeService.queryById(id);
        model.addAttribute("notice",notice);
        return "admin/notice_update";
    }


    @RequestMapping("queryByIdtoQiantai")
    public String queryByIdtoQiantai(Model model,@Param("id") Integer id){
        Notice notice=noticeService.queryById(id);
        model.addAttribute("notice",notice);
        return "qiantai/notice";
    }


    @RequestMapping("update")
    public String update(Model model,@Param("id") Integer id,@Param("name") String name,@Param("content") String content,@Param("times") String times){
        noticeService.update(new Notice(id,name,content,times));
        return queryAll(model);
    }


    @RequestMapping("insert")
    public String insert(Model model,@Param("name") String name,@Param("content") String content){
        Integer id=(int)(System.currentTimeMillis()%100);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String times=sdf.format(new Date());
        noticeService.insert(new Notice(id,name,content,times));
        return queryAll(model);
    }
}