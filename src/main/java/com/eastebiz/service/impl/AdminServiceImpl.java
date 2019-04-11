package com.eastebiz.service.impl;

import com.eastebiz.dao.AdminDao;
import com.eastebiz.entity.Admin;
import com.eastebiz.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("adminService")
@Transactional
public class AdminServiceImpl  implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)

    public Admin login(String adminName, String password) {
        return adminDao.selectOneAdmin(adminName,password);
    }
}
