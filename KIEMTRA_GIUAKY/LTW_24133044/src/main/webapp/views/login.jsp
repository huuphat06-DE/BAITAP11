<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Đăng Nhập</title>

<div style="width: 400px; margin: 0 auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
    <h2 style="text-align: center; color: #1565c0;">ĐĂNG NHẬP</h2>
    <p style="color: red; text-align: center;">${message}</p>
    
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div style="margin-bottom: 15px;">
            <label>Email:</label><br/>
            <input type="email" name="email" required style="width: 100%; padding: 8px;" />
        </div>
        <div style="margin-bottom: 15px;">
            <label>Mật khẩu:</label><br/>
            <input type="password" name="password" required style="width: 100%; padding: 8px;" />
        </div>
        <button type="submit" style="width: 100%; padding: 10px; background: #1565c0; color: white; border: none; font-weight: bold;">Đăng nhập</button>
    </form>
    
    <p style="text-align: center; margin-top: 15px;">Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a></p>
</div>
