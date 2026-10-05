<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>${book != null ? 'Cập nhật Sách' : 'Thêm Sách Mới'}</title>

<div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
        <div class="card shadow-sm border-0 mt-3">
            <div class="card-header bg-danger text-white">
                <h4 class="mb-0 fw-bold"><i class="fas fa-book-medical"></i> ${book != null ? 'Cập nhật Thông tin Sách' : 'Thêm Sách Mới'}</h4>
            </div>
            <div class="card-body p-4">
                <form action="${pageContext.request.contextPath}${book != null ? '/admin/books/edit' : '/admin/books/add'}" method="post" enctype="multipart/form-data">
                    <c:if test="${book != null}">
                        <input type="hidden" name="bookid" value="${book.bookid}" />
                    </c:if>
                    
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <label class="form-label fw-bold">Mã ISBN <span class="text-danger">*</span></label>
                            <input type="number" name="isbn" class="form-control" value="${book != null ? book.isbn : ''}" required />
                        </div>
                        <div class="col-md-9 mt-3 mt-md-0">
                            <label class="form-label fw-bold">Tiêu đề sách <span class="text-danger">*</span></label>
                            <input type="text" name="title" class="form-control" value="${book != null ? book.title : ''}" required placeholder="Nhập tên sách..." />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Tên tác giả <span class="text-danger">*</span></label>
                        <input type="text" name="authorName" class="form-control" value="${book != null ? book.authorName : ''}" required placeholder="VD: Nguyễn Nhật Ánh..." />
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Nhà Xuất Bản</label>
                            <input type="text" name="publisher" class="form-control" value="${book != null ? book.publisher : ''}" placeholder="VD: NXB Trẻ..." />
                        </div>
                        <div class="col-md-6 mt-3 mt-md-0">
                            <label class="form-label fw-bold">Số lượng kho <span class="text-danger">*</span></label>
                            <input type="number" name="quantity" class="form-control" value="${book != null ? book.quantity : 0}" min="0" required />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Giá bán (VNĐ) <span class="text-danger">*</span></label>
                        <input type="number" name="price" class="form-control" value="${book != null ? book.price : 0}" step="1000" min="0" required />
                    </div>
                    
                    <hr class="my-4">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold"><i class="fas fa-upload"></i> Tải Ảnh Bìa Lên (Khuyên dùng):</label>
                        <input type="file" name="coverFile" class="form-control" accept="image/*" />
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label fw-bold text-muted">HOẶC Dán link URL ảnh bìa:</label>
                        <input type="text" name="coverImage" class="form-control text-muted" value="${book != null ? book.coverImage : ''}" placeholder="https://..." />
                        <c:if test="${book != null && not empty book.coverImage}">
                            <div class="mt-2">
                                <img src="${book.coverImage}" alt="Current Cover" class="img-thumbnail" style="height: 100px;">
                            </div>
                        </c:if>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a href="${pageContext.request.contextPath}/admin/books" class="btn btn-light border fw-bold px-4">Hủy</a>
                        <button type="submit" class="btn btn-danger fw-bold px-4"><i class="fas fa-save"></i> Lưu Sách</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>