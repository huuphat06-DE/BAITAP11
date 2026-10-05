package com.web.controller;

import com.web.model.User_24133044;
import com.web.service.EmailUtil_24133044;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/register"})
public class RegisterController_24133044 extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        int phone = Integer.parseInt(req.getParameter("phone"));
        String pass = req.getParameter("password");

        // Tạo mã OTP
        String otp = EmailUtil_24133044.generateOTP();
        
        // Gửi OTP qua email (lưu ý: cần cấu hình email trong EmailUtil trước mới chạy được)
        boolean isSent = EmailUtil_24133044.sendOTP(email, otp);
        
        if(isSent) {
            // Lưu thông tin tạm vào session để xác nhận OTP
            User_24133044 tempUser = new User_24133044();
            tempUser.setEmail(email);
            tempUser.setFullname(fullname);
            tempUser.setPhone(phone);
            tempUser.setPasswd(pass);
            
            HttpSession session = req.getSession();
            session.setAttribute("TEMP_USER", tempUser);
            session.setAttribute("OTP_CODE", otp);
            
            resp.sendRedirect(req.getContextPath() + "/verify");
        } else {
            req.setAttribute("message", "Lỗi gửi email OTP. Vui lòng thử lại!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }
    }
}
