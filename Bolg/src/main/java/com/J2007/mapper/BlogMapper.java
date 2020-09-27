package com.J2007.mapper;

import com.J2007.pojo.Blog;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface BlogMapper {

    @Insert("insert into blog " +
            "values(null,#{title}," +
            "#{content}," +
            "#{user_desc}," +
            "#{picture}," +
            "#{categroy.categroyId}," +
            "#{publishTime}," +
            "#{lastModifyTime}," +
            "#{user.userId}," +
            "#{readNum}," +
            "#{commentNum})")
    boolean insertBlog(Blog blog);

//    批量删除
    @Delete("<script>" +
            "delete from blog where blogid in " +
            "<foreach collection='array' item='id' index='no' open='(' separator=',' close=')'>" +
            "#{id} " +
            "</foreach>" +
            "</script>")
    boolean deleteBlog(int[] blogId);

    @Update("update blog set" +
            "title=#{title}," +
            "content=#{content}," +
            "user_desc=#{user_desc}," +
            "picture=#{picture}," +
            "categroyid=#{categroy.categroyId}," +
            "publishtime=#{publishTime}," +
            "lastModifyTime=#{lastModifyTime}," +
            "userid=#{user.userId}," +
            "readNum=#{readNum}," +
            "commentNum=#{commentNum}" +
            "where " +
            "blogid=#{blogId}")
    boolean updateBlog(Blog blog);

    @Select("select * from blog where blogid=#{blogId}")
    @Results(
            id = "blogMap",
            value = {
                    @Result(id = true,column = "blogid",property = "blogId"),
                    @Result(column = "categroyid",property = "categroy",
                    one = @One(select = "com.J2007.mapper.CategroyMapper.selectById",fetchType = FetchType.LAZY)),
                    @Result(column = "publishtime",property = "publishTime"),
                    @Result(column = "userid",property ="user",
                    one = @One(select = "com.J2007.mapper.UserMapper.findById",fetchType = FetchType.LAZY))
            }
    )
    Blog selectById(int blogId);

    @Select("select * from blog where userid=#{userId}")
    @ResultMap("blogMap")
    List<Blog> selectByUser(int userId);

    @Select("select * from blog")
    @ResultMap("blogMap")
    List<Blog> selectAll();
}
