package com.J2007.mapper;

import com.J2007.pojo.Categroy;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CategroyMapper {

    @Select("select * from categroy")
    @Results(
            id = "categroyMap",
            value = {
                    @Result(id = true,column = "categroyid",property = "categroyId"),
            }
    )
    List<Categroy> selectALL();

    @Select("select * from categroy where categroyid=#{categroyId}")
    @ResultMap("categroyMap")
    Categroy selectById(int categroyId);
}
