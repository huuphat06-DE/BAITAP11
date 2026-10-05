package com.web.controller;

import com.web.model.Book_24133044;
import com.web.model.CartItem_24133044;
import com.web.model.Cart_24133044;
import com.web.service.BookServiceImpl_24133044;
import com.web.service.IBookService_24133044;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartController_24133044 extends HttpServlet {
    private IBookService_24133044 bookService = new BookServiceImpl_24133044();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Cart_24133044 cart = (Cart_24133044) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart_24133044();
            session.setAttribute("cart", cart);
        }

        try {
            if ("add".equals(action)) {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Book_24133044 book = bookService.getBookById(bookId);
                if (book != null) {
                    // Check limit quantity if needed
                    if(quantity > book.getQuantity()) {
                         quantity = book.getQuantity();
                    }
                    cart.addItem(new CartItem_24133044(book, quantity));
                }
            } else if ("update".equals(action)) {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Book_24133044 book = bookService.getBookById(bookId);
                if (book != null && quantity > 0 && quantity <= book.getQuantity()) {
                    cart.updateQuantity(bookId, quantity);
                }
            } else if ("remove".equals(action)) {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                cart.removeItem(bookId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }
}

