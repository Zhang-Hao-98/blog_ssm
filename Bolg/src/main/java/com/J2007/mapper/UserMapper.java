package com.J2007.mapper;

import com.J2007.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper {

    @Insert("insert into user(username,password,email,registertime,articlenum,synopsis) values(#{userName},#{password},#{email},#{registerTime},#{articleNum},#{synopsis})")
    boolean insertUser(User user);

    @Delete("delete from user where userid=#{userId}")
    boolean deleteUserById(int userId);

    @Update("update user set username=#{userName},password=#{password},email=#{email},registertime=#{registerTime},articlenum=#{articleNum},synopsis=#{synopsis} where userid=#{userId}")
    boolean updateUser(User user);

    @Select("select * from user where userid=#{userId}")
    @Results(
            id = "userMap",
            value = {
                    @Result(id = true,column = "userid",property = "userId"),
                    @Result(column = "username",property = "userName"),
                    @Result(column = "password",property = "password"),
                    @Result(column = "email",property = "email"),
                    @Result(column = "registertime",property = "registerTime"),
                    @Result(column = "articlenum",property = "articleNum"),
                    @Result(column = "synopsis",property = "synopsis")
            }
    )
    User findById(int userId);

    @Select("select * from user where email=#{email}")
    @ResultMap("userMap")
    User findByEmail(String email);

    @Select("select * from user")
    @ResultMap("userMap")
    List<User> finAll();
}
