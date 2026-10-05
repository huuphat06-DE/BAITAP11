package com.web.service;

import com.web.model.User_24133044;

public interface IUserService_24133044 {
    // Các hàm sẽ được code ở Câu 2
    boolean registerUser(User_24133044 user);
    User_24133044 login(String email, String password);
}
