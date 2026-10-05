package com.web.dao;

import com.web.model.Order_24133044;
import java.util.List;

public interface IOrderDAO_24133044 {
    int insertOrder(Order_24133044 order);
    List<Order_24133044> getOrdersByUserId(int userId, String statusFilter);
    Order_24133044 getOrderById(int orderId);
}

