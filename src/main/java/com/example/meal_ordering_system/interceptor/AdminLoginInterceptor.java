package com.example.meal_ordering_system.interceptor;

import com.example.meal_ordering_system.entity.Admin;
import com.example.meal_ordering_system.entity.Users;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String uri = request.getRequestURI();
        if (uri.indexOf("/admin/login")>=0) {
            return true;
        }
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin_session");
        Users user=(Users)session.getAttribute("user_session");
        if (admin != null) {
            return true;
        }
        request.setAttribute("msg", "Please login！");
        request.getRequestDispatcher("/public/admin/index.jsp").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
