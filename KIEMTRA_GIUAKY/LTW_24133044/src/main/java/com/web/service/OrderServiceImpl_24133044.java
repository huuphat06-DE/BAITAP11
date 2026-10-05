package com.web.service;

import com.web.dao.IOrderDAO_24133044;
import com.web.dao.OrderDAOImpl_24133044;
import com.web.model.Order_24133044;
import java.util.List;

public class OrderServiceImpl_24133044 implements IOrderService_24133044 {

    private IOrderDAO_24133044 orderDAO = new OrderDAOImpl_24133044();

    @Override
    public int placeOrder(Order_24133044 order) {
        return orderDAO.insertOrder(order);
    }

    @Override
    public List<Order_24133044> getOrdersByUserId(int userId, String statusFilter) {
        return orderDAO.getOrdersByUserId(userId, statusFilter);
    }
}

