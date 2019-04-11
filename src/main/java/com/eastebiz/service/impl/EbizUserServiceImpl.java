package com.eastebiz.service.impl;

import com.eastebiz.dao.EbizUserDao;
import com.eastebiz.entity.EbizUser;
import com.eastebiz.service.EbizUserSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;


@Service("ebizUserSevice")
@Transactional
public class EbizUserServiceImpl implements EbizUserSevice {

    @Autowired
    private EbizUserDao ebizUserDao;

    //注册
    @Override
    public void registerEbizUser(EbizUser ebizUser) {
        ebizUserDao.insertEbizUser(ebizUser);
    }

    //登录
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public EbizUser loginEbizUser(String userName,String password) {
        return ebizUserDao.selectOneEbizUser(userName, password);
    }

    //查询名字存不存在
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public EbizUser queryOneUerName(String uerName) {
        return ebizUserDao.selectOneUserName(uerName);
    }


    //修改登录时间
    @Override
    public void updateTime(Integer id, Date updateTime) {
        ebizUserDao.updateAndUpdateTime(id, updateTime);
    }


    //修改所有信息
    @Override
    public void updateEbizUser(EbizUser ebizUser) {
        ebizUserDao.updateEbizUser(ebizUser);
    }


    //查询地址
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public EbizUser selectAddress(Integer id) {
        return ebizUserDao.selectAddress(id);
    }

}
