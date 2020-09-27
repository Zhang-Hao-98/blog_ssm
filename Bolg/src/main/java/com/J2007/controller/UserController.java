package com.J2007.controller;

import com.J2007.pojo.User;
import com.J2007.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("register")
    public String Register(@ModelAttribute("user")User user, ModelMap model) {
        if (userService.findByEmail(user.getEmail()) == null) {
            if (userService.insertUser(user)) {
                model.addAttribute("msg", "注册成功，前往登录");
                return "/login";
            } else {
                return "/register";
            }
        } else {
            model.addAttribute("msg", "该邮箱已注册，去往登录");
            return "/register";
        }
    }

    @PostMapping("login")
    public String Login(@ModelAttribute("user")User user, ModelMap model, String remmber, HttpSession session, HttpServletResponse response) throws UnsupportedEncodingException {
        User u = userService.findByEmail(user.getEmail());
        if (u != null && u.getPassword().equals(user.getPassword())) {
            if (remmber != null && remmber.equals("remmber")) {
                String email = URLEncoder.encode(u.getEmail(), "UTF-8");
                String password = URLEncoder.encode(u.getPassword(), "UTF-8");
                Cookie cookie = new Cookie(email, password);
                cookie.setMaxAge(60*60*24*7);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
            session.setAttribute("user", u);
            return "/blog-index";
        } else {
            model.addAttribute("msg", "用户名或密码错误");
            return "/login";
        }
    }

    @RequestMapping("loginOut")
    public String LoginOut(HttpSession session) {
        session.removeAttribute("user");
        session.invalidate();
        return "/login";
    }

    @ResponseBody
    @RequestMapping("getPassword")
    public String getPassword(String email,HttpServletRequest request) throws UnsupportedEncodingException {
        Cookie[] cookies = request.getCookies();
        String cooName = "";
        String password = "";
        for (Cookie cookie : cookies) {
           cooName = URLDecoder.decode(cookie.getName(), "UTF-8");
            if (cooName.equals(email)) {
                password = URLDecoder.decode(cookie.getValue(), "UTF-8");
                return password;
            }

        }
        return null;
    }

    @RequestMapping("update")
    public String Update(@ModelAttribute User user, HttpSession session, Model model) {
        System.out.println(user);
        user = haveUser(user);
        System.out.println(user);
        if (userService.updateUser(user)) {
            model.addAttribute("msg", "信息更新成功！");
            session.setAttribute("user", user);
        } else {
            model.addAttribute("msg", "信息更新失败！");
        }
        return "/user-index";
    }

    //对象判断
    public User haveUser(User user) {
        User newUser = userService.findById(user.getUserId());
        if (user.getUserName() != null) {
            newUser.setUserName(user.getUserName());
        }
        if (user.getPassword() != null) {
            newUser.setPassword(user.getPassword());
        }
        if (user.getEmail() != null) {
            newUser.setEmail(user.getEmail());
        }
        if (user.getRegisterTime() != null) {
            newUser.setRegisterTime(user.getRegisterTime());
        }
        if (user.getArticleNum() != null) {
            newUser.setArticleNum(user.getArticleNum());
        }
        if (user.getSynopsis() != null) {
            newUser.setSynopsis(user.getSynopsis());
        }
        return newUser;
    }
}