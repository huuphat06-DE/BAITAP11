package com.web.controller;

import com.web.model.*;
import com.web.service.IOrderService_24133044;
import com.web.service.OrderServiceImpl_24133044;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutController_24133044 extends HttpServlet {
    private IOrderService_24133044 orderService = new OrderServiceImpl_24133044();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User_24133044 user = (User_24133044) session.getAttribute("USER_MODEL");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        request.getRequestDispatcher("/views/checkout.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User_24133044 user = (User_24133044) session.getAttribute("USER_MODEL");
        Cart_24133044 cart = (Cart_24133044) session.getAttribute("cart");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        String address = request.getParameter("address");
        String paymentMethod = "COD";

        Order_24133044 order = new Order_24133044();
        order.setUserId(user.getId());
        order.setTotalAmount(cart.getTotalAmount());
        order.setStatus("Đơn hàng mới");
        order.setShippingAddress(address);
        order.setPaymentMethod(paymentMethod);

        List<OrderItem_24133044> orderItems = new ArrayList<>();
        for (CartItem_24133044 cItem : cart.getItems()) {
            OrderItem_24133044 oItem = new OrderItem_24133044();
            oItem.setBookId(cItem.getBook().getBookid());
            oItem.setQuantity(cItem.getQuantity());
            oItem.setPrice(cItem.getBook().getPrice());
            orderItems.add(oItem);
        }
        order.setOrderItems(orderItems);

        int orderId = orderService.placeOrder(order);

        if (orderId > 0) {
            session.removeAttribute("cart");
            response.sendRedirect(request.getContextPath() + "/order-history?message=success");
        } else {
            response.sendRedirect(request.getContextPath() + "/checkout?error=failed");
        }
    }
}