<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thanh toán đơn hàng</title>
</head>
<body>
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow border-0 mt-4">
                <div class="card-header bg-primary text-white text-center py-3">
                    <h3 class="mb-0"><i class="fas fa-money-bill-wave"></i> Thanh Toán (COD)</h3>
                </div>
                <div class="card-body p-4">
                    <c:if test="${param.error == 'failed'}">
                        <div class="alert alert-danger"><i class="fas fa-exclamation-triangle"></i> Có lỗi xảy ra trong quá trình tạo đơn hàng.</div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/checkout" method="post">
                        <div class="mb-4">
                            <label class="form-label fw-bold text-muted">Tổng tiền cần thanh toán:</label>
                            <input type="text" class="form-control form-control-lg text-danger fw-bold bg-light" value="<fmt:formatNumber value='${sessionScope.cart.totalAmount}' type='number' maxFractionDigits='0'/> VNĐ" readonly disabled>
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-bold">Địa chỉ giao hàng (*):</label>
                            <textarea name="address" class="form-control" rows="3" placeholder="Nhập địa chỉ nhận hàng chi tiết..." required></textarea>
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label fw-bold">Phương thức thanh toán:</label>
                            <div class="alert alert-info py-2 mb-0">
                                <i class="fas fa-truck"></i> Thanh toán khi nhận hàng (Cash On Delivery)
                            </div>
                        </div>
                        
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg rounded-pill fw-bold"><i class="fas fa-check"></i> Xác nhận đặt hàng</button>
                            <a href="${pageContext.request.contextPath}/cart" class="btn btn-outline-secondary rounded-pill">Quay lại giỏ hàng</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>