package com.J2007.controller;

import com.J2007.pojo.Comment;
import com.J2007.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping("addCom")
    public boolean AddComment(@RequestBody Comment comment) {
        return commentService.AddComment(comment);
    }

    @RequestMapping(value = "blogCom")
    public List<Comment> findByBlog(@RequestParam("blog_id") int blog_id) {
        System.out.println("blog_id:"+blog_id);
        List<Comment> list =  commentService.findByBlog(blog_id);
        System.out.println(list);
        return list;
    }


}
