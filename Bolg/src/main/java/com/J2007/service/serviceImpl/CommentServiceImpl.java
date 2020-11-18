package com.J2007.service.serviceImpl;

import com.J2007.mapper.CommentMapper;
import com.J2007.pojo.Comment;
import com.J2007.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zh
 * @Package com.J2007.service.serviceImpl
 * @date 2020/11/17 9:30
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;


    @Override
    public int AddComment(Comment comment) {
        return commentMapper.AddComment(comment);
    }

    @Override
    public List<Comment> findByAll() {
        return commentMapper.findAll();
    }

    @Override
    public List<Comment> findByBlog(int blog_id) {
        return commentMapper.findByBlog(blog_id);
    }

    @Override
    public List<Comment> findBySend(int com_send) {
        return commentMapper.findBySend(com_send);
    }

    @Override
    public boolean delComment(int com_id) {
        return commentMapper.delComment(com_id);
    }
}
