package com.J2007.controller;

import com.J2007.pojo.Blog;
import com.J2007.pojo.Comment;
import com.J2007.pojo.User;
import com.J2007.service.CommentService;
import com.J2007.service.UserService;
import com.J2007.utils.State;
import javafx.scene.input.DataFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.crypto.Data;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author zh
 * @Package com.J2007.controller
 * @date 2020/11/17 9:43
 */
@Controller
@RequestMapping("/comment")
public class ComController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private UserService userService;

    @RequestMapping("addCom")
    @ResponseBody
    public Comment sendCom(@RequestParam("blog_id")int blog_id,@RequestParam("com_send") int send,@RequestParam("com_content") String content) throws Exception {
        User com_send = userService.findById(send);
        Date com_date = new Date();
        Comment comment = new Comment(0,blog_id,content,com_send,com_date);
        int n = commentService.AddComment(comment);
        if (n > 0) {
            return comment;
        } else {
            return null;
        }
    }

    @RequestMapping(value = "blogCom")
    @ResponseBody
    public List<Comment> findByBlog(@RequestParam("blog_id") int blog_id) {
        List<Comment> comList = commentService.findByBlog(blog_id);
        return comList;
    }



}
