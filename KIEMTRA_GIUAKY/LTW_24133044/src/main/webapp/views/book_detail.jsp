<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi Tiết Sách</title>
</head>
<body>
    <div style="width: 80%; margin: 20px auto;">
        <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; border-collapse: collapse; text-align: left;">
            <!-- Dòng 1: Ảnh bìa (rowspan=2) và Tiêu đề -->
            <tr>
                <td rowspan="2" style="width: 30%; text-align: center; vertical-align: top;">
                    <img src="${not empty book.coverImage ? book.coverImage : 'https://via.placeholder.com/300x400'}" alt="Cover Image" style="width: 100%; max-width: 300px;" />
                </td>
                <td style="vertical-align: top;">
                    Tiêu đề: ${book.title}<br/>
                    Mã isbn: ${book.isbn}
                </td>
            </tr>
            <!-- Dòng 2: Thông tin tác giả, publisher... -->
            <tr>
                <td style="vertical-align: top;">
                    Tác giả: ${book.authorName}<br/>
                    Publisher: ${book.publisher}<br/>
                    Publisher_date: ${book.publishDate}<br/>
                    Quantity: ${book.quantity}<br/>
                    Reviews (${book.reviewCount})
                </td>
            </tr>
            
            <!-- Dòng 3: Tiêu đề Reviews -->
            <tr>
                <td>Reviews</td>
                <td></td>
            </tr>

            <!-- Dòng 4: Danh sách comment -->
            <tr>
                <td colspan="2" style="vertical-align: top; min-height: 50px;">
                    <c:forEach var="rv" items="${reviews}">
                        [${rv.fullname}]: [${rv.reviewText}]<br/>
                    </c:forEach>
                    <c:if test="${empty reviews}">
                        <i>Chưa có review nào.</i>
                    </c:if>
                </td>
            </tr>

            <!-- Dòng 5: Form thêm review -->
            <tr>
                <td colspan="2" style="vertical-align: top;">
                    Form thêm reviews<br/><br/>
                    
                    <c:choose>
                        <c:when test="${not empty sessionScope.USER_MODEL}">
                            <form action="${pageContext.request.contextPath}/book-detail" method="post">
                                <input type="hidden" name="bookid" value="${book.bookid}" />
                                <textarea name="review_text" rows="3" style="width: 100%; max-width: 500px;" required placeholder="Viết đánh giá..."></textarea>
                                <br/><br/>
                                <button type="submit">[Submit]</button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <i>(Bạn cần <a href="${pageContext.request.contextPath}/login">Đăng nhập</a> để thêm review)</i>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
