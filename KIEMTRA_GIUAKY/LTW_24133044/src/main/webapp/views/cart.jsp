<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Giỏ hàng của bạn</title>
</head>
<body>
    <div class="row">
        <div class="col-12">
            <h2 class="mb-4 text-primary"><i class="fas fa-shopping-basket"></i> Giỏ hàng của bạn</h2>
            
            <c:if test="${empty sessionScope.cart.items}">
                <div class="alert alert-warning text-center p-5 shadow-sm">
                    <h4>Giỏ hàng đang trống!</h4>
                    <p class="text-muted">Bạn chưa chọn mua sản phẩm nào.</p>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-primary mt-3"><i class="fas fa-arrow-left"></i> Tiếp tục mua sắm</a>
                </div>
            </c:if>

            <c:if test="${not empty sessionScope.cart.items}">
                <div class="card shadow-sm border-0 mb-4">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col" class="ps-4">Sản phẩm</th>
                                        <th scope="col">Đơn giá</th>
                                        <th scope="col" style="width: 150px;">Số lượng</th>
                                        <th scope="col">Thành tiền</th>
                                        <th scope="col" class="text-center">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${sessionScope.cart.items}">
                                        <tr>
                                            <td class="ps-4 fw-bold text-dark">
                                                <i class="fas fa-book text-muted me-2"></i> ${item.book.title}
                                            </td>
                                            <td class="text-danger fw-bold"><fmt:formatNumber value="${item.book.price}" type="number" maxFractionDigits="0"/> đ</td>
                                            <td>
                                                <form action="${pageContext.request.contextPath}/cart" method="post" class="d-flex align-items-center">
                                                    <input type="hidden" name="action" value="update"/>
                                                    <input type="hidden" name="bookId" value="${item.book.bookid}"/>
                                                    <input type="number" name="quantity" value="${item.quantity}" min="1" max="${item.book.quantity}" class="form-control form-control-sm text-center" style="width: 70px;" onchange="this.form.submit()">
                                                </form>
                                            </td>
                                            <td class="text-danger fw-bold"><fmt:formatNumber value="${item.totalPrice}" type="number" maxFractionDigits="0"/> đ</td>
                                            <td class="text-center">
                                                <form action="${pageContext.request.contextPath}/cart" method="post">
                                                    <input type="hidden" name="action" value="remove"/>
                                                    <input type="hidden" name="bookId" value="${item.book.bookid}"/>
                                                    <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Xóa khỏi giỏ hàng?');"><i class="fas fa-trash"></i> Xóa</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                <div class="row justify-content-end">
                    <div class="col-md-5 col-lg-4">
                        <div class="card shadow-sm border-0 bg-light">
                            <div class="card-body">
                                <h4 class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="text-muted">Tổng cộng:</span>
                                    <span class="text-danger fw-bold"><fmt:formatNumber value="${sessionScope.cart.totalAmount}" type="number" maxFractionDigits="0"/> VNĐ</span>
                                </h4>
                                <hr>
                                <a href="${pageContext.request.contextPath}/checkout" class="btn btn-success btn-lg w-100 fw-bold rounded-pill"><i class="fas fa-check-circle"></i> Thanh toán (COD)</a>
                                <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary w-100 mt-2 rounded-pill">Tiếp tục mua sắm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>