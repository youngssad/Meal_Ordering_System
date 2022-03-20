package com.example.meal_ordering_system.controller;


import com.example.meal_ordering_system.entity.Menus;
import com.example.meal_ordering_system.service.MenusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


import javax.servlet.http.HttpServletRequest;
import java.io.*;

@RestController
public class FileController {
    @Autowired
    @Qualifier("menusService")
    private MenusService menusService;

    @RequestMapping("upload")
    public String fileUpload(CommonsMultipartFile file, Menus menus, HttpServletRequest request)throws IOException {
        menusService.insert(menus);
        String uploadFilename = file.getOriginalFilename();
        if("".equals(uploadFilename)){
            return "redirect: menus_add.jsp";
        }
        System.out.println("Upload file："+uploadFilename);
         String path=request.getServletContext().getRealPath("/public/img");
        File realPath= new File(path);
        if (!realPath.exists()){
            realPath.mkdirs();
        }
        System.out.println("File path："+realPath);
        InputStream is =file.getInputStream();
        OutputStream os =new FileOutputStream(new File(realPath,uploadFilename));

        int len=0;
        byte[] buffer = new byte[1024];
        while ((len=is.read(buffer))!=-1) {
            os.write(buffer,0,len);
            os.flush();
        }
        os.close();
        is.close();
        return "/admin/main";
    }
}
