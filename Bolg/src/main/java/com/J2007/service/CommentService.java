package com.J2007.service;

import com.J2007.pojo.Comment;

import java.util.List;

/**
 * @author zh
 * @Package com.J2007.service
 * @date 2020/11/17 9:22
 */
public interface CommentService {

    public int AddComment(Comment comment);

    public List<Comment> findByAll();

    public List<Comment> findByBlog(int blog_id);

    public List<Comment> findBySend(int com_send);

    public boolean delComment(int com_id);
}
