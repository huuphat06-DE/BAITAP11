<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>Quản lý Sách (CRUD)</title>

<div class="row mb-4">
    <div class="col-12 d-flex justify-content-between align-items-center">
        <h3 class="text-danger fw-bold"><i class="fas fa-list"></i> Danh sách Sách</h3>
        <a href="${pageContext.request.contextPath}/admin/books/add" class="btn btn-success fw-bold"><i class="fas fa-plus-circle"></i> Thêm Sách Mới</a>
    </div>
</div>

<div class="card shadow-sm border-0">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle text-center mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>ISBN</th>
                        <th class="text-start">Tiêu đề</th>
                        <th>Nhà XB</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${listBooks}">
                        <tr>
                            <td class="fw-bold">${b.bookid}</td>
                            <td>${b.isbn}</td>
                            <td class="text-start fw-bold text-primary">${b.title}</td>
                            <td>${b.publisher}</td>
                            <td class="text-danger fw-bold"><fmt:formatNumber value="${b.price}" type="number" maxFractionDigits="0"/> đ</td>
                            <td><span class="badge ${b.quantity > 10 ? 'bg-success' : 'bg-warning text-dark'} rounded-pill px-3 py-2">${b.quantity}</span></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/books/edit?id=${b.bookid}" class="btn btn-sm btn-outline-primary" title="Chỉnh sửa"><i class="fas fa-edit"></i></a> 
                                <a href="${pageContext.request.contextPath}/admin/books/delete?id=${b.bookid}" class="btn btn-sm btn-outline-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa sách này vĩnh viễn?');" title="Xóa"><i class="fas fa-trash"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Phân trang admin -->
<nav class="mt-4">
    <ul class="pagination justify-content-center">
        <c:if test="${currentPage > 1}">
            <li class="page-item">
                <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo; Trước</span>
                </a>
            </li>
        </c:if>
        
        <c:forEach begin="1" end="${totalPages}" var="i">
            <li class="page-item ${currentPage == i ? 'active' : ''}"><a class="page-link" href="?page=${i}">${i}</a></li>
        </c:forEach>
        
        <c:if test="${currentPage < totalPages}">
            <li class="page-item">
                <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">
                    <span aria-hidden="true">Sau &raquo;</span>
                </a>
            </li>
        </c:if>
    </ul>
</nav>