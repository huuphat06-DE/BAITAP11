package com.web.controller;

import com.web.model.Book_24133044;
import com.web.model.Review_24133044;
import com.web.model.User_24133044;
import com.web.service.BookServiceImpl_24133044;
import com.web.service.IBookService_24133044;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/book-detail"})
public class BookDetailController_24133044 extends HttpServlet {
    private IBookService_24133044 bookService = new BookServiceImpl_24133044();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Book_24133044 book = bookService.getBookById(id);
        List<Review_24133044> reviews = bookService.getReviewsForBook(id);
        
        req.setAttribute("book", book);
        req.setAttribute("reviews", reviews);
        req.getRequestDispatcher("/views/book_detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int bookid = Integer.parseInt(req.getParameter("bookid"));
        String text = req.getParameter("review_text");
        
        User_24133044 user = (User_24133044) req.getSession().getAttribute("USER_MODEL");
        if (user != null) {
            bookService.addReview(user.getId(), bookid, text);
        }
        resp.sendRedirect(req.getContextPath() + "/book-detail?id=" + bookid);
    }
}
