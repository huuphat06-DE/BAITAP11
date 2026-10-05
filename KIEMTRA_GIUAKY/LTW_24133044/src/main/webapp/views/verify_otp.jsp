<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Xác nhận OTP</title>

<div style="width: 400px; margin: 0 auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
    <h2 style="text-align: center; color: #1565c0;">NHẬP MÃ OTP</h2>
    <p style="text-align: center;">Mã OTP gồm 6 chữ số đã được gửi tới email của bạn.</p>
    <p style="color: red; text-align: center;">${message}</p>
    
    <form action="${pageContext.request.contextPath}/verify" method="post">
        <div style="margin-bottom: 15px;">
            <label>Mã OTP:</label><br/>
            <input type="text" name="otp" required style="width: 100%; padding: 8px; text-align: center; font-size: 20px; letter-spacing: 5px;" />
        </div>
        <button type="submit" style="width: 100%; padding: 10px; background: #f57c00; color: white; border: none; font-weight: bold;">Xác nhận OTP</button>
    </form>
</div>
