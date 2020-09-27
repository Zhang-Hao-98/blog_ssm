package com.J2007.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(value = {"handler"})
public class Blog implements Serializable {
    private Integer blogId;
    private String title;
    private String content;
    private Categroy categroy;
    private String user_desc;
    private String picture;
    private Date publishTime;
    private Date lastModifyTime;
    private User user;
    private Integer readNum;
    private Integer commentNum;

}
