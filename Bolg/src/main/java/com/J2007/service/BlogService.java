package com.J2007.service;

import com.J2007.pojo.Blog;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface BlogService {

    boolean insertBlog(Blog blog);

    boolean deleteBlog(int[] blogId);

    boolean updateBlog(Blog blog);

    Blog findById(int blogId);

    PageInfo<Blog> findByUser(int userId, Integer pageNum, Integer pageSize);

    List<Blog> finAll();

    PageInfo<Blog> findBlogTysPage(Integer pageNum, Integer pageSize);

}
