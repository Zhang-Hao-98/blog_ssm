package com.J2007.service.serviceImpl;

import com.J2007.mapper.UserMapper;
import com.J2007.pojo.User;
import com.J2007.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public boolean insertUser(User user) {
        user.setRegisterTime(new Date());
        user.setArticleNum(0);
        System.out.println(user);
        return userMapper.insertUser(user);
    }

    @Override
    public boolean deleteUserById(int userId) {
        boolean flag = userMapper.deleteUserById(userId);
        return flag;
    }

    @Override
    public boolean updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public User findById(int userId) {
        return userMapper.findById(userId);
    }

    @Override
    public User findByEmail(String email) {
        return userMapper.findByEmail(email);
    }

    @Override
    public List<User> finAll() {
        return null;
    }
}
