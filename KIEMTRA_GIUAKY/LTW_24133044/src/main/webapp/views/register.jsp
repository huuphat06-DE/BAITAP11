<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Đăng Ký</title>

<div style="width: 400px; margin: 0 auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
    <h2 style="text-align: center; color: #1565c0;">ĐĂNG KÝ TÀI KHOẢN</h2>
    <p style="color: red; text-align: center;">${message}</p>
    
    <form action="${pageContext.request.contextPath}/register" method="post">
        <div style="margin-bottom: 15px;">
            <label>Họ và Tên:</label><br/>
            <input type="text" name="fullname" required style="width: 100%; padding: 8px;" />
        </div>
        <div style="margin-bottom: 15px;">
            <label>Email (Nhận OTP):</label><br/>
            <input type="email" name="email" required style="width: 100%; padding: 8px;" />
        </div>
        <div style="margin-bottom: 15px;">
            <label>Số điện thoại:</label><br/>
            <input type="number" name="phone" required style="width: 100%; padding: 8px;" />
        </div>
        <div style="margin-bottom: 15px;">
            <label>Mật khẩu:</label><br/>
            <input type="password" name="password" required style="width: 100%; padding: 8px;" />
        </div>
        <button type="submit" style="width: 100%; padding: 10px; background: #2e7d32; color: white; border: none; font-weight: bold;">Đăng ký & Nhận OTP</button>
    </form>
</div>
