package com.example.meal_ordering_system.controller;

import com.example.meal_ordering_system.entity.Menus;
import com.example.meal_ordering_system.entity.Notice;
import com.example.meal_ordering_system.entity.Types;
import com.example.meal_ordering_system.service.MenusService;
import com.example.meal_ordering_system.service.NoticeService;
import com.example.meal_ordering_system.service.TypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;


@Controller
@RequestMapping("menus")
public class MenusController {

    @Autowired
    @Qualifier("menusService")
    private MenusService menusService;
    @Autowired
    @Qualifier("typesService")
    private TypesService typesService;

    @Autowired
    @Qualifier("noticeService")
    private NoticeService noticeService;
    @RequestMapping("/toAddPage")
    public ModelAndView toAddPage(){
        ModelAndView modelAndView = new ModelAndView("/admin/menus_add");
        List<Types> typesList=typesService.queryAll();
        modelAndView.addObject("typesList",typesList);
        return modelAndView;
    }
    @RequestMapping("/toUpdatePage")
    public String toUpdatePage(Integer id,Model model){
        Menus menus = menusService.queryById(id);
        model.addAttribute("menu",menus);
        List<Types> typesList=typesService.queryAll();
        model.addAttribute("typesList",typesList);
        return "/admin/menus_update";
    }

    @RequestMapping("/qiantai/allMenus")
    public String  menusList(Model model ){
        List<Menus> list = menusService.queryAll();
        model.addAttribute("menusList",list);
        List<Types> typesList=typesService.queryAll();
        model.addAttribute("typesList",typesList);
        List<Notice> notices=noticeService.queryAll();
        model.addAttribute("notices",notices);
        return "/qiantai/index";
    }
    @RequestMapping("/allMenus")
    public String  list(Model model ){
        List<Menus> list = menusService.queryAllByLimit(1, 10);
        model.addAttribute("list",list);
        List<Types> typesList=typesService.queryAll();
        model.addAttribute("typesList",typesList);
        return "/admin/menus";
    }
    @RequestMapping("/insert")
    public String  insert(Menus menus, @RequestPart("img")MultipartFile multipartFile, HttpSession session) throws IOException {
        String realPath = session.getServletContext().getRealPath("");
        if (!multipartFile.isEmpty()) {
            String originalFilename = multipartFile.getOriginalFilename();
            System.out.println("==================================================");
            System.out.println(realPath);
            multipartFile.transferTo(new File(realPath + "public\\img\\" + originalFilename));
            menus.setImgpath("img//" + originalFilename);
        }
        menus.setSums(0);
        menus.setSums1(0);
        menusService.insert(menus);
        return "/admin/menus_add";
    }
    @RequestMapping("/update")
    public void update(Menus menus,HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        menusService.update(menus);
        request.getRequestDispatcher("../menus/allMenus").forward(request,response);

    }

    @RequestMapping("/delete")
    public void delete(Integer id,HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
       menusService.deleteById(id);
        request.getRequestDispatcher("../menus/allMenus").forward(request,response);
    }




    @GetMapping("selectOne")
    public Menus selectOne(Object id) {
        return this.menusService.queryById(id);
    }

}