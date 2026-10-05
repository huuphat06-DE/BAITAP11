package com.web.dao;

import com.web.model.Order_24133044;
import com.web.model.OrderItem_24133044;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl_24133044 implements IOrderDAO_24133044 {

    @Override
    public int insertOrder(Order_24133044 order) {
        String insertOrderSQL = "INSERT INTO orders (userid, total_amount, status, shipping_address, payment_method) VALUES (?, ?, ?, ?, ?)";
        String insertOrderItemSQL = "INSERT INTO order_items (order_id, bookid, quantity, price) VALUES (?, ?, ?, ?)";
        
        Connection conn = null;
        PreparedStatement psOrder = null;
        PreparedStatement psItem = null;
        ResultSet rs = null;
        int orderId = -1;

        try {
            conn = DBConnection_24133044.getConnection();
            conn.setAutoCommit(false);

            psOrder = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, order.getUserId());
            psOrder.setDouble(2, order.getTotalAmount());
            psOrder.setString(3, order.getStatus());
            psOrder.setString(4, order.getShippingAddress());
            psOrder.setString(5, order.getPaymentMethod());
            psOrder.executeUpdate();

            rs = psOrder.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            if (orderId > 0 && order.getOrderItems() != null) {
                psItem = conn.prepareStatement(insertOrderItemSQL);
                for (OrderItem_24133044 item : order.getOrderItems()) {
                    psItem.setInt(1, orderId);
                    psItem.setInt(2, item.getBookId());
                    psItem.setInt(3, item.getQuantity());
                    psItem.setDouble(4, item.getPrice());
                    psItem.addBatch();
                }
                psItem.executeBatch();
            }

            conn.commit();
        } catch (Exception e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (psOrder != null) try { psOrder.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (psItem != null) try { psItem.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        return orderId;
    }

    @Override
    public List<Order_24133044> getOrdersByUserId(int userId, String statusFilter) {
        List<Order_24133044> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE userid = ?";
        if (statusFilter != null && !statusFilter.isEmpty() && !statusFilter.equals("Tất cả")) {
            sql += " AND status = ?";
        }
        sql += " ORDER BY order_date DESC";

        try (Connection conn = DBConnection_24133044.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            if (statusFilter != null && !statusFilter.isEmpty() && !statusFilter.equals("Tất cả")) {
                ps.setString(2, statusFilter);
            }
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order_24133044 order = new Order_24133044();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("userid"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setShippingAddress(rs.getString("shipping_address"));
                order.setPaymentMethod(rs.getString("payment_method"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public Order_24133044 getOrderById(int orderId) {
        // Simple implementation if needed
        return null;
    }
}

