package com.J2007.service;

import com.J2007.pojo.User;

import java.util.List;

public interface UserService {

    boolean insertUser(User user);

    boolean deleteUserById(int userId);

    boolean updateUser(User user);

    User findById(int userId);

    User findByEmail(String email);

    List<User> finAll();
}
