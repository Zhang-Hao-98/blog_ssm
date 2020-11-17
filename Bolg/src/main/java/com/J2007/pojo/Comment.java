package com.J2007.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author zh
 * @Package com.J2007.pojo
 * @date 2020/11/11 15:25
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    private int com_id;
    private  Blog blog_id;
    private String com_content;
    private User com_send;
    private Date com_time;

}
