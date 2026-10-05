package com.web.model;

import java.util.Date;
import java.util.List;

public class Order_24133044 {
    private int orderId;
    private int userId;
    private Date orderDate;
    private double totalAmount;
    private String status;
    private String shippingAddress;
    private String paymentMethod;
    private List<OrderItem_24133044> orderItems;

    // Getters and Setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }
    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getShippingAddress() { return shippingAddress; }
    public void setShippingAddress(String shippingAddress) { this.shippingAddress = shippingAddress; }
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    public List<OrderItem_24133044> getOrderItems() { return orderItems; }
    public void setOrderItems(List<OrderItem_24133044> orderItems) { this.orderItems = orderItems; }
}

