package com.example.meal_ordering_system.controller;

import com.example.meal_ordering_system.entity.Types;
import com.example.meal_ordering_system.service.TypesService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping("types")
public class TypesController {

    @Autowired
    @Qualifier("typesService")
    private TypesService typesService;

    @RequestMapping("queryAll")
    public String queryAll(Model model){
        List<Types> types=typesService.queryAll();
        model.addAttribute("types",types);
        return "admin/type";
    }

    @RequestMapping("getall")
    public List<Types> queryall()
    {
        return this.typesService.queryAll();
    }


    @RequestMapping("delete")
    public String delete(Model model,@Param("id") int id){
        this.typesService.delete(id);
        return queryAll(model);
    }


    @RequestMapping("update")
    public String update(Model model,@Param("id") int id,@Param("name") String name) {
        typesService.update(new Types(id,name));
        return queryAll(model);
    }

    @RequestMapping("queryById")
    public String queryById(Model model,@Param("id") int id){
        Types type=typesService.queryById(id);
        model.addAttribute("type",type);
        return "admin/type_update";
    }


    @RequestMapping("insert")
    public String insert(Model model,@Param("name") String name){
        int id=(int)(System.currentTimeMillis()%100);
        typesService.insert(new Types(id,name));
        return queryAll(model);
    }
}