package com.web.service;

import com.web.dao.IUserDAO_24133044;
import com.web.dao.UserDAOImpl_24133044;
import com.web.model.User_24133044;

public class UserServiceImpl_24133044 implements IUserService_24133044 {

    private IUserDAO_24133044 userDAO = new UserDAOImpl_24133044();

    @Override
    public boolean registerUser(User_24133044 user) {
        return userDAO.registerUser(user);
    }

    @Override
    public User_24133044 login(String email, String password) {
        return userDAO.login(email, password);
    }
}
