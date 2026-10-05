package com.web.controller;

import com.web.model.User_24133044;
import com.web.service.IUserService_24133044;
import com.web.service.UserServiceImpl_24133044;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login"})
public class LoginController_24133044 extends HttpServlet {
    private IUserService_24133044 userService = new UserServiceImpl_24133044();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        User_24133044 user = userService.login(email, pass);
        if (user != null) {
            // Đăng nhập thành công, lưu session
            HttpSession session = req.getSession();
            session.setAttribute("USER_MODEL", user);
            
            // Theo yêu cầu: User thành công thì vào trang chủ User, nếu Admin thì...
            // Tạm thời cho về trang chủ, Admin sẽ thấy nút "Trang quản trị" trên menu
            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            // Đăng nhập thất bại, quay lại trang login
            req.setAttribute("message", "Sai email hoặc mật khẩu!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}
