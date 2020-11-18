package com.J2007.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(value = {"handler"}) // 忽略类中不存在的数据
public class Blog implements Serializable {
    private Integer blogId;
    private String title;
    private String content;
    private Categroy categroy;
    private String user_desc;
    private String picture;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // 入参限制
    @JsonFormat( // 出参限制
            pattern = "yyyy-MM-dd HH:mm:ss",
            timezone = "GMT+8"
    )
    private Date publishTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",
            timezone = "GMT+8"
    )
    private Date lastModifyTime;
    private User user;
    private Integer readNum;
    private Integer commentNum;

}
