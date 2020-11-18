package com.J2007.mapper;

import com.J2007.pojo.Comment;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author zh
 * @Package com.J2007.mapper
 * @date 2020/11/17 8:43
 */
public interface CommentMapper {



    @Insert("insert into comment " +
            "values(" +
            "#{com_id}," +
            "#{blog_id}," +
            "#{com_content}," +
            "#{com_send.userId}," +
            "#{com_time})")
    int AddComment(Comment comment);

    @Select("select * from comment")
    @Results(
            id = "comMap",
            value = {
                    @Result(id = true,column = "com_id",property = "com_id"),
                    @Result(column = "blog_id",property = "blog_id"),
                    @Result(column = "com_content",property = "com_content"),
                    @Result(column = "com_send",property ="com_send",
                            one = @One(select = "com.J2007.mapper.UserMapper.findById",fetchType = FetchType.LAZY)),
                    @Result(column = "com_time",property = "com_time")
            }
    )
    List<Comment> findAll();

    @Select("select * from comment where blog_id = #{blog_id} order by com_time desc")
    @ResultMap("comMap")
    List<Comment> findByBlog(int blog_id);

    @Select("select * from comment where com_send = #{com_send} order by com_time desc")
    @ResultMap("comMap")
    List<Comment> findBySend(int com_send);

    @Delete("delete from comment where blog_id = #{blog_id}")
    boolean delComment(int com_id);
}
