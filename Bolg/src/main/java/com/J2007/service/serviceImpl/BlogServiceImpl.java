package com.J2007.service.serviceImpl;

import com.J2007.mapper.BlogMapper;
import com.J2007.pojo.Blog;
import com.J2007.service.BlogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogMapper blogMapper;

    @Override
    public boolean insertBlog(Blog blog) {
        return blogMapper.insertBlog(blog);
    }

    @Override
    public boolean deleteBlog(int[] blogId) {
        System.out.println("service:"+blogId);
        return blogMapper.deleteBlog(blogId);
    }

    @Override
    public boolean updateBlog(Blog blog) {
        return blogMapper.updateBlog(blog);
    }

    @Override
    public Blog findById(int blogId) {
        return blogMapper.selectById(blogId);
    }

    @Override
    public PageInfo<Blog> findByUser(int userId,Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Blog> blogList = blogMapper.selectByUser(userId);
        PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogList);
        return pageInfo;
    }

    @Override
    public List<Blog> finAll() {
        return blogMapper.selectAll();
    }

//    分页

    @Override
    public PageInfo<Blog> findBlogTysPage(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Blog> blogList = blogMapper.selectAll();
        PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogList);
        return pageInfo;
    }
}
