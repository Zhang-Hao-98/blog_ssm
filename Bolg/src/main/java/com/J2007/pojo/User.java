package com.J2007.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer userId;
    private String userName;
    private String password;
    private String email;
    @DateTimeFormat(pattern = "yyyy-MM--dd HH:mm:ss")
    private Date registerTime;
    private Integer articleNum;
    private String synopsis;

}
