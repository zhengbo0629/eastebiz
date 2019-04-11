package com.eastebiz.service;

import com.eastebiz.entity.EbizUser;

import java.util.Date;

public interface EbizUserSevice {

    //注册
    public void registerEbizUser(EbizUser ebizUser);

    //登录
    public EbizUser loginEbizUser(String userName,String password);

    //查询用户是否是存在
    public EbizUser queryOneUerName(String uerName);

    //修改登录时间
    public void updateTime(Integer id, Date updateTime);

    //修改信息
    public void updateEbizUser(EbizUser ebizUser);

    //查询地址
    public EbizUser selectAddress(Integer id);
}
