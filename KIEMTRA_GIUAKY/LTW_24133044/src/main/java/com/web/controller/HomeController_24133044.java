package com.web.controller;

import com.web.model.Book_24133044;
import com.web.service.BookServiceImpl_24133044;
import com.web.service.IBookService_24133044;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/home", "/products"})
public class HomeController_24133044 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IBookService_24133044 bookService = new BookServiceImpl_24133044();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int page = 1;
        int pageSize = 3;
        
        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String priceRange = request.getParameter("priceRange");
        
        List<Book_24133044> listBooks = bookService.getBooksByPage(page, pageSize, author, publisher, priceRange);
        int totalBooks = bookService.getTotalBooks(author, publisher, priceRange);
        int totalPages = (int) Math.ceil((double) totalBooks / pageSize);
        if (totalPages == 0) totalPages = 1;

        request.setAttribute("listBooks", listBooks);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        
        request.setAttribute("selectedAuthor", author);
        request.setAttribute("selectedPublisher", publisher);
        request.setAttribute("selectedPriceRange", priceRange);

        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }
}