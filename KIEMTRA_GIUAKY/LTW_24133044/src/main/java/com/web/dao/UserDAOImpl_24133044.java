package com.web.dao;

import com.web.model.User_24133044;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class UserDAOImpl_24133044 implements IUserDAO_24133044 {

    @Override
    public boolean registerUser(User_24133044 user) {
        String sql = "INSERT INTO users (email, fullname, phone, passwd, signup_date, is_admin) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection_24133044.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getFullname());
            ps.setInt(3, user.getPhone());
            ps.setString(4, user.getPasswd());
            ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            ps.setBoolean(6, false); 
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User_24133044 login(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND passwd = ?";
        try (Connection conn = DBConnection_24133044.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User_24133044 user = new User_24133044();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getInt("phone"));
                user.setAdmin(rs.getBoolean("is_admin"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
