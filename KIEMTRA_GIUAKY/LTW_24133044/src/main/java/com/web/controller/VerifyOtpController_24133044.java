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

@WebServlet(urlPatterns = {"/verify"})
public class VerifyOtpController_24133044 extends HttpServlet {
    private IUserService_24133044 userService = new UserServiceImpl_24133044();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/verify_otp.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String inputOtp = req.getParameter("otp");
        HttpSession session = req.getSession();
        String sessionOtp = (String) session.getAttribute("OTP_CODE");
        User_24133044 tempUser = (User_24133044) session.getAttribute("TEMP_USER");

        if (sessionOtp != null && sessionOtp.equals(inputOtp)) {
            // Lưu vào database
            boolean success = userService.registerUser(tempUser);
            if (success) {
                session.removeAttribute("OTP_CODE");
                session.removeAttribute("TEMP_USER");
                req.setAttribute("message", "Đăng ký thành công! Hãy đăng nhập.");
                req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            } else {
                req.setAttribute("message", "Lỗi lưu vào CSDL.");
                req.getRequestDispatcher("/views/verify_otp.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("message", "Mã OTP không hợp lệ!");
            req.getRequestDispatcher("/views/verify_otp.jsp").forward(req, resp);
        }
    }
}
