<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ - Danh Sách Sách</title>
</head>
<body>
    <div class="text-center mb-4">
        <h1 class="text-primary fw-bold text-uppercase">Danh mục sách</h1>
        <hr class="w-25 mx-auto">
    </div>

    <!-- Bộ Lọc Đa Năng -->
    <div class="card shadow-sm border-0 mb-4 bg-white rounded">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/home" method="get" class="row g-3 align-items-end">
                <div class="col-md-3">
                    <label class="form-label fw-bold"><i class="fas fa-user-edit"></i> Tác giả</label>
                    <select name="author" class="form-select">
                        <option value="">-- Tất cả tác giả --</option>
                        <option value="Nguyễn Nhật Ánh" ${selectedAuthor == 'Nguyễn Nhật Ánh' ? 'selected' : ''}>Nguyễn Nhật Ánh</option>
                        <option value="Tô Hoài" ${selectedAuthor == 'Tô Hoài' ? 'selected' : ''}>Tô Hoài</option>
                        <option value="Nam Cao" ${selectedAuthor == 'Nam Cao' ? 'selected' : ''}>Nam Cao</option>
                    </select>
                </div>
                
                <div class="col-md-3">
                    <label class="form-label fw-bold"><i class="fas fa-building"></i> Nhà Xuất Bản</label>
                    <select name="publisher" class="form-select">
                        <option value="">-- Tất cả NXB --</option>
                        <option value="NXB Trẻ" ${selectedPublisher == 'NXB Trẻ' ? 'selected' : ''}>NXB Trẻ</option>
                        <option value="NXB Kim Đồng" ${selectedPublisher == 'NXB Kim Đồng' ? 'selected' : ''}>NXB Kim Đồng</option>
                        <option value="NXB Văn Học" ${selectedPublisher == 'NXB Văn Học' ? 'selected' : ''}>NXB Văn Học</option>
                    </select>
                </div>
                
                <div class="col-md-4">
                    <label class="form-label fw-bold"><i class="fas fa-money-bill"></i> Khoảng Giá</label>
                    <select name="priceRange" class="form-select">
                        <option value="">-- Mọi mức giá --</option>
                        <option value="0-100000" ${selectedPriceRange == '0-100000' ? 'selected' : ''}>Dưới 100.000 đ</option>
                        <option value="100000-200000" ${selectedPriceRange == '100000-200000' ? 'selected' : ''}>Từ 100.000 đ - 200.000 đ</option>
                        <option value=">200000" ${selectedPriceRange == '>200000' ? 'selected' : ''}>Trên 200.000 đ</option>
                    </select>
                </div>
                
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary w-100 fw-bold"><i class="fas fa-filter"></i> Lọc Sách</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Kết quả lọc -->
    <c:if test="${not empty selectedAuthor or not empty selectedPublisher or not empty selectedPriceRange}">
        <div class="alert alert-info shadow-sm d-flex justify-content-between align-items-center">
            <div>
                <i class="fas fa-info-circle"></i> <strong>Đang lọc theo:</strong> 
                <c:if test="${not empty selectedAuthor}">Tác giả (${selectedAuthor}) </c:if>
                <c:if test="${not empty selectedPublisher}">NXB (${selectedPublisher}) </c:if>
                <c:if test="${not empty selectedPriceRange}">Khoảng giá </c:if>
            </div>
            <a href="${pageContext.request.contextPath}/home" class="btn btn-sm btn-outline-info">Xóa lọc</a>
        </div>
    </c:if>

    <c:if test="${empty listBooks}">
        <div class="alert alert-warning text-center p-4">
            <h4><i class="fas fa-search-minus"></i> Không tìm thấy sách nào!</h4>
            <p>Rất tiếc, không có cuốn sách nào khớp với điều kiện lọc của bạn.</p>
        </div>
    </c:if>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="book" items="${listBooks}">
            <div class="col">
                <div class="card h-100 shadow-sm border-0 product-card">
                    <a href="${pageContext.request.contextPath}/book-detail?id=${book.bookid}" class="text-center p-3">
                        <img src="${not empty book.coverImage ? book.coverImage : 'https://via.placeholder.com/150x200?text=No+Cover'}" class="card-img-top rounded" alt="Cover" style="width: 180px; height: 240px; object-fit: cover; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
                    </a>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title text-truncate"><a href="${pageContext.request.contextPath}/book-detail?id=${book.bookid}" class="text-decoration-none text-dark fw-bold">${book.title}</a></h5>
                        <p class="card-text text-muted small mb-2">
                            <i class="fas fa-barcode"></i> ISBN: ${book.isbn}<br/>
                            <i class="fas fa-user"></i> Tác giả: ${book.authorName}<br/>
                            <i class="fas fa-building"></i> NXB: ${book.publisher}
                        </p>
                        <h4 class="text-danger fw-bold mt-auto"><fmt:formatNumber value="${book.price}" type="number" maxFractionDigits="0"/> VNĐ</h4>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <span class="badge bg-secondary">Tồn kho: ${book.quantity}</span>
                            <span class="text-warning"><i class="fas fa-star"></i> ${book.reviewCount}</span>
                        </div>
                    </div>
                    <div class="card-footer bg-white border-0 text-center pb-3">
                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="action" value="add"/>
                            <input type="hidden" name="bookId" value="${book.bookid}"/>
                            <input type="hidden" name="quantity" value="1"/>
                            <button type="submit" class="btn btn-success w-100 rounded-pill fw-bold"><i class="fas fa-cart-plus"></i> Thêm vào giỏ</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Phân trang -->
    <c:if test="${totalPages > 1}">
        <nav class="mt-5">
            <ul class="pagination justify-content-center">
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a class="page-link" href="?page=${currentPage - 1}&author=${selectedAuthor}&publisher=${selectedPublisher}&priceRange=${selectedPriceRange}" aria-label="Previous">
                            <span aria-hidden="true">&laquo; Trang trước</span>
                        </a>
                    </li>
                </c:if>
                
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${currentPage == i ? 'active' : ''}"><a class="page-link" href="?page=${i}&author=${selectedAuthor}&publisher=${selectedPublisher}&priceRange=${selectedPriceRange}">${i}</a></li>
                </c:forEach>
                
                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="?page=${currentPage + 1}&author=${selectedAuthor}&publisher=${selectedPublisher}&priceRange=${selectedPriceRange}" aria-label="Next">
                            <span aria-hidden="true">Trang sau &raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </c:if>
    <style>
        .product-card { transition: transform 0.2s; }
        .product-card:hover { transform: translateY(-5px); }
    </style>
</body>
</html>