package com.web.service;

import com.web.model.Order_24133044;
import java.util.List;

public interface IOrderService_24133044 {
    int placeOrder(Order_24133044 order);
    List<Order_24133044> getOrdersByUserId(int userId, String statusFilter);
}

