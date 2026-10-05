<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ADMIN - <decorator:title default="Quản trị" /></title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { display: flex; flex-direction: column; min-height: 100vh; background-color: #f8f9fa; }
        .content { flex: 1; padding: 30px 0; }
        .navbar-brand { font-weight: bold; color: #dc3545 !important; }
        footer { background-color: #343a40; color: white; padding: 15px 0; margin-top: auto; }
    </style>
    <decorator:head />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/books"><i class="fas fa-user-shield"></i> GIAO DIỆN QUẢN TRỊ VIÊN</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/books"><i class="fas fa-book"></i> Quản lý Sách</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Về Trang Khách</a></li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item"><span class="nav-link text-light fw-bold"><i class="fas fa-user-cog"></i> Admin: ${sessionScope.USER_MODEL.fullname}</span></li>
                    <li class="nav-item"><a class="btn btn-outline-danger btn-sm mt-1 ms-2" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="content container">
        <decorator:body />
    </div>

    <footer class="text-center">
        <div class="container">
            <p class="mb-0">Họ tên: Nguyễn Hữu Phát | MSSV: 24133044 | Mã đề: 02</p>
        </div>
    </footer>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>