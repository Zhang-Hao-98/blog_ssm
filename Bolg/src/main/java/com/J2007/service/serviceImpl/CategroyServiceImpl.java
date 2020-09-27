package com.J2007.service.serviceImpl;

import com.J2007.mapper.CategroyMapper;
import com.J2007.pojo.Categroy;
import com.J2007.service.CategroyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategroyServiceImpl implements CategroyService {

    @Autowired
    private CategroyMapper categroyMapper;

    @Override
    public List<Categroy> selectAll() {
        return categroyMapper.selectALL();
    }

    @Override
    public Categroy selectById(int categroyId) {
        return categroyMapper.selectById(categroyId);
    }
}
