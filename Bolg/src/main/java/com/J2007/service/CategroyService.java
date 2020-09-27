package com.J2007.service;

import com.J2007.pojo.Categroy;

import java.util.List;

public interface CategroyService {
    public List<Categroy> selectAll();

    public Categroy selectById(int categroyId);
}
