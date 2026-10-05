<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lịch sử đặt hàng</title>
</head>
<body>
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="text-primary m-0"><i class="fas fa-history"></i> Lịch sử đặt hàng của bạn</h2>
                
                <form action="${pageContext.request.contextPath}/order-history" method="get" class="d-flex align-items-center">
                    <label class="me-2 fw-bold text-nowrap">Lọc trạng thái:</label>
                    <select name="status" class="form-select me-2" onchange="this.form.submit()">
                        <option value="Tất cả" ${selectedStatus == 'Tất cả' ? 'selected' : ''}>Tất cả</option>
                        <option value="Đơn hàng mới" ${selectedStatus == 'Đơn hàng mới' ? 'selected' : ''}>Đơn hàng mới</option>
                        <option value="Đã xác nhận" ${selectedStatus == 'Đã xác nhận' ? 'selected' : ''}>Đã xác nhận</option>
                        <option value="Chuẩn bị hàng" ${selectedStatus == 'Chuẩn bị hàng' ? 'selected' : ''}>Chuẩn bị hàng</option>
                        <option value="Đang vận chuyển" ${selectedStatus == 'Đang vận chuyển' ? 'selected' : ''}>Đang vận chuyển</option>
                        <option value="Đang giao hàng" ${selectedStatus == 'Đang giao hàng' ? 'selected' : ''}>Đang giao hàng</option>
                        <option value="Đã giao" ${selectedStatus == 'Đã giao' ? 'selected' : ''}>Đã giao</option>
                        <option value="Đã hủy" ${selectedStatus == 'Đã hủy' ? 'selected' : ''}>Đã hủy</option>
                        <option value="Đã hoàn" ${selectedStatus == 'Đã hoàn' ? 'selected' : ''}>Đã hoàn</option>
                    </select>
                </form>
            </div>

            <c:if test="${param.message == 'success'}">
                <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
                    <i class="fas fa-check-circle"></i> Đặt hàng thành công! Cảm ơn bạn đã mua sắm.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <c:if test="${empty orders}">
                <div class="alert alert-secondary text-center p-5 shadow-sm">
                    <h4><i class="fas fa-box-open text-muted mb-3" style="font-size: 3rem;"></i><br>Chưa có đơn hàng nào</h4>
                    <p>Bạn chưa có đơn hàng nào hoặc không có đơn hàng phù hợp với bộ lọc.</p>
                </div>
            </c:if>
            
            <c:if test="${not empty orders}">
                <div class="card shadow-sm border-0">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover align-middle mb-0 text-center">
                                <thead class="table-dark">
                                    <tr>
                                        <th scope="col">Mã ĐH</th>
                                        <th scope="col">Ngày đặt</th>
                                        <th scope="col">Tổng tiền</th>
                                        <th scope="col">Địa chỉ giao</th>
                                        <th scope="col">Phương thức</th>
                                        <th scope="col">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td class="fw-bold">#${order.orderId}</td>
                                            <td><fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/></td>
                                            <td class="text-danger fw-bold"><fmt:formatNumber value="${order.totalAmount}" type="number" maxFractionDigits="0"/> đ</td>
                                            <td class="text-start">${order.shippingAddress}</td>
                                            <td><span class="badge bg-info text-dark">${order.paymentMethod}</span></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${order.status == 'Đơn hàng mới'}"><span class="badge bg-primary">${order.status}</span></c:when>
                                                    <c:when test="${order.status == 'Đã hủy'}"><span class="badge bg-danger">${order.status}</span></c:when>
                                                    <c:when test="${order.status == 'Đã giao'}"><span class="badge bg-success">${order.status}</span></c:when>
                                                    <c:otherwise><span class="badge bg-warning text-dark">${order.status}</span></c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>