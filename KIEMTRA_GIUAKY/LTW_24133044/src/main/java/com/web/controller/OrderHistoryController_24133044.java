package com.web.controller;

import com.web.model.Order_24133044;
import com.web.model.User_24133044;
import com.web.service.IOrderService_24133044;
import com.web.service.OrderServiceImpl_24133044;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/order-history")
public class OrderHistoryController_24133044 extends HttpServlet {
    private IOrderService_24133044 orderService = new OrderServiceImpl_24133044();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User_24133044 user = (User_24133044) session.getAttribute("USER_MODEL");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String statusFilter = request.getParameter("status");
        request.setAttribute("selectedStatus", statusFilter);

        List<Order_24133044> orders = orderService.getOrdersByUserId(user.getId(), statusFilter);
        request.setAttribute("orders", orders);
        
        request.getRequestDispatcher("/views/order_history.jsp").forward(request, response);
    }
}

